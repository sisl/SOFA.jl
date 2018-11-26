# SOFA.jl
Unofficial wrapper of the IAU SOFA C libraries for fundamental astronomy. 

## Description

The purpose of this package is to wrap the SOFA C library of fundamental astonomical function to make it easily accessible in Julia. This package serves as a _wrapper_ only. All functions ultimately call the original, unmodified, SOFA C library functions which are compiled as part of the package build process.

## Package Version <-> SOFA Release Correspondence

The package versions correspond to the following releases of the SOFA C Library:

## Differences from C SOFA Library

1. All computed values are returned by the function call. No values are returned by reference.
2. iauASTROM is not a mutable struct, so any changes must me made during initialization through keyword argument inputs

## Compliance with SOFA License