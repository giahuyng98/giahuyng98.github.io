---
title: Parallelism and Concurrency
date: "2020-08-05T00:00:00.000Z"
description: "Parallelism and Concurrency"
---

# Parallelism, Concurrency
- Parallelism: (Independentability) Two or more tasks run as the same time
- Concurrency: (Interruptability) Two or more tasks shared time, time-slice

# Concurrency Model
- A concurrency model specifies how threads in the system collaborate to complete task
- Concurrency model are similar to Distributed system
- Share state: different threads in the system will share some state among them, problems: conditions, deadlock etc.
- Separate state: different threads do not share state, exchange data by copy

1. Parallel Workers
- Incomming jobs are assign to different workers
- Advantages: easy to understand
- Disavantages: 
  - shared state can get complex
  - part of the parallelization is lost when threads are waiting for each other when access a shared data structures.
  - non-blocking concurrency algorithms are hard to implement
  > persistent data structure: if a thread modifies it, gets a reference to the new structure, all other threads keep a reference to the old structure which is still unchanged.
  > usually implement as a linked list -> bad performant for CPU cache
  - stateless workers: must re-read the state -> can get slow
  - job ordering is nondeterministic: no guarantee which jobs are executed first or last

2. Assembly Line (Reactive system, Event driven system)
- Each worker only perform part of a full job, when that part is finished the worker forwards the job to the next worker.
- Each worker running on its own thread, shares no state
- Design to use non-blocking IO: the workers do as much as it can until it has to start an IO operation, the result of the IO operation is passed on to another worker
- Reactive, Event Driven systems
- Actors vs. Channels
  - Actors can send message directly to each other, message are sent and processed asynchronously.
  - Channel model, workers do not communicate directly with each other, they publish theirs messages (events) on different channels.
- Advantages: 
  - no shared state
  - stateful workers: workers can keep a state
  - better hardware sympathy: more optimized data structure, cache-friendly
  - job ordering is possible
- Disavantages:
  - the execution of a job is spread out over multiple workers, it becomes harder to see what code is being executed for a given job
  - may be harder to write the code, callback-hell
3. Funcional parallelism

# Thread safe
- Code still `safe` when execute on multiple thread.

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
      // variable state can only read, write by the same thread that create it
  }
  ```

  4. Synchoronized collections
  Methods can be accessed by only one thread at a time

  ``` java
  Collection<Integer> sync = Collections.synchonizedCollection(new ArrayList<>());
  // lock using mutex
  ```

  5. Concurrent collections
  Dividing data into segments, more performant than synchronized collections

  ``` java
  Map<String,String> con = new ConcurrentHashMap<>();
  // segment lock
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

  // equivalent to
  public void syncMethod() {
      synchronized (this) {
      }
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
      // Don't use non-final field

      public void incr() {
          synchronized(lock) {
              ++count;
          }
      }
  }
  ```

  - Class level lock: `lock use static object`, `synchronized static method`, `synchronized Class.class`
  - Object level lock

  10. Volatile Fields

  - Store the variable in the main memory, read/write it from/to the main memory, instead of from the CPU cache
  
  ``` java
  private int total;
  private volatile int counter;

  public void incr() {
      total += counter; // visible before writes to counter
      ++counter;
  }
  ```
  - Enough if one thread modifies `counter`, and another thread reads the counter.
  - Multiple threads can write to volatile variable and the new written value does not depends on its previous value -> still correct.
  - Not enough if both threads modifify `counter` => synchronized
  - Thread A writes to `counter`, then thread B reads `counter` then all variables visible to A before writing to volatile variable `counter`, will also be visible to B after it has read `counter`
  - Thread A reads `counter`, then total will also be re-read from main memory
  - Instruction Reordering -> happens-before guarantee

  11. ReentrantLock

  ``` java
  private final ReentrantLock reLock = new ReentrantLock(true);
  public void func() {
      reLock.lock();
      try {
          count++;
      } finally {
          reLock.unlock();
      }
  }
  ```

  12. ReadWriteLock

  ``` java
  private final ReentrantReadWriteLock rwLock = new ReentrantReadWriteLock();
  private final Lock readLock = rwLock.readLock();
  private final Lock writeLock = rwLock.writeLock();
  // when write
  writeLock.lock();
  // when read
  readLock.lock();
  try {
      //do some read/write
  } finally {
    // unlock write
    writeLock.unlock();
    // unlock read
    readLock.unlock();
  }
  ```

  13. AtomicReference
  ...

# Race condition
- anomalous outcomes or behavior because of the unfortunate ordering of events

# Data race
- an execution contain a data race if it contains at least two conflicting no-volatile accesses to a shared variable that are not ordered by a happen-before relation

``` java
public class DataRace {
  // non-volatile
  private static boolean flag = false; // write_0
  // to fix it
  // private static volatile boolean flag = false;

  public static void turnFlagOn() {
    flag = true; // write_1
  }

  public static void main(String[] args) throws InterruptedException {
    ForkJoinPool.commonPool().execute(DataRace::turnFlagOn);

    while (!flag) {} // read_i
    // true, false, infinity-loop
    System.out.println("Done: " + flag); // read_n
  }
}
```

# Dead lock
> State where each member of a group is waiting for another member, (including itself) to take an action
- avoid deadlock:
  - order lock
  - interrupt lock 

  ``` java
  // final ReentrantLock l = new ReentrantLock();
  // Thread t ... {l.lockInterruptibly();}
  // t.interrupt();
  ```

  - timeout lock: `l.tryLock(1000, TimeUnit.MILLISECONDS))`
  - handover locking: e.g lock a single node in linkedlist

# Lock-free: atomic operation

# Resource starvation

# Functional programming

# References
[https://kipalog.com/posts/7-concurrency-models-in-seven-week--phan-1](https://kipalog.com/posts/7-concurrency-models-in-seven-week--phan-1)
[http://tutorials.jenkov.com/java-concurrency/volatile.html](http://tutorials.jenkov.com/java-concurrency/volatile.html)
[https://www.journaldev.com/1061/thread-safety-in-java](https://www.journaldev.com/1061/thread-safety-in-java)
[https://www.baeldung.com/java-thread-safety](https://www.baeldung.com/java-thread-safety)
[https://github.com/romix/java-concurrent-hash-trie-map/tree/master/src/test/java/com/romix/scala/collection/concurrent](https://github.com/romix/java-concurrent-hash-trie-map/tree/master/src/test/java/com/romix/scala/collection/concurrent)
[http://erlang.org/documentation/doc-5.6/pdf/design_principles.pdf](http://erlang.org/documentation/doc-5.6/pdf/design_principles.pdf)
