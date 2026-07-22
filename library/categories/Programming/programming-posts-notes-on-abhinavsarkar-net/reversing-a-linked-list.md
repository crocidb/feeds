+++
title = "Reversing a Linked-list"
description = "Reversing a Linked List in Java with old-fashioned pointers.`public class LinkedList<T{    private Node<Thead;    public LinkedList(Node<Thead) {        this.head = head;    }    public static class Node<T{        private T v"
date = "2019-06-18T00:00:00Z"
url = "https://abhinavsarkar.net/notes/2019-linked-list/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-07-21T09:17:41.666634040Z"
seen = false
+++

Reversing a [Linked List](https://en.wikipedia.org/wiki/Linked_list) in Java with old-fashioned pointers.

```
public class LinkedList<T> {
    private Node<T> head;

    public LinkedList(Node<T> head) {
        this.head = head;
    }

    public static class Node<T> {
        private T value;
        private Node<T> next;

        public Node(T value, Node<T> next) {
            this.value = value;
            this.next = next;
        }
    }

    public void reverse() {
        Node<T> curr = head;
        if (curr == null) {
            return;
        }

        Node<T> prev = null;
        Node<T> next = curr.next;
        while (next != null) {
            curr.next = prev;
            prev = curr;
            curr = next;
            next = curr.next;
        }

        curr.next = prev;
        head = curr;
    }

    @Override
    public String toString() {
        return "[" + toStringInternal(head) + "]";
    }

    private String toStringInternal(Node<T> node) {
        if (node == null) {
            return "";
        } else if (node.next == null) {
            return node.value.toString();
        } else {
            return node.value + ", " + toStringInternal(node.next);
        }
    }
}
```

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/notes/2019-linked-list/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [My website](https://abhinavsarkar.net/notes/2019-linked-list/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)