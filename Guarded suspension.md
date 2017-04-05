Guarded Suspension Pattern
-
Intent:
=
Guarded suspension is a one kind of software desion pattern.
It can mnanage operation that call both a lock to be acquired and precondition to be satisfied before executing the operation.

Use the Guarded suspension pattern when:
=
1. Guarded suspension design pattern is used in object oriented programming for calling any method.
2. Whenever the precondition is satisfied the Guarded suspension pattern suspent the method call and the calling thread.
3. The Guarded suspension design pattern is appiled when the developer know that the method application will be stoped for a finite amount of time.

Discussion and implementation:
=
Guarded suspension is a software design pattern.In java programming,to assist with guarded suspension object class provide wait() and notify() method.It uses try-catch clause.The wait() method is called when precondition doesn't met.To update, thread notify method will be called.This method is used for notifying that the object's state has been changed.let's see how to fix the following code:

    public synchronized guardedx() {
        while(!x) {
          try {
              wait();
          } catch (y) {}
         }
         System.out.println("x and efficiency have been achieved!");
       }
    public synchronized notifyx() {
        x = true;
        notifyAll();
    }
If the precondition of x is true then use a guarded block.The wait invitation blocks blocks the thred untill receiving 
a notification.the code will be executed if precondition x is true.

Problem:
=
1.The guarded suspension pattern make overall program slow down or stop.
2.It doesn't pick which thread will execute the method next if multi threads are waiting to access to the same method.
3.Programmers doesn't contol the thread notification .

Structure:
=
![Guarded Suspension Structure](https://lh6.googleusercontent.com/-W0iDxkHf4sE/ToqbJIDrynI/AAAAAAAACcw/m8FSdEcYySg/GuardedSuspension-1.jpg)
