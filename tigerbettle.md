

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


# Story breakdown

* learn basic syntax to understand code ( gourav, kartheek, Rakesh )

* write a client in zig  to test the repo, implement and understand following functions of a vsr client 
     - fn Regester() // Registers a session with the cluster for the client, if this has not yet been done.
     - fn SendMessage() // Sends a message to the cluster
     - find the leader of the cluster to send the messages 
     - fn handle_Reply() // handle reply of message from cluster

* VSR sub protocols implemented by tiger bettle
     - sub protocol normal operation commands from primary and replica perspectives: request, prepare, prepare_ok, reply, commit.
     - sub protocol view change operation commands from primary and replica: start view change, do view change, start view.
     - recovery sub protocol: recovery and recovery response.
     - understand overview of the implementation. for further bug fixing if required 
     - also use the client previously built to test all optimal and edge cases in each sub protocol.

* deploy the tigerbettle vsr in 4 gcp vms
     - containerize the applications ( replica and client to be deployed )    
     - deply it in gcp


    
    
    
   