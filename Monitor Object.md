# Monitor Object



##Intent


Monitor Object pattern, also known as Thread-safe Passive Object or
Code Locking pattern
The Monitor Object pattern synchronizes method execution
for ensuring only the method that runs within an object at .
It also allows an object’s methods to cooperatively schedule
their execution sequences.




##Key Components

###Monitor Object: 
This patterns exposes synchronized methods as the only means of client access

###Synchronized Methods: 
The synchronized Methods is guarantee thread-safe access to the internal state

###Monitor Lock: 
This is used by the synchronized methods to serialize method invocation

###Monitor Condition: 
It helps to cater for cooperative execution scheduling


##The Pros and Cons of the pattern

###Advantages

- Simplified synchronization:
All of the hard work is offloaded to the object itself, clients are not concerned with synchronization issues.

- Cooperative execution scheduling: 
Monitor condition is only used to suspend/resume method execution.
Reduced performance overhead: Notifications over inefficient polling.





###Drawbacks
 
- Locking mechanism and implementation closely coupled
 
- Limited amount of control (e.g. no reordening of calls) 

- Limited scalable

- Complicated extensibility semantics

- Inheritance anomaly 

- Nested monitor lockout 


###Unavoidable drawbacks 


- Concurrency remains complicated 

- Caching at different levels 

- Almost impossible to test 

- Big responsibility on the programmer just implementing methods




##Structure 

There are four participants in the Monitor Object pattern:
 
###Monitor object

A monitor object exports one or more methods to clients. To protect the internal state of the monitor object from uncontrolled changes or are racing conditions, all clients must access the monitor object only through these methods. Each method executes in the thread of the client that invokes it because a monitor object doesn't have to be its own thread of control.2 For instance, the consumer handler’s message queue in the Gateway application can be implemented as a monitor object. 

###Synchronized methods  

Synchronized methods have most to implement the thread-safe services control exported by a monitor object. To prevent race conditions, only one synchronized method can execute within a monitor at any point in time, regardless of the number and also of the threads that invoking the object’s synchronized methods concurrently or the number of synchronized methods in the object’s class. For instance, the put and get operations on the consumer handler’s message queue should be synchronized methods to ensure that routing messages can be inserted and removed simultaneously by multiple threads and without corrupting a queue’s internals state.


###Monitor lock 
Each monitor object contains its own monitor lock. Synchronized methods use this monitor lock to serialize method invocations on a per-object basis and Each of the synchronized method must acquire/release the monitor lock and again when the method enters/exits the object,respectively. This protocol ensures the monitor lock is held whenever a method performing the operations that access or to be  modified its object’s state. For instance, a Thread Mutex could be used to implement the message queue’s monitor lock. Monitor condition Multiple synchronized methods are running into the separate threads can cooperatively schedule their execution sequences by waiting for and notifying each other via monitor conditions associated with their monitor object. 




##Code Example:

There is no doubt but it is a simple common matter  that Only an empty  toilet can be entered. Once in, the visitor is granted to leave:


<br> public interface Toilet { 

    boolean enter(); 

    void quit(); 

    boolean isOccupied(); 
} <br>

Now, the the second thing is that it have to be ensured that, under any circumstances, that the toilet only be used by a single person. Should that condition fail, the toilet becomes flooded:
<br> public class ToiletFloodedException extends RuntimeException {} <br>

An obviously ignorant implementation of the Toilet interface ..:
public class FilthyToilet implements Toilet {

<br>
    // Yes, that's the internal state - a concurrent visitor counter.
    private int counter = 0;
    ..
}

<br>

.. there are some unavoidable consequences in here and they are given below:
 console output after having run the FilthyToiletMultiThreadedTest.java:

The toilet was flooded 25 times under a moderate load.
The toilet was flooded 38 times under a heavy load.
The toilet was flooded 96 times under an extreme load.

Please note that the flood-count varies and doesn't always follow the load.
Now, the correct implementation makes use of the Monitor Object pattern:

<br> public class CleanToilet implements Toilet {

    // Monitor Lock used by the synchronized methods
    private final ReentrantLock lock;

    // Monitor Condition - the toilet can only be used by a single person at a time
    private Condition oneAtATimeCondition;

    // The guarded object's state - the 'volatile' flag is crucial for the signalling to work
    private volatile int counter;

    // all of the public methods are synchronized
   ..
}
<br>

The synchronization is ensured by using a lock along with a condition. The lock holds as long as the condition holds true:
<br>    public boolean enter() {
        lock.lock();
        try {
            while (counter > 0) {   // wait while the toilet is being used
                oneAtATimeCondition.awaitUninterruptibly();
            }

            if (++counter == 1) {
                oneAtATimeCondition.signal();   // the toilet has been successfully acquired
            }

            return isOccupied();
        } finally {
            lock.unlock();
        }
    }
<br>

##References

1. [Wikipedia]( https://en.wikipedia.org/wiki/Monitor_(synchronization) )

2. [Youtube] (https://www.youtube.com)
