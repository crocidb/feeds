+++
title = "Customizing Miniflux: Sorting by Similarity"
description = "As mentioned by in a previous note, I have customized Miniflux, my preferred feed reader, to add custom sorting for the articles. Recently, I added another sorting option: sorting by similarity"
date = "2025-09-30T00:00:00Z"
url = "https://abhinavsarkar.net/notes/2025-miniflux-similar-sorting/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-07-21T09:17:41.464986783Z"
seen = false
+++

As mentioned by in [a previous note](https://abhinavsarkar.net/notes/2025-customizing-miniflux/?mtm_campaign=feed), I have customized [Miniflux](https://miniflux.app/), my preferred feed reader, to add custom sorting for the articles. Recently, I added another sorting option: sorting by similarity. I kept finding myself wanting to read articles grouped by their topics, instead of hopping from topic to topic while going through my feed. So I build it.

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/notes/2025-miniflux-similar-sorting/?mtm_campaign=feed).

This post is a part of the series: **Customizing Miniflux**.

1. [Making a Two-Pane Reader](https://abhinavsarkar.net/notes/2024-customizing-miniflux/?mtm_campaign=feed)
2. [Addding Custom Sorting](https://abhinavsarkar.net/notes/2025-customizing-miniflux/?mtm_campaign=feed)
3. **Sorting by Similarity** 👈

![Screenshot of the Miniflux reader showing articles sorted by similarity](https://fantastic.earth/system/media_attachments/files/115/282/065/166/451/598/small/13587c60f959bdf4.png) Screenshot of the Miniflux reader showing articles sorted by similarity

The idea is to use the words in the article titles to find similar articles and group them together. Here is how the process works:

1. I get article titles from the page using JavaScript DOM functions.
2. I tokenize the article titles, remove stop words and stem the tokens (with a very basic suffix based stemming algorithm).
3. I calculate [TF-IDF](https://en.wikipedia.org/wiki/TF-IDF) score vectors for each article, where each word of the vocabulary (of the entire titles corpus) is an index in the vectors.
4. I use [cosine similarity](https://en.wikipedia.org/wiki/cosine_similarity) between the article vectors with a threshold to group the similar articles.
5. I sort groups by descending size, and flatten them to get the final list of sorted articles.
6. I reorder articles on the page.

Now I can read articles grouped by topics, and I can also do the opposite if I do not want to commit myself to a topic. I just go to the bottom of my feed, and read articles not falling in any groups.

<details> <summary> Here is the code that plugs into the code in [the previous post](https://abhinavsarkar.net/notes/2025-customizing-miniflux/?mtm_campaign=feed) </summary>

```
const SIMILARITY_THRESHOLD = 0.4;

const stemmerSuffixes = {
  ally: 4,
  ing: 3,
  ly: 2,
  ed: 2,
  es: 2,
  al: 2,
  s: 1,
};

const stopwords = new Set([
  "a", "about", "above", "after", "again", "against", "all", "am", "an", "and",
  "any", "are", "as", "at", "be", "because", "been", "before", "being", "below",
  "between", "both", "but", "by", "can", "did", "do", "does", "don", "doing",
  "down", "during", "each", "ever", "every", "few", "for", "from", "further",
  "had", "has", "have", "having", "he", "her", "here", "hers", "herself", "him",
  "himself", "his", "how", "i", "if", "in", "into", "is", "it", "its", "itself",
  "just", "me", "more", "most", "my", "myself", "no", "nor", "not", "now", "of",
  "off", "on", "once", "only", "or", "other", "our", "ours", "ourselves", "out",
  "over", "own", "same", "she", "should", "so", "some", "such", "than", "that",
  "the", "their", "theirs", "them", "themselves", "then", "there", "these",
  "they", "this", "those", "through", "to", "too", "under", "until", "up", "us",
  "very", "was", "we", "were", "what", "when", "where", "which", "while", "who",
  "whom", "why", "will", "with", "year", "you", "your", "yours", "yourself"
]);

function tokenize(text) {
  const tokens = text.toLowerCase().match(/\b\w+\b/g) || [];
  const filteredTokens = tokens.filter(
    (t) => t.length > 1 && !t.match(/\b\d+\b/) && !stopwords.has(t),
  );
  const stemmedTokens = filteredTokens.map((token) => {
    for (const suffix in stemmerSuffixes) {
      if (token.endsWith(suffix)) {
        return token.substring(0, token.length - stemmerSuffixes[suffix]);
      }
    }
    return token;
  });
  return stemmedTokens;
}

function computeIdf(documents) {
  const idf = new Map();
  const count = documents.length;
  const docFreq = new Map();

  for (const doc of documents) {
    const uniqueTerms = new Set(doc);
    for (const term of uniqueTerms) {
      docFreq.set(term, (docFreq.get(term) || 0) + 1);
    }
  }

  for (const [term, freq] of docFreq.entries()) {
    idf.set(term,  Math.log(count / (1 + freq)));
  }

  return idf;
}

function computeTfIdf(tokens, idf) {
  const tf = new Map();
  for (const token of tokens) {
    tf.set(token, (tf.get(token) || 0) + 1);
  }

  const tfIdfVector = new Map();
  for (const [token, tokenTf] of tf.entries()) {
    const tfValue = tokenTf / tokens.length;
    const idfValue = idf.get(token) || 0;
    tfIdfVector.set(token, tfValue * idfValue);
  }

  return tfIdfVector;
}

function cosineSimilarity(vecA, vecB) {
  let dotProduct = 0;
  let normA = 0;
  let normB = 0;

  const allKeys = new Set([...vecA.keys(), ...vecB.keys()]);

  for (const key of allKeys) {
    const valA = vecA.get(key) || 0;
    const valB = vecB.get(key) || 0;
    dotProduct += valA * valB;
    normA += valA * valA;
    normB += valB * valB;
  }

  normA = Math.sqrt(normA);
  normB = Math.sqrt(normB);

  if (normA === 0 || normB === 0) {
    return 0;
  }

  return dotProduct / (normA * normB);
}

function findSimilarityGroups(entries, vectors) {
  const adj = new Map();
  for (let i = 0; i < entries.length; i++) {
    adj.set(i, []);
  }

  for (let i = 0; i < vectors.length; i++) {
    for (let j = i + 1; j < vectors.length; j++) {
      const similarity = cosineSimilarity(vectors[i], vectors[j]);
      if (similarity > SIMILARITY_THRESHOLD) {
        adj.get(i).push(j);
        adj.get(j).push(i);
      }
    }
  }

  const groups = [];
  const visited = new Set();
  for (let i = 0; i < entries.length; i++) {
    if (!visited.has(i)) {
      const group = [];
      const q = [i];
      visited.add(i);
      while (q.length > 0) {
        const u = q.shift();
        group.push(entries[u]);
        for (const v of adj.get(u)) {
          if (!visited.has(v)) {
            visited.add(v);
            q.push(v);
          }
        }
      }
      groups.push(group);
    }
  }
  return groups;
}

function sortEntriesBySimilarity(entries) {
  const titles = entries.map(entryTitle);
  const documents = titles.map(tokenize);
  const idfMap = computeIdf(documents);
  const vectors = documents.map((doc) => computeTfIdf(doc, idfMap));
  const groups = findSimilarityGroups(entries, vectors);
  groups.sort((a, b) => b.length - a.length);
  return groups.flat();
}

function entryTitle(e) {
  return e.querySelector(".item-title a").innerText;
}
```

</details>

That’s it! This works very well for me, and I hope this helps someone else too.

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

This post is a part of the series: **Customizing Miniflux**.

1. [Making a Two-Pane Reader](https://abhinavsarkar.net/notes/2024-customizing-miniflux/?mtm_campaign=feed)
2. [Addding Custom Sorting](https://abhinavsarkar.net/notes/2025-customizing-miniflux/?mtm_campaign=feed)
3. **Sorting by Similarity** 👈

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/notes/2025-miniflux-similar-sorting/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [Fediverse](https://fantastic.earth/@abnv/115294001022688804)
* [Reddit](https://www.reddit.com/r/rss/comments/1nws9c1/)
* [My website](https://abhinavsarkar.net/notes/2025-miniflux-similar-sorting/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)