+++
title = "Writing a simple file monitor in Java using Commons IO"
description = "Even though Java 7 introduced a low-level API to watch for file system changes (see the article here), you also have the option of using the Commons IO library from the [Apache Foundation"
date = "2012-06-30T00:00:00Z"
url = "https://andreinc.net/2012/06/30/writing-a-simple-file-monitor-in-java-using-commons-io/"
author = "Andrei Ciobanu"
text = ""
lastupdated = "2026-03-18T21:57:49.247284371Z"
seen = true
+++

Even though Java 7 introduced a low-level API to watch for file system changes (see the article [here](http://java.dzone.com/news/how-watch-file-system-changes)), you also have the option of using the [Commons IO](http://commons.apache.org/io/) library from the [Apache Foundation](http://www.apache.org/), specifically the [org.apache.commons.io.monitor](http://commons.apache.org/io/api-release/index.html?org/apache/commons/io/monitor/package-summary.html) package.

The first step is to define the location that we are going to monitor:

```
public static final String FOLDER =
        "/home/skywalker/Desktop/simple-test-monitor/watchdir";

```

Next, we define a polling interval: this determines how often the system “looks” for file system changes. The value is expressed in milliseconds: