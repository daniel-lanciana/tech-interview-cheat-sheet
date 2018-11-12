# Tech Interview Cheat Sheet

## Overview

A handly refresher list for engineering code interviews.

## General

### Do

* An important algorithm design technique is to use sorting as a basic building block, because many other problems become easy once a set of items is sorted.

### Avoid

* aaa

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

## Data Structures

All about tradoffs—the right tool for the job.

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
  * Collision can be handled by an array/list, or double-hashing. Implementations include table, tree or ?
  * **Good**. Constant lookup (depending on hash collisions), dictionaries.
  * **Bad**. Unordered.
* Heap
  * Priority queue, constant min/max (one, not both) retrieval.
* Bloom filter
  * Probabilistic data structure that allows a query on a set to return either "possibly in set" or "definitely not in set".

### Graphs and Trees

Graphs are compised of Verticies (nodes) and Edges (connections) that can be directed (one-way) or undirected (bi-directional). Trees are a simply a type of graph.

#### Data Structures
  
* Adjacency matrix—multi-dimensional array representing each node and its relationship to other nodes. Constant lookup, lots of space (especially if few edges).
* Adjacency list—objects pointing to each other. Harder to determine if an edge exists.

Self-balancing trees automatically balance the height of nodes to keep search operations logarithmic (based on node heights). 

#### Trees

* Binary Search
  * Ordered, time based on tree height (balanced), tree rotation on insert/delete. Good for searching `O(log N)`, range searches, in-order traversal, adjacent elements.
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

## Algorithms

* Greedy
  * Take the optimal solution at each step (even if worse overall)
* DP (Dynamic Programming)
  * Confusing name originating from its creator, Richard Bellman, wanting to obfuscate his research!
  * Break a problem into sub-problems, 
* Divide-and-Conquer
  * Break into chunks, process (often recursively), and merge results.
  * Lends to parallelization, requires more space, best when merging takes less time than solving sub-problems.

## Sorting

* Selection `O(n^2)`
  * Find minimum, remove from list, repeat.
* Merge `O(n*log(n))` 
* Heap `O(n*log(n))`
  * In-place selection sort with a priority queue implemented by a balanced binary tree.
* Distribution
  * Split into buckets, sort. Requires roughly uniform data distribution to be effective.
* Counting
  * For repeated elements within a known range, store the counts, then reconstruct. Good for finding mean/median/mode.
* Radix
  * Counting sort multiple times on the least significant digit, then the next one, repeat.

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

## Bit Operations

`& AND` (both `1`), `| OR` (either `1`), `^ XOR` (single `1`), `<<` left shift (multiply by `2^n`.), `>>` right shift (divide by `2^n`.

## References

* https://github.com/orrsella/soft-eng-interview-prep
