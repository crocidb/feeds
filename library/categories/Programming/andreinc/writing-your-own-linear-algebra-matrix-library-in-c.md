+++
title = "Writing your own linear algebra matrix library in C"
description = "Contents Disclaimer Math, math The Library Source Code The data: nml_matrix   Breakdown of the Structure  * [A Note on Memory Layout](a-note-on-m"
date = "2021-01-20T00:00:00Z"
url = "https://andreinc.net/2021/01/20/writing-your-own-linear-algebra-matrix-library-in-c/"
author = "Andrei Ciobanu"
text = ""
lastupdated = "2026-03-18T21:57:49.241778861Z"
seen = true
+++

Contents
----------

* [Disclaimer](#disclaimer)
* [Math, math](#math-math)
* [The Library](#the-library)
* [Source Code](#source-code)
* [The data: `nml_matrix`](#the-data-nml_matrix)
  * [Breakdown of the Structure](#breakdown-of-the-structure)
  * [A Note on Memory Layout](#a-note-on-memory-layout)

* [Allocating / De-allocating memory for the `nml_mat` matrix](#allocating--de-allocating-memory-for-the-nml_mat-matrix)
  * [Implementation: `nml_mat_new()`](#implementation-nml_mat_new)
  * [Implementation: `nml_mat_free()`](#implementation-nml_mat_free)
  * [Expanding the API](#expanding-the-api)
  * [Creating a Random Matrix](#creating-a-random-matrix)
    * [Generating Values within an Interval](#generating-values-within-an-interval)

  * [Creating a square matrix](#creating-a-square-matrix)
  * [Creating an identity matrix](#creating-an-identity-matrix)
  * [Creating a matrix from a `FILE`](#creating-a-matrix-from-a-file)
    * [Input File Format](#input-file-format)
    * [Implementation](#implementation)

* [Matrix methods](#matrix-methods)
  * [Checking for equality](#checking-for-equality)
    * [Implementation](#implementation-1)

  * [Printing the matrix](#printing-the-matrix)
  * [Accessing and modifying matrix elements](#accessing-and-modifying-matrix-elements)
    * [Retrieving / Selecting a column](#retrieving--selecting-a-column)
    * [Retrieving / Selecting a row](#retrieving--selecting-a-row)
    * [Setting values](#setting-values)
    * [Multiplying a row with a scalar](#multiplying-a-row-with-a-scalar)
      * [In-Place Modification (`_r`)](#in-place-modification-_r)
      * [Functional Alternative (Copy)](#functional-alternative-copy)

    * [Multiplying a column with a scalar](#multiplying-a-column-with-a-scalar)
    * [Adding two rows](#adding-two-rows)
    * [Multiplying the matrix with a scalar](#multiplying-the-matrix-with-a-scalar)

* [Modifying the `nml_mat` internal structure](#modifying-the-nml_mat-internal-structure)
  * [Removing a column](#removing-a-column)
  * [Removing a row](#removing-a-row)
  * [Swapping Rows](#swapping-rows)
  * [Swapping Columns](#swapping-columns)
  * [Vertical Concatenation of multiple matrices](#vertical-concatenation-of-multiple-matrices)
  * [Horizontal Concatenation](#horizontal-concatenation)

* [Basic Matrix Operations](#basic-matrix-operations)
  * [Adding two matrices](#adding-two-matrices)
  * [Subtracting two matrices](#subtracting-two-matrices)
  * [Multiplying two matrices (The Dot Product)](#multiplying-two-matrices-the-dot-product)
    * [The Mathematical Formula](#the-mathematical-formula)
    * [A Practical Example](#a-practical-example)
    * [C Implementation (naive)](#c-implementation-naive)

  * [Row Echelon Form (REF)](#row-echelon-form-ref)
    * [Properties of REF](#properties-of-ref)
    * [Examples of REF Matrices](#examples-of-ref-matrices)
    * [The Gaussian Elimination Algorithm](#the-gaussian-elimination-algorithm)
    * [Implementation: The Pivot Finder](#implementation-the-pivot-finder)
    * [Implementation: `nml_mat_ref`](#implementation-nml_mat_ref)

  * [Reduced Row Echelon Form (RREF)](#reduced-row-echelon-form-rref)
    * [Examples of RREF Matrices](#examples-of-rref-matrices)
    * [The Gauss-Jordan Step](#the-gauss-jordan-step)
    * [Implementation: Partial Pivoting for Stability](#implementation-partial-pivoting-for-stability)
    * [Implementation: `nml_mat_rref`](#implementation-nml_mat_rref)

* [LU(P) Decomposition](#lup-decomposition)
  * [The LU(P) algorithm as an example](#the-lup-algorithm-as-an-example)
  * [Code implementation](#code-implementation)
    * [Optimization Note: The Combined LU Storage](#optimization-note-the-combined-lu-storage)
    * [Memory Management](#memory-management)
    * [The LUP Factorization Algorithm](#the-lup-factorization-algorithm)

* [Solving linear systems of equations](#solving-linear-systems-of-equations)
  * [Forward substitution](#forward-substitution)
    * [The Mathematical Formula](#the-mathematical-formula-1)
    * [C Implementation](#c-implementation)

  * [Backward substitution](#backward-substitution)
    * [The Mathematical Formula](#the-mathematical-formula-2)
    * [C Implementation](#c-implementation-1)

  * [Solving linear systems using LU(P) decomposition](#solving-linear-systems-using-lup-decomposition)
    * [The Mathematical Logic](#the-mathematical-logic)
    * [C Implementation](#c-implementation-2)

* [Calculating the inverse](#calculating-the-inverse)
  * [The Column-by-Column Approach](#the-column-by-column-approach)
  * [C Implementation](#c-implementation-3)

* [Calculating the determinant](#calculating-the-determinant)
  * [Understanding the Components](#understanding-the-components)
  * [The Final Formula](#the-final-formula)
  * [C Implementation](#c-implementation-4)

* [QR Decomposition](#qr-decomposition)
  * [The Mathematical Framework](#the-mathematical-framework)
  * [Essential Components: Dot Product and $L\_2$ Norm](#essential-components-dot-product-and-l_2-norm)
    * [1. Dot Product $\\langle a, b \\rangle$](#1-dot-product-langle-a-b-rangle)
    * [2. Euclidean Norm $\\lVert a \\rVert$](#2-euclidean-norm-lvert-a-rvert)

  * [QR Algorithm Implementation](#qr-algorithm-implementation)

* [Conclusion: From Arrays to Algorithms](#conclusion-from-arrays-to-algorithms)
* [References](#references)

Disclaimer
==========

The reader should be familiar with the concept of a matrix and it’s basic applications.