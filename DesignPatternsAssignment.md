Design Patterns Assignment
===================
Create a branch on git and name it as your roll and work on it. Once you are done, push the code to github. 
Do not merge with master branch. I have added one such example under the name Shakil Ahmed, 
you will follow this style of writing but you need to add programming code as well.

----------

 
#Balking Design Pattern 

######Imagine standing in a queue to get a train ticket. There is just a single counter. And there are five queues of ticket-buyers. Can you guess what will happen? Add the fact that the train will depart within 15 minutes and everyone wants the ticket to that particular train.


######Let's feel the pain of the poor ticket agent. 

#####*But! What if the ticket agent knew the balking design pattern and processed the multiple threads of people in a synchronized manner? Yes, problem solved!*




So, what does the word **'Balking'** mean? The word **'Balk'** refers to stop, as at an obstacle, and refuse to proceed or to do something specified. We can define the **_Balking Design_** Pattern as:

>A software design pattern which executes an action on something when it is in a specific state, is the balking design pattern.

I had starred a popular github [repository](https://github.com/kamranahmedse/design-patterns-for-humans) for learning purposes a while ago, but it had only the three GoF Categories. I guess, the **concurrency** patterns were more used when synchronization was not so well implemented in the Java Virtual Machines and they used to run slower while processing multithreaded operations.


* Generally, a balking pattern is used with a single thread 
to help manage an object's change in state.

* It prevents an object from executing certain code if it is an incomplete or inappropriate state.

* The objects are usually in a state that is prone to pausing temporarily, though the time limit is unknown.
 
* The best approach includes that if an object’s method is called when the
 object is in an incomplete state, then the method will
 return without doing its specified job.

To understand the design pattern by visualizing, lets consider this interactive [applet](https://github.com/omarfaruqe/CSE3111/blob/1512476143/ObserveBalkingPattern.java).

**Related:**

● Guarded Suspension

● Double Checked Locking





