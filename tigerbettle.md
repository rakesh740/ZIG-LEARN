

# list of tasks by phases

## Phase 1

*   learning zig language
*   write a client for tiger bettle in zig to test.

## Phase 2

*   test all subprotocols of view stamped replication implemented in tigerbettle repo in local machine
     - Normal operation
     - View changes ( how can we introduce view changes during normal operation? )
     - Recovery ( from replica failure and leader failure )
     - state transfer when replica is slower.
     - reading from cluster ( read from primary vs reading from replica )
     - reconfiguration 
*   understand tiger bettle repo and all APIs given by it

## Phase 3

*   get all gcp machines to correctly measure tiger bettle performace under high load
     - 100 to 10 million transactions sent via multiple clients to the cluster to write in all the replicas 
     get latency data for all test cases 
     - test all the sub protocols tested in local, now in gcp machines 
     - test recovery from disk when all the nodes in the cluster fails