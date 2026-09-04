+++
title = "Computing Eigenvalues and Eigenvectors using QR Decomposition"
description = "Contents Introduction Using QR Decomposition to Determine Eigenvalues   Implementing the Naive Algorithm [Improving the Algorithm: Practical QR with Shifts](im"
date = "2021-01-25T00:00:00Z"
url = "https://andreinc.net/2021/01/25/computing-eigenvalues-and-eigenvectors-using-qr-decomposition/"
author = "Andrei Ciobanu"
text = ""
lastupdated = "2026-03-18T21:57:49.231647599Z"
seen = true
+++

Contents
----------

* [Introduction](#introduction)
* [Using QR Decomposition to Determine Eigenvalues](#using-qr-decomposition-to-determine-eigenvalues)
  * [Implementing the Naive Algorithm](#implementing-the-naive-algorithm)

* [Improving the Algorithm: Practical QR with Shifts](#improving-the-algorithm-practical-qr-with-shifts)
* [More Improvements: The Hessenberg Form](#more-improvements-the-hessenberg-form)
* [But what about the Eigenvectors?](#but-what-about-the-eigenvectors)
* [References](#references)

Introduction
==========

>
>
> In my last two articles, I explored some fundamental topics in linear algebra: [QR Decomposition](./2021/01/20/writing-your-own-linear-algebra-matrix-library-in-c#qr-decomposition), [linear transformations](./2021/01/20/eigenvalues-and-eigenvectors-explained#linear-transformations), and [Eigenvalues/Eigenvectors](./2021/01/20/eigenvalues-and-eigenvectors-explained#eigenvalues-and-eigenvectors). If you haven’t done so, I recommend reading those first, as they provide the foundation for what we are about to do.
>
>

It might not be immediately obvious, but the QR Decomposition ($A = Q R$) of a matrix $A$ is a powerful tool for computing its eigenvalues and eigenvectors.