+++
title = "A tale of Java Hash Tables"
description = "The intended audience for this article is undergrad students who already have a good grasp of Java, or seasoned Java developers who would like to explore an in-depth analysis of various hash table implementations that use Open Addressing.The reader should be familiar with Jav"
date = "2021-11-08T00:00:00Z"
url = "https://andreinc.net/2021/11/08/a-tale-of-java-hash-tables/"
author = "Andrei Ciobanu"
text = ""
lastupdated = "2026-03-18T21:57:49.215008407Z"
seen = true
+++

The intended audience for this article is undergrad students who already have a good grasp of Java, or seasoned Java developers who would like to explore an in-depth analysis of various *hash table* implementations that use *Open Addressing*.

The reader should be familiar with Java generics, collections, basic data structures, hash functions, and bitwise operations.

Contents
----------

* [Introduction](#introduction)
  * [Standard Implementations by Language](#standard-implementations-by-language)
  * [Objectives and Scope](#objectives-and-scope)
    * [The Contenders](#the-contenders)
    * [Getting Started](#getting-started)

* [Separate Chaining, or how `HashMap<K,V>` works internally](#separate-chaining-or-how-hashmapkv-works-internally)
  * * [The Table and the Nodes](#the-table-and-the-nodes)
    * [Mapping Cities: An Example](#mapping-cities-an-example)
    * [The “Magic” of Bucket Indexing](#the-magic-of-bucket-indexing)
    * [Retrieval: Following the Trail](#retrieval-following-the-trail)
    * [Performance Optimizations](#performance-optimizations)

* [Open Addressing](#open-addressing)
  * [Tombstones](#tombstones)
  * [`LProbMap<K, V>`](#lprobmapk-v)
    * [The Hash Function](#the-hash-function)
    * [Inserting an Entry](#inserting-an-entry)
    * [The Bitwise Modulo Trick](#the-bitwise-modulo-trick)
    * [Retrieving an Entry](#retrieving-an-entry)
    * [Deleting an Entry](#deleting-an-entry)
    * [Resizing and Rehashing](#resizing-and-rehashing)

  * [`LProbSOAMap<K,V>`](#lprobsoamapkv)
  * [`PerturbMap<K, V>`](#perturbmapk-v)
    * [Scrambling the Search Path](#scrambling-the-search-path)
    * [A Practical Example](#a-practical-example)
    * [Implementation of `get(Object key)`](#implementation-of-getobject-key)
    * [Performance Trade-offs](#performance-trade-offs)

  * [`LProbBinsMap<K,V>`](#lprobbinsmapkv)
    * [Separating Metadata from Data](#separating-metadata-from-data)
    * [Implementation of `get(Object key)`](#implementation-of-getobject-key-1)
    * [Advantages of the “Bins” Approach](#advantages-of-the-bins-approach)

  * [`LProbRadarMap<K, V>`](#lprobradarmapk-v)
    * [How the Radar Works](#how-the-radar-works)
    * [Insertion Logic](#insertion-logic)
    * [Retrieval Logic](#retrieval-logic)
    * [Analysis and Risks](#analysis-and-risks)

  * [`RobinHoodMap<K, V>`](#robinhoodmapk-v)
    * [The “Rich” and the “Poor”](#the-rich-and-the-poor)
    * [Implementation of `put`](#implementation-of-put)
    * [Why use Robin Hood Hashing?](#why-use-robin-hood-hashing)

* [Benchmarks](#benchmarks)
  * * [Benchmark Configuration](#benchmark-configuration)

  * [Data Generation Strategies](#data-generation-strategies)
    * [1. `RandomStringsReads`](#1-randomstringsreads)
    * [2. `SequencedStringsReads`](#2-sequencedstringsreads)
    * [3. `AlphaNumericCodesReads`](#3-alphanumericcodesreads)

  * [The Results](#the-results)
    * [Including `LProbSOAMap<K,V>`](#including-lprobsoamapkv)

* [Wrapping Up](#wrapping-up)
  * * [Discussion](#discussion)

Introduction
==========

In Java, the primary hash table implementation, `HashMap<K,V>`, employs the classical **Separate Chaining** technique with its critical optimizations (such as treeifying bins) to reduce read times during high-collision scenarios.