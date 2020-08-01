---
title: System design
date: "2020-07-24T00:00:00.000Z"
description: "System design"
---

# System design primer

## Step 1
- Load balance:
  - DNS like - round robin..., bind.com
  - DNS-Cache, TTL time-to-live
  - Don't use only DNS-like, no more worry about cache
  - Cookie, Session model break, has to send to 1
  - Solve: Can use a storage-server, share state, load balance session.
  - Problem: Some server dies, no robust
  - Solve: RAID -> redundant array of independent disk
  - RAID0 store pieces at 2 storage,
  - RAID1 store mirror, built-automatic
  - RAID10 RAID0+RAID1
  - RAID5, RAID6...
  - => reduce probi..

  - Software for load balancer: ELB, HAProxy, LVS...
  - Hardware: Barracuda, Cisco, Citrix, F5...
  - Sticky session 
  - In-memory caching
  - sql cache
  - memcached old, redis

  - Data replica

## Step 2
1. Clones
2. Database
  - Master-Slave, Sharding, denormalization, SQL tuning
  - Denormalize from begining, no-sql, no-sql like
3. Cache
  - Cached database-query
  - Cached Object
4. Async
  - Precompute
  - Event, signal

# NO SQL

- No SQL
  - Partition key: Unique distinct, uniform request random distributed, use to distribute
  - Sort key
  - LSI, GSI

  - Understand the USE CASE
    - OLTP, OLAP, DSS
    - Define ERD
    - Identify dala life cycle: TTL, BK

 - Define access patterns
   - Read/Write workloads
   - Query dimensions, aggregation

 - Data-modeling
   - Avoid relational design patterns, use one table

 - Review-Repeat-Review...

 - Stream -> lambda
 - Precompute
 - version history

- CAP, ACID, BASE
  - CAP:
    - Consistency: All clients see the same data at the same time, no matter which node they connect to
    - Availability: Some node are down, but the remain node return a response for any request
    - Partition tolerance: The clusters must continue to work, despite any number of communication breakdowns between nodes in the system

      When a network partition failure happens should we decide to
      - Cancel the operation and thus decrease the availability but ensure consistency
      - Proceed with the operation and thus provide availability but risk inconsistency

# Tools
- [Capistrano](https://viblo.asia/p/su-dung-gem-capistrano-deploy-ung-dung-ruby-on-rails-len-server-aws-OeVKBOV0ZkW)
- [RabbitMQ](https://www.rabbitmq.com/)
