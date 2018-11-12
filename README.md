# Tech Interview Cheat Sheet

- [Overview](#overview)
- [General](#general)
	- [Do](#do)
	- [Avoid](#avoid)
- [Big O Complexity](#big-o-complexity)
	- [Combinatorics](#combinatorics)
	- [Polynomial Time](#polynomial-time)
- [Data Structures](#data-structures)
	- [Linear](#linear)
	- [Heirarchial (Graphs and Trees)](#heirarchial-graphs-and-trees)
		- [Inputs](#inputs)
		- [Trees](#trees)
- [Algorithms](#algorithms)
- [Sorting](#sorting)
	- [In-memory](#in-memory)
	- [Divide-and-conquer](#divide-and-conquer)
	- [N+K](#nk)
- [Searching](#searching)
- [Processes and Threads](#processes-and-threads)
- [Languages](#languages)
- [Design Patterns](#design-patterns)
	- [OO (Object-Oriented)](#oo-object-oriented)
	- [Creation](#creation)
	- [Composition (Structural)](#composition-structural)
	- [Behavioral](#behavioral)
- [Networking](#networking)
	- [Layers](#layers)
- [System Design](#system-design)
- [Misc](#misc)
	- [Bit Operations](#bit-operations)
	- [Character Sets](#character-sets)
- [References](#references)

## Overview

A handly refresher list for engineering code interviews.

## General

### Do

* Ask clarifying questions (edge cases)
* Break problem into components
* Identify tradeoffs
* Talk out loud
* Whiteboard approach, code on laptop
* Naive solution, then optimize
* An important algorithm design technique is to use sorting as a basic building block, because many other problems become easy once a set of items is sorted.

### Avoid

* Long stretches of silcence
* Panic (just an interview)

## Big O Complexity

The measurement of processing time (number of algorithm steps) as an input size grows—not the objective performance of a program (e.g. constant time could be 1,000 years, exponential time for a small number of `n` may be fast). 

Multiple complexities are reduced to just the largest (e.g. `O(n^2)` + `O(n)` + `O(log n)` has a complexity of just `O(n^2)`). 

constant `1` < logarithmic `log(n)` < linear `n` < super-linear `n*log(n)` < quadratic `n^2` < cubic `n^3` < exponential `2^n` < factorial `n!`

### Combinatorics

- All pairs: `O(n^2)` (double-nested loop)
- All triples: `O(n^3)` (triple-nested loop)
- All permutations: `n!` (every combination)
- All subsets: `2^n` (at each element, fork and select + don't select)
- `n` over `k` (i.e. `k` items from a set of `n`): `n!/(k!*(n-k)!)`

### Polynomial Time

An algorithm is considered "fast" if it can be run in polynomial `O(n^k)` time—although not always true in practice (e.g. `O(n^20)`.

A problem can be considered `P` (solution found in polynomial), `NP` (solution verified in polynomial), `NP-complete` (family of `NP` problems with no `P` solution) and `NP-hard` (non-deterministic polynomial).

## Data Structures

All about tradoffs—the right tool for the job.

### Linear

* Arrays `[]`
  * **Good**. Storing data (space-efficient), constant indexed lookups, iteration (elements adjacent in memory).
  * **Bad**. Insertions/eletions in the middle, unknown number of elements (fixed-size), linear search (unsorted).
* Set `new Set()`
  * Math set implented as an array (with all the pros and cons associated).
  * **Good**. No duplicates.
  * **Bad**. Unordered.
* Dynamic arrays `new ArrayList()`
  * **Good**. Elastic array size.
  * **Bad**. Time to grow array, slow insertions/deletions, linear search (unsorted).
* Linked lists `new LinkedList()`
  * Can be single or doubly-linked (both directions).
  * **Good**. Constant insert/delete, linear search, no overflow.
  * **Bad**. Additional space for pointers, linear search (even if sorted).
* Stacks and queues
  * Stacks are LIFO (Last In First Out), queues are FIFO (First In First Out). Implemented as a dynamic array or linked list.
  * **Good**. Ordered data. 
  * **Bad**. Simplistic uses.
* Hash `{}`
  * Collision can be handled by an array/list, or double-hashing. Implementations include set (no duplicates, allows null key), map (allows null keys and values) and table (synchronized, no null keys/values).
  * **Good**. Constant lookup (depending on hash collisions), dictionaries.
  * **Bad**. Unordered.
* Bloom filter
  * Probabilistic data structure that allows a query on a set to return either "possibly in set" or "definitely not in set".

### Heirarchial (Graphs and Trees)

Graphs are compised of verticies (nodes), edges (connections), branches and leaves. Can be directed (one-way) or undirected (bi-directional). Trees are a simply a type of graph.

#### Inputs
  
* Adjacency matrix—multi-dimensional array representing each node and its relationship to other nodes. Constant lookup, lots of space (especially if few edges).
* Adjacency list—objects pointing to each other. Harder to determine if an edge exists.

Self-balancing trees automatically balance the height of nodes to keep search operations logarithmic (based on node heights). 

#### Trees

* Binary
  * Each node has a maximum of 2 children.
* BST (Binary Search Tree)
  * Ordered binary tree, time based on tree height (balanced), tree rotation on insert/delete. Good for searching `O(log N)`, range searches, in-order traversal, adjacent elements.
* Red-Black `new TreeMap()`
  * Painted nodes (red, black -- 1 bit extra per node) and rules to self-balance, rearranged and repainted on insert/delete.
* Splay
  * Recently accessed elements moved closer to the root position for faster re-access (in real-world situations).
* AVL
  * Better balanced than Red-Black for slower insert/delete, but faster search.
* Trie (Prefix)
  * Strings as trees where edges represent one character and the path from root representing a string. Good for string searching (e.g. auto-completion).
* Ternary Search
  * BST with up to 3 children (lo, eq, hi), more space-efficient but slower. Good for spell-checking and autocomplete.
* Patricia
* Radix
  * Compressed (merge single-child nodes) version of Prefix.
* Suffix
  * For locating substrings in linear time.
* B-Tree (Balanced)
  * Works well for large data (too big for memory, stored on disk), used by databases, similar to Red-Black, nodes can have many children.
* Interval
  * Red-Black tree that maintains a dynamic set of elements, each containing an interval.
* DAWG (Directed Acyclic Word Graph)
  * Set of all substring, simplar to Suffix tree.
* Cartisean
  * Retains the same order from top-to-bottom as left-to-right
* Heap
  * Complete binary tree (all leaves filled except bottom layer), min or max value at root.

## Algorithms

* Recursion
  * See: recursion.
* Greedy
  * Take the optimal solution at each step (even if worse overall). Good for shortest path in a graph (Dijikstra).
* Divide-and-Conquer
  * Break into chunks, process (often recursively), and merge results.
  * Lends to parallelization, requires more space, best when merging takes less time than solving sub-problems.
* DP (Dynamic Programming)
  * Confusing name originating from its creator, Richard Bellman, wanting to obfuscate his research!
  * Smart brute force guessing.
  * Break a problem into sub-problems, store previous results (memoization, from taking "memos") to avoid re-calculating.
  * Only useful for computing the same subproblem multiple times (e.g. nth Fibonacci). Find recursion in the problem, top-down memoization, bottom-up use of a table.
  * Good for left-to-right problems (e.g. substrings), subset sum, 0-1 knapsack (n-choose-k), min path moving right-or-down, LCS (Longest Common Subsequence), LIS (Longest Increasing Subsequence).

## Sorting

Stable sort is one that retains order of equal values.

### In-memory

* Bubble `O(n^2)`
  * Swap adjacent pairs.
* Selection `O(n^2)`
  * Find the next minimum, swap, repeat.
* Insertion `O(n^2)`
  * Sort next value, swap, repeat.
* Heap `O(n*log(n))`
  * In-place selection sort using a heap data structure for constant access to target item. Slower than quicksort, but better worst.
* Shell
  * Insertion sort of elements that are ideally far apart.

### Divide-and-conquer

* Quick `O(n*log(n))` 
  * 2-3x faster than heap/merge, select pivot, sort left/right of pivot, recursion.
* Merge `O(n*log(n))` 
  * Split until single element, merge together in order.
* Tim
  * Merge natural runs of data (common in the real world) to reduce number of comparisons.
* Cube
  * Self-balancing multi-dimensional array! (created 2014)

### N+K

* Distribution `O(n+k)`
  * Split into buckets (e.g. 1-10, 11-20), sort. Requires roughly uniform data distribution to be effective.
* Counting
  * For repeated elements within a known range, store the counts, then reconstruct. Good for finding mean/median/mode.
* Radix `O(n*k)`
  * Alternative term for 'base' and Latin for 'root'. Count or bucket sort on one radix (least-significant bit, character, etc.) at a time.

## Searching

* Binary `O(logn)`
  * Must be sorted.
* Depth-First Search (DFS) `O(V + E)`
  * Recursion (stack) over graphs. Good for topological sorting, finding cycles, 
  * Pre-order: root, left, right
  * In-order: left, root, right
  * Post-order: left, right, root
* Breadth-First Search (BFS) `O(V + E)`
  * Queue over graphs. Good for shortest path, degrees of separation, GC scanning.
* Dijkstra
  * Find shortest path between one node and ALL other nodes. Can't have negative weights.
* A*
  * Extension of Dijkstra which achieves better time performance by using heuristics.

## Processes and Threads

* Process. Self-contained execution environment with it's own memory space (synonymous with programs or applications) containing 1-or-more threads. 
* Thread. Execution environment within a proces, shares process memory, fewer resources to spawn. Context switching between threads (of a single process, or multiple) running on CPUs cost time.

* Stack. LIFO memory per thread execution, fast (simple access pattern).
* Heap. Program memory, shared between threads.
* Virtual Memory. Abstraction that virtualizes memory as a continuous address space.

* Lock. Restricts mutation of object to a single thread (at any given time), slower.
* Monitor. Cross-thread lock.
* Mutex. Cross-process lock (i.e. system-wide) to syncronize access to a resource (e.g. CD drive).
* Semaphore. Lock that allows N threads to access (i.e. pooling).

* Deadlock. Threads lock a resource required by the other. Stalemate. Avoid by setting an order for locks (e.g. A then B).
* Livelock. Threads infinitely repsond to the action of the other. Two people passing in a corridoor (each shifting left/right at the same time). Avoid by adding some randomness.
* Starvation. Thread unable to access a resource.
* Race Condition. Multiple threads mutating shared data at the same time, uncertain ordering of processing. Avoid with locks or timestamps.

## Languages

* Imperitive
* Declarative (Functional a subcategory)

## Design Patterns

### OO (Object-Oriented)

* Encapsulation—reusable, self-contained (sometimes "black-box") components of related state and behavior.
* Inheritance—defined behavior and characterstics between objects.
* Polymorphism—different objects that share the same in interface ("many forms") and can be used interchangeably.

### Creation

- Factory
- Builder
- Singleton

### Composition (Structural)

- Adapter
- Facade
- Decorator
- Proxy

### Behavioral

- Chain of responsibility
- Command
- Iterator
- Visitor

## Networking

### Layers

Sr No | Layer           | Data unit          | Examples
------|-----------------|--------------------|-------------------------------------
1    | Physical         | bit                | Ethernet, USB, Wi-Fi, Bluetooth, DSL
2    | Data link        | Frame              | L2TP, PPP
3    | Network          | Packet             | IPv4, IPv6
4    | Transport        | Segment (Datagram) | TCP, UDP
5    | Session          | Data               | HTTP, FTP, SMTP, DNS, IMAP, SSH, TLS
6    | Presentation     | Data               | ASCII, JPEG
7    | Application      | Data               | Chrome, Mail.app

* IP (Inernet Protocol)
  * Packet routing around connectivity problems (dropped packets), no delivery guarantee, multiple copies, multiple paths.
* TCP (Transmission Control Protocol)
  * Built on top of IP, connection-based between computers, splits data into packets, guarantees arrival and ordering of packets, flow control.
* UDP (User Datagram Protocol)
  * Thin layer on top of IP, minimizes delay at cost of 1-5% packet loss, no ordering guarantee, manual data splitting and flow control. Good for real-time data such as gaming and audio/video streaming.

## System Design

* Data replication (cluster of machines, redundancy, eventual consistency, geographic spread, file size, security, distributed)
* Rate limiting APIs
* Spelling suggestion (read dictionary, standardize lowercase/stripped, frequency count, find variants adding/removing/transposing characters, past/plural tenses, generate all variants, store, sort by score)
* Search engine (crawler, store content/metadata, index, query, ranking, re-index)
  * Query types (single word, phrase), similar searches, context (georgraphy, time), tokenize query words and union results.
  * Ranking. Weight words within a document, count and quality of linking documents (weighted graph with node containing sum)
* Design Twitter. Fan-out vs fan-in, push vs pull, Beirber effect, more reads than writes, Redis clusters, deliver messages in under 5sec.

## Misc

Heuristics are "rule of thumb" techniques for problem-solving.

### Bit Operations

`& AND` (both `1`), `| OR` (either `1`), `^ XOR` (single `1`), `<<` left shift (multiply by `2^n`.), `>>` right shift (divide by `2^n`.

### Character Sets

* ASCII (American Standard Code for Information Interchange). Basic set of 128 characters in 7 bits, with ANSI standards for characters 128-255 (the 1 extra bit) that differ between countries/languages.
* Unicode. Most used, 120,000 characters mapping to unique hex numbers (code points). Example: `A = 41 (U+0041)`. Encoded (to bytes) using UTF-8, which is compatible with ASCII.

## References

* https://github.com/orrsella/soft-eng-interview-prep
* MIT introduction to algorithms (Youtube)
