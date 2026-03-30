+++
title = "Implementing Hash Tables in C"
description = "Table of contentsContents Table of contents Code Introduction   C++ (unordered_map)   Java (HashMap)   Python (dict)  * [Performance: Why Size Does"
date = "2021-10-02T00:00:00Z"
url = "https://andreinc.net/2021/10/02/implementing-hash-tables-in-c/"
author = "Andrei Ciobanu"
text = ""
lastupdated = "2026-03-18T21:57:49.219015633Z"
seen = true
+++

Table of contents
==========

Contents
----------

* [Table of contents](#table-of-contents)
* [Code](#code)
* [Introduction](#introduction)
  * [C++ (`unordered_map`)](#c-unordered_map)
  * [Java (`HashMap`)](#java-hashmap)
  * [Python (`dict`)](#python-dict)
  * [Performance: Why Size Doesn’t Matter](#performance-why-size-doesnt-matter)

* [Hash Functions](#hash-functions)
  * * [Hash Collisions](#hash-collisions)
    * [What makes a “Good” Hash Function?](#what-makes-a-good-hash-function)
    * [Families of Hashing Functions](#families-of-hashing-functions)

  * [Division hashing](#division-hashing)
  * [Multiplicative hashing](#multiplicative-hashing)
  * [Hashing strings](#hashing-strings)
    * [The Rolling Hash Template](#the-rolling-hash-template)
    * [djb2](#djb2)
    * [sdbm](#sdbm)

  * [Reducing collisions: Finalizers](#reducing-collisions-finalizers)
  * [More exploration](#more-exploration)

* [Implementing Hash Tables](#implementing-hash-tables)
  * * [1. Separate Chaining](#1-separate-chaining)
    * [2. Open Addressing](#2-open-addressing)

  * [Separate Chaining (using Linked Lists)](#separate-chaining-using-linked-lists)
    * [The Multi-Step Hashing Process](#the-multi-step-hashing-process)

  * [A Generic Implementation](#a-generic-implementation)
    * [The Model](#the-model)
      * [Data-Specific Operations: The Contract](#data-specific-operations-the-contract)
      * [Implementation Example: Strings](#implementation-example-strings)

    * [The Interface](#the-interface)
      * [Dynamic Resizing and Rehashing](#dynamic-resizing-and-rehashing)
      * [Internal Node Retrieval](#internal-node-retrieval)
      * [Creating/Destroying a **hash table**](#creatingdestroying-a-hash-table)
      * [Retrieving a value from the **hash table**](#retrieving-a-value-from-the-hash-table)
      * [Adding an entry to the **hash table**](#adding-an-entry-to-the-hash-table)
      * [Scaling: The `ch_hash_grow` Method](#scaling-the-ch_hash_grow-method)
      * [Printing the contents of a **hash table**](#printing-the-contents-of-a-hash-table)
      * [Calculating collisions](#calculating-collisions)

    * [Using the **hash table**](#using-the-hash-table)

  * [Separate Chaining (Dynamically growing array buckets)](#separate-chaining-dynamically-growing-array-buckets)
    * [Writing a `vector`-like structure for our buckets: `ch_vect`](#writing-a-vector-like-structure-for-our-buckets-ch_vect)
      * [The model](#the-model-1)
      * [The interface](#the-interface-1)
      * [Memory Management](#memory-management)
      * [Appending and Growing](#appending-and-growing)

    * [Updating `ch_hash` to `ch_hashv`](#updating-ch_hash-to-ch_hashv)

  * [Separate Chaining (Red-Black Trees Optimization)](#separate-chaining-red-black-trees-optimization)
  * [Open Addressing](#open-addressing)
    * [Linear Probing](#linear-probing)
    * [The Problem of Clustering](#the-problem-of-clustering)
    * [Beyond Linear Probing](#beyond-linear-probing)
    * [Why use Open Addressing?](#why-use-open-addressing)
    * [Tombstones](#tombstones)
      * [The Sentinel Solution](#the-sentinel-solution)
      * [Managing Tombstone Density](#managing-tombstone-density)

    * [A Generic Implementation](#a-generic-implementation-1)
      * [The Model](#the-model-2)
      * [Probing Strategies](#probing-strategies)
      * [Configuration Constants](#configuration-constants)
      * [The interface](#the-interface-2)
      * [Creating/Destroying a **hash table**](#creatingdestroying-a-hash-table-1)
      * [Modeling Tombstones](#modeling-tombstones)
      * [Putting it all together](#putting-it-all-together)

    * [References](#references)

Code
==========

If you want to skip the theory and dive straight into the implementation, you can find the source code here: