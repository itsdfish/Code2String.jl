# Code2String

[![Build Status](https://github.com/itsdfish/Code2String.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/itsdfish/Code2String.jl/actions/workflows/CI.yml?query=branch%3Amain)

A lightweight package for converting code into a stingle string. The following example is based on the unit test.

```julia 
using Code2String 
# top level folder  
top_folder = "test_folder"
# an optional function for filtering. return true to keep
keep(r, d, f; valid_format) = extension_matches(f, valid_format)
# valid formats to keep 
valid_format = ["txt",".jl"]
str = code2string(top_folder; keep, valid_format)
file = open("test.docx", "w")
write(file, str)
close(file)
```
# Installation

There are two methods for installing the package. Option 1 is to install without version control. In the REPL, use `]` to switch to the package mode and enter the following:

```julia
add https://github.com/itsdfish/Code2String.jl
```
Option 2 is to install via a custom registry. The advantage of this approach is that you have more control over version control, expecially if you are using a project-specfic environment. 

1. Install the registry using the directions found [here](https://github.com/itsdfish/Registry.jl).
2. Add the package by typing `]` into the REPL and then typing (or pasting):

```julia
add Code2String
```