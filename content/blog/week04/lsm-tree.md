---
title: LSM Tree
date: "2020-07-28T00:00:00.000Z"
description: "LSM Tree"
---


[source](https://medium.com/databasss/on-disk-io-part-3-lsm-trees-8b2da218496f)
# Flavors of IO

## Sector/Block/Page

Sector size: 512
Block (1 group of adjacency sector) size: 512, 1024, 2048, 4096 bytes
[Virtual Memory Pages] => [File System Block] => [Sector]

## Standard IO

## Kernel Page cache
- Read [Read request] => [Page cache] yes => Read, no => full ? LRU, read
- Write [Write request] => [Page cache] dirty page => flush/writeback => [IO queue]
- Page cache: Improve IO performent by delay write/read ahead (prefetch)

## Direct IO
- Không dùng kernel page cache, custom-IO..., 
- Block alignment: starting offset multiple of 512 and buffer size multiple of 512

## Memory Mapping
fsync
mmap
- access file as if it was loaded in memory entirely
- mode private: allows reading, write trigger copy-on-write => changes private.
- mode shared: can see updates, *msync*
- lazy load, memory mapping is done through the page cache
- can map with flags e.g read-only
- avoids creating an copy of the buffer in memory, avoids system call (and subsequent context switch)

## Page cache optimizations
- notify kernel access patterns
- `FADV_SQEUENTIAL`,`FADV_RANDOM`,`FADV_WILLNEED`,`FADV_DONTNEED`
- `mlock`: force pages to be held in memory

## AIO: Linux Asynchronous IO
- Allowing multiple IO operations and register callbacks

## Vectored IO (Scatter/Gather)
- Allow reading/writing data to/from disk using multiple buffers per system call

=> `each having own advantages and shortcomings`

## Mutable vs Immutable

- Immutable: storage overhead can be minimized, don't have to reserve any extra space
- Node splitting -> relocate written parts => Defragmentation
- In-place updates <-> Mask as delete => garbage-collected
- Immutable: merge, rewrite files in order to make sure that the least amount of files is hit during the query.
- Mutable files: may have to rewritten partially/completely, merge overflow areas, reclaim space occupied by updated or deleted rocords.


# LSM Tree
- optimized for sequential disk access, node can have a full *occupancy*
- allow imutable, mergeable files, primary index

## Sorted string tables
- persistent ordered immutable map
- easy to write, search and read.
- Index Block: quick lookup, holding offsets to the values in the data block
- Data Block: key/value pairs, fast sequential range scans
- Immutable => insert, update, delete => rewriting the whole file.

## Anatomy
- All the writes are performed against the mutable in-memory DS (log lookup).
- When the size of the tree reachs threshold or time period elapses => write to disk => new SSTable *flush*
- Retrieving the data => searching all SSTables on disk => checking in-memory table => merge => result
-

## Compaction
- Data growing, located in several files, multiple versions of the same record, redundant records that got shadowed by deletes. => reads will get more expensive
- Compaction: process read complete SSTables from disk and merge (because of sstable layout, very efficient).

## Merge
- Complexity as merging sorted.
- Use as compaction, read

## Summarize
- Better 
