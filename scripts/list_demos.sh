#!/bin/env bash

git tag -l "demo/*" | cut -d '/' -f 2 | uniq