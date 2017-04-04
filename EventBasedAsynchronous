#*				Event Based Asynchronous Pattern

Before going to my topic 'Event Based Asynchronous Design Pattern'
I would like to discuss a  little about design pattern.

####What is 'Design' ? 
-- In our real life we design the pattern for those problem which occur over and over again to solve those problem easily.

"The elements of this language are entities called patterns. Each pattern describes a problem that occurs over and over again in our environment, and then describes the core of the solution to that problem, in such a way that you can use this solution a million times over, without ever doing it the same way twice." — Christopher Alexander

Though here Alexender told about pattern in building and towns,what he said is true about object orriented design pattern.


####What is 'Event Based Asynchronous Design Pattern'?

Event Based Asynchronous Design Pattern is mostly effictive and mostly used in multithreaded computer programming.In this design pattern events are designed in such way so they can perform asynchronously


In multithreaded computer programming, event based  asynchronous
design  pattern is a design pattern in which the call site is not blocked while waiting for the called code to finish. Instead, the calling thread is notified when the reply arrives. Polling for a reply is an undesired option.

The difference between normal and asynchronous is if we call a normal function the programm will halt untill it finished that specified function after finishing the task of that function it will go to the next statement to execute, but if we call an asynchronous function the prgram will execute the next statements while the function will executing alongside.

