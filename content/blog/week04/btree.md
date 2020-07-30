---
title: Btree
date: "2020-07-27T00:00:00.000Z"
description: "Btree"
---

- Invented by Rudolf Bayer and Edward M.McCreight (Boeing Research Labs)
- B stand for ???
- Benefit: reduce disk access
- Generally: node size is kept equal to the disk block size
- Btree of order m is
  - every node has at most m children
  - every non-leaf node (except root) has at least ceil(m/2) child nodes
  - root has at least 2 children if it not a leaf node
  - a non-left node has k children contain k-1 child
  - all leaf appear in the same level

  - internal nodes: 
    - number of children [L, U]
    - ordered set of elements and child pointers [L - 1, U - 1]
    - U = [2L - 1, 2L]
  - Root node:
    - number of children [1, L]
