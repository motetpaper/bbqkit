#!/usr/bin/env bash

##
## newkb.sh
## job    : creates a new kb template for Jekyll
## git    : https://github.com/motetpaper/bbqkit
## lic    : MIT
##
##
##

newkb() {

  if [[ -z $(command -v kbdate) ]]; then
    echo "You need KBDATE to run NEWKB"
    echo "Learn more: https://motetpaper.github.io/support/KB250419620"
    exit
  fi

  ### one timestmap for current time
  now=$(date +"%s")

  if [[ -z "$1" ]]; then

    dt=$(date --date="@$now" +"%F %H:%M:%S")
    kbdateid=$(kbdate "$dt")
  else

    ## beware of user input

    dt="$1"
    kbdateid=$(kbdate "$1")
  fi

  outfile="$kbdateid.md"

  if [[ $(find . -name $outfile) ]];then
    echo "$outfile already exists."
    exit
  fi

  echo "Saving $outfile  ..."

echo "..." && cat << MOO > $outfile && echo "done."
---
title: Title Here
date: ${dt}
updated: ${dt}
kbdate: ${kbdateid}
mermaid: false
mathjax: false
---

# Summary

This is the summary.

# Introduction

This is the introduction.

# More Information

This is more information.

# References

These are references.

MOO

}

