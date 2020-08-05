---
title: Parallelism and Concurrency
date: "2020-08-05T00:00:00.000Z"
description: "Parallelism and Concurrency"
---

# Parallelism, Concurrency
- Parallelism: (Independentability) Two or more tasks run as the same time
- Concurrency: (Interruptability) Two or more tasks shared time, time-slice

# Concurrency Model

# Race condition
# Dead lock

# Thread safe

## Java Thread safety
  1. Stateless

  ``` java
  public int func(int x) {
      return x + 5;
  }
  ```

  2. Immutable
  
  ``` java
  class Immutable {
      private final int x;
      public Immutable(int x) {
          this.x = x;
      }
  }
  ```

  3. Thread-Local Fields

  ``` java
  class ThreadLocal extends Thread {
      private final String state = "my state";
  }
  ```

  ``` java
  class State {
      public static final ThreadLocal<String> state = new ThreadLocal<>();
  }
  ```

  4. Synchoronized collections
  Methods can be accessed by only one thread at a time

  ``` java
  Collection<Integer> sync = Collections.synchonizedCollection(new ArrayList<>());
  ```

  5. Concurrent collections
  Dividing data into segments, more performant than synchronized collections

  ``` java
  Map<String,String> con = new ConcurrentHashMap<>();
  ```

  6. Atomic Object

  ``` java
  AtomicInteger counter = new AtomicInteger();
  ```

  7. Synchronized methods

  One thread access this method at a time, blocking access to this method from other threads

  ``` java
  public synchronized void syncMethod() {
      // do some works
  }
  ```

  8. Synchronized Statements

  Synchronizing an entire method might be overkill -> synchronized block

  ``` java
  public void func() {
      int x = 5;
      synchronized(this) { // could cause a deadlock -> DoS attack
          x++;
      }
  }
  ```
  9. Other Object as a Lock

  ``` java
  class ObjecjLock {
      private int count = 0;
      private final Object lock = new Object();
      // Don't use String lock = "lock";
      // Don't use Integer.valueOf(1) ...

      public void incr() {
          synchronized(lock) {
              ++count;
          }
      }
  }
  ```

  10. Volatile Fields

  Store the variable in the main memory, read/write it from/to the main memory, instead of from the CPU cache
  
  ``` java
  private volatile int counter;
  ```


# Functional programming

# References
[](https://kipalog.com/posts/7-concurrency-models-in-seven-week--phan-1)
[](http://tutorials.jenkov.com/java-concurrency/volatile.html)
[](https://www.journaldev.com/1061/thread-safety-in-java)
[](https://www.baeldung.com/java-thread-safety)
[](https://github.com/romix/java-concurrent-hash-trie-map/tree/master/src/test/java/com/romix/scala/collection/concurrent)
