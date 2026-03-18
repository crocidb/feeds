+++
title = "Demystifying bitwise operations, a gentle C tutorial"
description = "Contents Introduction Number systems A certain symmetry and patterns Numbers and Data Types in C* [Transforming numbers from decimal to other number systems (bina"
date = "2023-02-01T00:00:00Z"
url = "https://andreinc.net/2023/02/01/demystifying-bitwise-operations-a-gentle-c-tutorial/"
author = "Andrei Ciobanu"
text = ""
lastupdated = "2026-03-18T21:57:49.187279306Z"
seen = false
+++

Contents
----------

* [Introduction](#introduction)
* [Number systems](#number-systems)
* [A certain symmetry and patterns](#a-certain-symmetry-and-patterns)
* [Numbers and Data Types in C](#numbers-and-data-types-in-c)
* [Transforming numbers from decimal to other number systems (binary, hexadecimal, etc.)](#transforming-numbers-from-decimal-to-other-number-systems-binary-hexadecimal-etc)
* [Bitwise operations](#bitwise-operations)
  * [Bitwise AND](#bitwise-and)
  * [Bitwise OR](#bitwise-or)
  * [Bitwise XOR](#bitwise-xor)
  * [Bitwise NOT](#bitwise-not)
  * [Left Shift](#left-shift)
  * [Right Shift](#right-shift)

* [Negative numbers and their binary representation](#negative-numbers-and-their-binary-representation)
* [Pitfalls to avoid when using bitwise operations](#pitfalls-to-avoid-when-using-bitwise-operations)
* [Mandatory Computer Science Exercise - The Solitary Integer](#mandatory-computer-science-exercise---the-solitary-integer)
* [Printing numbers in binary by using bitwise operations](#printing-numbers-in-binary-by-using-bitwise-operations)
* [Masking](#masking)
* [The power of masking - Pairwise Swap](#the-power-of-masking---pairwise-swap)
* [Getting, Setting, Clearing, and Toggling the `nth` bit](#getting-setting-clearing-and-toggling-the-nth-bit)
  * [Getting the `nth` bit of a number](#getting-the-nth-bit-of-a-number)
  * [Setting and Clearing the `nth` bit of a number](#setting-and-clearing-the-nth-bit-of-a-number)
  * [Toggling the `nth` bit of a number](#toggling-the-nth-bit-of-a-number)

* [Clearing and Replacing a bit portion of a number](#clearing-and-replacing-a-bit-portion-of-a-number)
  * [Clearing the last bits of a number](#clearing-the-last-bits-of-a-number)
  * [Replacing multiple bits](#replacing-multiple-bits)
  * [Reading multiple bits](#reading-multiple-bits)

* [Bitwise operations and their relationship with the powers of two](#bitwise-operations-and-their-relationship-with-the-powers-of-two)
  * [Multiplying a number by a power of two](#multiplying-a-number-by-a-power-of-two)
  * [Dividing a number by a power of two](#dividing-a-number-by-a-power-of-two)
  * [Checking if a number is even or odd](#checking-if-a-number-is-even-or-odd)
  * [Getting the remainder when we divide by a power of two](#getting-the-remainder-when-we-divide-by-a-power-of-two)
  * [Determining if an integer is a power of two](#determining-if-an-integer-is-a-power-of-two)
  * [Getting the next power of two](#getting-the-next-power-of-two)

* [Implementing a BitSet (or BitVector)](#implementing-a-bitset-or-bitvector)
  * [`SET_NW`](#set_nw)
  * [`SET_W`](#set_w)
  * [`SET_MASK`](#set_mask)
  * [`SET_DECLARE`](#set_declare)
  * [`SET_1` and `SET_0`](#set_1-and-set_0)
  * [`SET_GET`](#set_get)
  * [Using the `BitSet`](#using-the-bitset)

* [Swapping two numbers](#swapping-two-numbers)
* [Bitwise operations and chars](#bitwise-operations-and-chars)
* [Around the web](#around-the-web)
* [References](#references)

Introduction
==========

Bitwise operations are a fundamental part of Computer Science. They help software engineers gain a deeper understanding of how computers represent and manipulate data, and they are crucial when writing performance-critical code.