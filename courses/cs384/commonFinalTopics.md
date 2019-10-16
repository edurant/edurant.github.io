---
title: "CS-384 Final Exam - Recommended Study Topics"
---

* Describe in general terms the evolution of operating systems from single-user uni-processors to modern multi-user multi-process multi-processors.
* Define terms like "batch", "spool", "time-share", etc.
* Describe the basic architecture of a computer system.
* Describe the basic interrupt sequence and the mechanisms necessary to implement it.
* Define the term "process".
* Compare and contrast processes and threads.
* Explain the difference between the two definitions of process "state".
* Describe the various process states (new, run, ready, wait, blocked, terminated) and provide examples of how and when a process may enter or leave each of these states.
* Describe the purpose of a process control block.
* Describe the contents of a process control block and explain why each item may be found there.
* Describe a zombie process. How does it become zombie and what must be done about it?
* Describe the basic mechanisms that are commonly used for inter-process communication (signals, pipes, etc.).
* Explain the mechanisms involved in a context switch and process dispatch.
* Describe, compare, analyze, and apply the more common dispatching algorithms (first-come first-served, shortest-job first, and round-robin).
* Describe and compute the common metrics used to compare CPU schedulers (throughput, wait, overhead, etc.).
* Define the term "starvation" and explain how it might occur.
* Define the term "priority inversion" and explain how it might be used.
* Describe how real-time systems (both hard and soft) differ from most typical scheduling applications.
* Define the term "critical section" and explain why they are necessary.
* Describe the typical critical section sequence.
* Analyze a section or sections of simple code and determine whether they have a critical section.
* Describe the basic software solution to the critical section problem for a two process system.
* Describe the hardware solutions to the critical section problem.
* Describe a semaphore and its basic operations (P and V).
* Describe how a semaphore is used.
* Explain the implementation of a simple semaphore.
* Describe what makes an operation "atomic".
* Describe a "mutex".
* Describe the differences between blocking (at the O/S level) and non-blocking (spinlock) semaphores.
* Define the term "deadlock".
* Describe the four conditions that lead to a deadlock (mutual exclusion, hold and wait, no preemption, and circular wait).
* Analyze allocation graphs to determine whether deadlocks exist.
* Compare and contrast the deadlock handling strategies of prevention, avoidance, recovery, and ignoring.
* Describe the purpose, mechanisms, advantages, and disadvantages of a memory paging system.
* Explain the difference between a virtual and a physical address.
* Describe the address translation algorithm using page tables and translation look-aside buffers.
* Compute the storage requirements for a page table given information about block/page sizes, physical address ranges, and virtual address ranges.
* Compute the effective access time for memory given the memory cycle time, the hit ratio, and the translation look-aside buffer access time.
* Describe fragmentation, both internal and external.
* Describe the steps that occur during a page fault and explain when they occur.
* Describe and apply the page replacement algorithms of first-in first-out (FIFO), least recently used (LRU), and least frequently used (LFU) for a specified reference stream.
* Describe the extended reference bit approach to page replacement.
* Describe the page buffering approach to page replacement and explain its advantages and disadvantages.
* Describe Belady's Anomaly.
* Describe the added challenges of initial program loading in a virtual memory system.
* Describe thrashing for both virtual memory systems and disk drives.
* Describe the typical kinds of attributes and operations that an operating system provides for file management.
* Describe and compare the file access methods of sequential, direct, and indexed.
* Describe the access list approach to file protection.
* Describe and compare the disk allocation strategies of contiguous vs. linked.
* Describe and compare the FAT and indexed approaches for tracking disk allocation and explain their advantages over a simpler contiguous or linked approach.
* For the GNU/Linux / UNIX operating system be able to
  * ...Describe, use, and compare the various process creation mechanisms (fork, exec, system, etc.).
  * ...Be familiar with some of the more common "signals".
  * ...Describe and use pipes.
* Describe the mechanisms that might be used to provide flexible relocation of assembled/compiled code.
* Describe the general processing/activity that takes place during a blocking I/O request implemented using a direct memory access (DMA) device.
* Describe protection and some of the strategies used to implement it.
* Describe security and some of the strategies used to implement it.
* Define authentication.