+++
title = "Cheaper LLM labelling"
description = " I have a small project where I needed to label commits as either “maintenance” or “new development”. The obvious way to do it is with a cheap but relatively capable LLM, like GPT 5.6 Luna. I tested it on a small set of commits and manually verified its labelling, and it emitted "
date = "2026-09-21T22:00:00Z"
url = "https://entropicthoughts.com/cheaper-llm-labeling"
author = "a@xkqr.org (kqr)"
text = ""
lastupdated = "2026-09-23T18:24:54.387581484Z"
seen = false
+++

 I have a small project where I needed to label commits as either “maintenance” or “new development”. The obvious way to do it is with a cheap but relatively capable LLM, like GPT 5.6 Luna. I tested it on a small set of commits and manually verified its labelling, and it emitted the same label as I would have for the entire test set. That was good enough for me to roll out on a wider scale.

 If we have Simon Willison’s `llm` CLI tool installed (and you should – it’s great!), we can call it in a pipe from Perl, and read its response. My script had a loop that retried the request a few times, but without that bookkeeping, the code for this is simple enough.

In[1]:

```
sub classify {
    my ($msg) = @_;
    my $pid = open2(
        my $output,
        my $prompt,
        'llm -m openrouter/openai/gpt-5.6-luna'
    );
    print $prompt prompt_template($msg);
    close $prompt;

    # Slurp the entire response and chomp off the
    # trailing newline.
    chomp(my $result = do { local $/; <$output> });
    waitpid($pid, 0);

    return $result;
}

```

[(Continue reading the full article on the web.)](https://entropicthoughts.com/cheaper-llm-labeling)