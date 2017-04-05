# Active Object

## Definition:

The Active Object design pattern is a pattern which is largely used in
software engineering to enhance the concurrency that are being processing
in separate threads or in different machines.It also does decoupling of 
a thread invoking a method from the thread.It also used to simplify
synchronized access to a object for executing.

## Discussion:

The execution process of the active object design pattern is asynchronous.
The first step is to make a call to the proxy.This is the only one part
that is visible publicly to the pattern.Now a method request is made 
containing "contex information".Then a scheduler receives the method 
request then the method becomes decoupled and on the scheduler thread.
In the  Activation Queue it is the task of the scheduler to decide the order of queue for the method request.A servent is used while in activation queue scheduler executes a method request .It uses a future 
that allows clients in accessing the results of a method call.

## Benefits:

->Active Object design pattern increases concurrency.

-> Active Object design pattern makes the synchronized access simpler to objects that  is reside in their own threads of control.

->A client can access the methods of an object using the interface
that is provided by the proxy.

![sequence-diagram](https://image.slidesharecdn.com/activeobject-presentation-120301221004-phpapp02/95/active-object-design-pattern-4-638.jpg?cb=1369843883)

##Sample code:


class OriginalClass {

    private double val = 0.0;
    
    void doSomething() {
        val = 1.0;
    }

    void doSomethingElse() {
        val = 2.0;
    }
}

class BecomeActiveObject {

    private double val = 0.0;

    private BlockingQueue<Runnable> dispatchQueue = new LinkedBlockingQueue<Runnable>();

    public BecomeActiveObject() {
        new Thread (new Runnable() {
                    
                @Override
                public void run() {
                    while(true) {
                        try {
                            dispatchQueue.take().run();
                        } catch (InterruptedException e) {   
                            // okay, just terminate the dispatcher
                        }
                    }
                }
            }
        ).start();
    }

    //
    void doSomething() throws InterruptedException {
        dispatchQueue.put(new Runnable() {
                @Override
                public void run() { 
                    val = 1.0; 
                }
            }
        );
    }

    //
    void doSomethingElse() throws InterruptedException {
        dispatchQueue.put(new Runnable() {
                @Override
                public void run() { 
                    val = 2.0; 
                }
            }
        );
    }
}


