---
title: gRPC
date: "2020-08-02T00:00:00.000Z"
description: "gRPC"
---

# Overview
implement a RPC framework use Google `Protocol Buffers`

# Protocol Buffers
- Small payload
- Efficient parsingo

- Type:
  - Number: Interger(`int32/64 u/s/fixed32/64`), Float(`float 32, double 64`)
  - Boolean: `bool`
  - String: `string` utf8
  - Bytes: `bytes`
- Tag:
  - a last number 1 -> 2^29 - 1 exclude [19000, 19999]
  - tag number [1, 15] space: 1 bytes
  - tag number [16, 2047] space: 2 bytes
- Repeated fields:
  - list or array
  - `repeated` keyword
- Comment:
  - C++ like comment format
- Default values:
  - C++ like default value
- Enum
  - Enum name {default = 0; ...}
- Composite type
- Nesting type/message
- Import type
- Package

# gRPC Language
- GRPC-Java
- GRPC-Go
- GRPC-C
  - C++, Python, Ruby, Object-C, PHP, C#

- Stub: generated code for client

# Why
- Easy to write message definition
- Independent from implement
- Generate code
- Protocol buffers
- Define rules to make API evolve

# 4 Types of gRPC
1. Unary
2. Server Streaming
3. Cient Streaming
4. Bi Directional Streaming

# Reflection
- Ask server which APIs
- CLI
