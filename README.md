# Tech Interview Cheat Sheet

## Overview

A handly refresher list for engineering code interviews.

## General

### Do

* Turn up

### Avoid

* aaa

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
 
#### Traversal

* Depth-First Search (DFS). Recursion (stack).
  * Pre-order: root, left, right
  * In-order: left, root, right
  * Post-order: left, right, root
* Breadth-First Search (BFS). Queue.

## References

* https://github.com/orrsella/soft-eng-interview-prep
