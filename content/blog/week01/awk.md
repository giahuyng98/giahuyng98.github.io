---
title: Awk
date: "2020-07-22T15:20:00.000Z"
description: "[VTF] Week 01"
---

# awk - pattern scanning and text processing language

- F value:  sets the field separator, FS, to value
- v var=value assigns value to program variable var.
- for (var in array)
- for C-like
- match

  `$0 ~ /r/ # match regular expressions`
  `/r/ {action} # if match execute action`

- regular expression

    | regex | Meaning |
    |--------|---------|
    |`.`| match any char
    |`^`| match front of a string
    |`$`| match back of a string
    |`[c1c2c3]`| match any string c1 or c2 or c3
    |`[c1-c3]`| sam as above
    |`[^c1c2c3]`| not match any c1,c2,c3

    | regex | Meaning |
    |-------|---------|
    |`r1r2`|matches r1 followed immediately by r2 (concatenation)
    |`r1 | r2` |matches r1 or r2 (alternation).
    |`r*`|matches r repeated zero or more times.
    |`r+`|matches r repeated one or more times.
    |`r?`|matches r zero or once.
    |`(r)`|matches r, providing grouping.
- Records and fields
  `record : $0`
  `fields : $1 .. $NF`
    every change reconstruct $0 -> NF ...
- Operator : C-like + array member ship `in`, fiels `$`
  
  eg: `if (1 in arr) {}`

- Arrays: 
  - loop: `for (var in arr) statement`
  - `delete array`, `delete array[expr]`
  - `if ((i, j) in arr) print a[i, j]`
- Built-in functions:
  - `gsub(r,s,t)  gsub(r,s)`
  - `index(s,t)` 1-base
  - `match(s,r)`
  - `split(s,A,r) split(s,A)`
  - `sprintf(fmt,list)`
  - `sub(r,s,t) sub(r,s)`
  - `substr(s,i,n)`
  - `tolower(s) toupper(s)`
  - math `atan2(y,x) cos(x) exp(x) int(x) log(x) rand() => 0...1 sin(x) sqrt(x) srand(expr) srand()`
  - `print, printf`
- User defined functions
  
# words count : 

``` bash
cat lorem | awk '{for(i = 1; i <= NF; ++i) words[tolower($i)]++; for(word in words) print word " : " words[word]}'
```