Here i would like to write a example of a dami code to clear this 
imagine(As i am lazy i don't want to write the whole code) we have
two function LoadImage() and LoadImageAsync() both functions load image first one normally and second one asynchronously.
 
class EX1{
	public static void main(String arags[]){
		Ladimage();
		LoadImageAsync(handler);
		System.out.println("Ups i didn't do the SRS");
		
	}
}

In this class EX1 if we call the function LoadImage(),the program will halt untill the task of the functio  is finished, but if we call the next function LoadImageAsync(),the program will load the image alogside executing the next functon System.out.println() and during loading the image it will print 'Ups i didn't do the SRS'

now the second example we learn about how to call multipul asynchronous function.

(Again recall that i am lazy coder)

class EX2{
	LoadImageAsync(handler,user1);
	LoadImageAsync(handler,user2);	
}

Now to call an asynchronous function we have to declare the user state to make distingush difference.Here user1 and user2 are two differnt user state so the handler is aware about on which function it is performing.


####History
AMI is a design pattern for asynchronous invocation of potentially long-running methods of an object.It is equivalent to the IOU pattern described in 1996 by Allan Vermeulen

####Background
In most programming languages a called method is executed synchronously, i.e. in the thread of execution from which it is invoked. If the method needs a long time to completion, e.g. because it is loading data over the internet, the calling thread is blocked until the method has finished. When this is not desired, it is possible to start a "worker thread" and invoke the method from there. In most programming environments this requires many lines of code, especially if care is taken to avoid the overhead that may be caused by creating many threads. AMI solves this problem in that it augments a potentially long-running ("synchronous") object method with an "asynchronous" variant that returns immediately, along with additional methods that make it easy to receive notification of completion, or to wait for completion at a later time.

One common use of AMI is in the active object design pattern. Alternatives are synchronous method invocation and future objects. An example for an application that may make use of AMI is a web browser that needs to display a web page even before all images are loaded.

####Implementation

#####JAVA class
FutureTask class in Java use events to solve the same problem. This pattern is a variant of AMI whose implementation carries more overhead, but it is useful for objects representing software components.

#####.NET

1. Asynchronous Programming Model (APM).
2. Event-based Asynchronous Pattern (EAP)
3. Task-based Asynchronous Pattern

####Example

he following example is loosely based on a standard AMI style used in the .NET Framework.Given a method Accomplish, one adds two new methods BeginAccomplish and EndAccomplish:

 class Example 
 {
   Result       Accomplish(args …)
   IAsyncResult BeginAccomplish(args …)
   Result       EndAccomplish(IAsyncResult a)
   …
 }

Upon calling BeginAccomplish, the client immediately receives an object of type AsyncResult (which implements the IAsyncResult interface), so it can continue the calling thread with unrelated work. In the simplest case, eventually there is no more such work, and the client calls EndAccomplish (passing the previously received object), which blocks until the method has completed and the result is available.[10] The AsyncResult object normally provides at least a method that allows the client to query whether the long-running method has already completed:

 interface IAsyncResult 
 {
    bool HasCompleted()
   …
 }

One can also pass a callback method to BeginAccomplish, to be invoked when the long-running method completes. It typically calls EndAccomplish to obtain the return value of the long-running method. A problem with the callback mechanism is that the callback function is naturally executed in the worker thread (rather than in the original calling thread), which may cause race conditions.

In the .NET Framework documentation, the term event-based asynchronous pattern refers to an alternative API style using a method named AccomplishAsync instead of BeginAccomplish. A superficial difference is that in this style the return value of the long-running method is passed directly to the callback method. Much more importantly, the API uses a special mechanism to run the callback method (which resides in an event object of type AccomplishCompleted) in the same thread in which BeginAccomplish was called. This eliminates the danger of race conditions, making the API easier to use and suitable for software components; on the other hand this implementation of the pattern comes with additional object creation and synchronization overhea

####Characteristics of the Event-based Asynchronous Pattern

The Event-based Asynchronous Pattern may take several forms, depending on the complexity of the operations supported by a particular class. The simplest classes may have a single LoadImageAsync method and a corresponding MethodNameCompleted event. More complex classes may have several LoadImageAsync methods, each with a corresponding MethodNameCompleted event, as well as synchronous versions of these methods. Classes can optionally support cancellation, progress reporting, and incremental results for each asynchronous method.

An asynchronous method may also support multiple pending calls (multiple concurrent invocations), allowing your code to call it any number of times before it completes other pending operations. Correctly handling this situation may require your application to track the completion of each operation.

####Asynchronous Method Overloads

There are potentially two overloads for the asynchronous operations: single-invocation and multiple-invocation. You can distinguish these two forms by their method signatures: the multiple-invocation form has an extra parameter called userState. This form makes it possible for your code to call Method1Async(string param, object userState) multiple times without waiting for any pending asynchronous operations to finish. If, on the other hand, you try to call Method1Async(string param) before a previous invocation has completed, the method raises an InvalidOperationException.

The userState parameter for the multiple-invocation overloads allows you to distinguish among asynchronous operations. You provide a unique value (for example, a GUID or hash code) for each call to Method1Async(string param, object userState), and when each operation is completed, your event handler can determine which instance of the operation raised the completion event.

####Tracking Pending Operations

If you use the multiple-invocation overloads, your code will need to keep track of the userState objects (task IDs) for pending tasks. For each call to Method1Async(string param, object userState), you will typically generate a new, unique userState object and add it to a collection. When the task corresponding to this userState object raises the completion event, your completion method implementation will examine AsyncCompletedEventArgs.UserState and remove it from your collection. Used this way, the userState parameter takes the role of a task ID.

####Canceling Pending Operations

It is important to be able to cancel asynchronous operations at any time before their completion. Classes that implement the Event-based Asynchronous Pattern will have a CancelAsync method (if there is only one asynchronous method) or a MethodNameAsyncCancel method (if there are multiple asynchronous methods).

Methods that allow multiple invocations take a userState parameter, which can be used to track the lifetime of each task. CancelAsync takes a userState parameter, which allows you to cancel particular pending tasks.

Methods that support only a single pending operation at a time, like Method1Async(string param), are not cancelable.


####Advantage

 1. Perform time-consuming tasks, such as downloads and database      	operations, "in the background," without interrupting your application.

  2.  Execute multiple operations simultaneously, receiving     notifications when each completes.

   3. Wait for resources to become available without stopping ("hanging") your application.

  4.  Communicate with pending asynchronous operations using the familiar events-and-delegates model. For more information on using event handlers and delegates, see Events.
  
  
  
####  Conclusion

Event Based Asynchronous Design Pattern allow us to design such a program that can execute multiple operation simultinously as a resul now the web browsing become so fast.The giant company like google, microsoft, facebook can provide their service millions people at a time so at the end we see that this design pattern really create a revolution in web browsing.
