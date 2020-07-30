---
title: Hash table
date: "2020-07-30T15:10:00.000Z"
description: "Hash table"
---

# Overview
Hash Table or Hash Map is a data structure use a hash function to map a key to an index into an array of buckets.

Hash collisions: when the hash function generates the same index for more than one key.

In many situations, hash tables on average more efficient than search trees. Widely used databse indexing, caches...

# Hashing

`index = hash_func(key) % array_size`

when array size is power of two, modulo operator reduced to masking => improve speed.

Hash function should provide a uniform distribution of hash values. When use dynamic resizing with exact doubling and halving of the table size, uniform need when table size is power of 2. Some  hash algorithm prefer size is a prime.

Cryptographic hash functions are believed to provide good hash functions for any table size.

If all keys are known ahead of time, a perfect hash function can be used.

# Load factor

`load factor = size / capacity`

- load factor to small: waste memory
- load factor to large: slow operator

# Collison resolution
- Birthday problem

  1. Chaining
    1.1. Chaining with linked lists
         - poor cache performance.
    1.2. Chaining with head list
         - Pointer traveser decreased by one
         - Increase cache efficiency
         - Empty bucket takes the same space as a bucket with one entry
    1.3. Chaining with seft-balance binary search tree
         - Complexity (insert, delete, lookup) => O(logn)
         - Add extra complexity, may cause worse performance for smaller tables. when time spent inserting into and balancing the tree > time needed to perform a linear search.
         - Java 8 uses binary search tree for buckets
    1.4. Chainging with dynamic array
         - Efficient use caching and [TLB](https://en.wikipedia.org/wiki/Translation_lookaside_buffer)
         - Exact-fit
         - Growing by block sizes or pages
         - Dynamic perfect hashing: use n^2 worst case, n * k on avarage memory. Constant worst-cas lookup time, low amortized insertion time, possible to use [fusion tree](https://en.wikipedia.org/wiki/Fusion_tree) to achieve constant time for all operator with high probability.
  2. Open addressing
    2.1. Linear probing
        - Interval probes is fixed (usually 1).
        - Good CPU cache
        - Widely used
    2.2. Quadratic probing
    2.3. Double hashing
    - Performance dramatically degrades when the load factor grows beyond 0.7 or so
    - Only saves memory if the entries are small (less than four times the size of a pointer), and the load factor is not too small.
    - Avoids the time overhead of allocating each new entry record
    - Avoids the extra indirection required to access the first entry of each bucket.
    - Poor choice for large elements, because these elements fill entire CPU cache line.
    - [Coalesced hasing](https://en.wikipedia.org/wiki/Coalesced_hashing)
    - [Cuckoo hasing](https://en.wikipedia.org/wiki/Cuckoo_hashing)
    - [Hopscotch hasing](https://en.wikipedia.org/wiki/Hopscotch_hashing)
    - Robin Hood hashing
    - 2-choice hashing

# Dynamic resizing

- Resizing by copying all entries
  - Automatically trigger when the load factor exceeds some threshold rmax, rmix
- Alternatives
  - Incremental resizing
    - During the resize, allocate the new hash table, keep the old table unchanged
    - In each lookup, delete operation, check both tables
    - Perform insertion operations only in the new table
    - At each inseartion also move r element from old table to the new table.
    - When all elements are removed from the old table, deallocate it.
    - Increase the size by a factor of at least `(r+1)/r` during resizing
  - Monotonic keys
    - When key monotonically increasing/decreasing order, we can use [consistent hashing](https://en.wikipedia.org/wiki/Consistent_hashing)
  - Linear hashing: two possible lookup functions
  - Hashing for distributed hash tables:
    - Choose a hash function in such a way that the hashes of most values do not change when table is resized.
    - [Rendezvous hashing](https://en.wikipedia.org/wiki/Rendezvous_hashing)
    - [Consistent hasing](https://en.wikipedia.org/wiki/Consistent_hashing)
    - [Content addressable network](https://en.wikipedia.org/wiki/Content_addressable_network) algorithm
    - [Kademlia](https://en.wikipedia.org/wiki/Kademlia) distance

# Advantages

# Drawbacks

# References
[https://en.wikipedia.org/wiki/Hash_table](https://en.wikipedia.org/wiki/Hash_table)
