+++
title = "Writing a Universal Chess Interface (UCI) Client in Java"
description = "Contents Introduction Working with an UCI-enabled engine from the command line   Installing Stockfish (and Leela Zero)   [Listing supported options]"
date = "2021-04-22T00:00:00Z"
url = "https://andreinc.net/2021/04/22/writing-a-universal-chess-interface-uci-client-in-java/"
author = "Andrei Ciobanu"
text = ""
lastupdated = "2026-03-18T21:57:49.222079728Z"
seen = false
+++

Contents
----------

* [Introduction](#introduction)
* [Working with an UCI-enabled engine from the command line](#working-with-an-uci-enabled-engine-from-the-command-line)
  * [Installing Stockfish (and Leela Zero)](#installing-stockfish-and-leela-zero)
  * [Listing supported options](#listing-supported-options)
  * [Changing an option](#changing-an-option)
  * [Analyzing a position](#analyzing-a-position)

* [Writing the Java UCI Client library](#writing-the-java-uci-client-library)
  * [Opening and closing the engine process](#opening-and-closing-the-engine-process)
  * [Sending commands to the engine](#sending-commands-to-the-engine)
  * [Example: Getting the best move](#example-getting-the-best-move)
  * [Example: Retrieving the 10 best moves](#example-retrieving-the-10-best-moves)

* [Going further](#going-further)
* [References](#references)

Introduction
==========

>
>
> I love chess; it’s just that chess doesn’t love me back.
>
>

Recently my interest in chess surged (I blame Corona), so I decided to write a set of tools for creating statistics about my games—I am a programmer, after all.