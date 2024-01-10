# Code2String

[![Build Status](https://github.com/itsdfish/Code2String.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/itsdfish/Code2String.jl/actions/workflows/CI.yml?query=branch%3Amain)

A lightweight package for converting code into a stingle string. The following example is based on the unit test.

```julia 
using Code2String 
# top level folder  
top_folder = "test_folder"
# an optional function for filtering. return true to keep
keep(r, d, f; valid_format) = any(x -> contains(f, x), valid_format)
# valid formats to keep 
valid_format = ["txt",".jl"]
str = code2string(top_folder; keep, valid_format)
write("test.docx", str)
```