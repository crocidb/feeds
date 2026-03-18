+++
title = "XML to JSON using MapNeat"
description = "mapneat is a library I’ve written a long time ago. I am biased.IntroductionFollowing my previous article, I wanted to expand on the capabilities of the mapneat library.In this tutorial, I w"
date = "2021-02-01T00:00:00Z"
url = "https://andreinc.net/2021/02/01/xml-to-json-using-mapneat/"
author = "Andrei Ciobanu"
text = ""
lastupdated = "2026-03-18T21:57:49.226050402Z"
seen = false
+++

>
>
> mapneat is a library I’ve written a long time ago. I am biased.
>
>

Introduction
==========

Following my [previous article](./2021/01/31/hello-world-mapneat), I wanted to expand on the capabilities of the [mapneat](https://github.com/nomemory/mapneat) library.

In this tutorial, I will show you how to transform an existing XML source into a specifically structured JSON format.

The Source XML
==========

We will start with a customer record that includes nested visit data and attributed email tags:

```
<customer>
    <firstname>Mike</firstname>
    <lastname>Smith</lastname>
    <visits count="3">
        <visit>
            <country>France</country>
            <date>2010-01-22</date>
        </visit>
        <visit>
            <country>Italy</country>
            <date>1983-01-22</date>
        </visit>
        <visit>
            <country>Romania</country>
            <date>2010-01-22</date>
        </visit>
        <visit>
            <country>Bulgaria</country>
            <date>2010-01-25</date>
        </visit>        
    </visits>
    <email type="business">mail@bsi.com</email>
    <email type="personal">mail@pers.com</email>
    <age>67</age>
</customer>

```

The Transformation Goal
==========

The objective is to morph this XML into a JSON that: