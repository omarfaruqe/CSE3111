# Double-Checked Locking Pattern:

# What is Double-Checked Locking Pattern?

In software engineering , double-checked locking is a software design pattern used to reduce the overhead of acquiring a lock by first testing the locking criterion without actually acquiring the lock. Only and only if the locking criterion check identify that locking is needed does the actual locking logic accepted.

# Why we need Double-Checked Locking Pattern?

We will discuss the importance of double checked locking pattern importance through a singleton pattern code:

# Here is a Singleton Design Pattern code:

_private_ _static_ _Singleton_ \_instance;

_public_ _static_ _Singleton_ getInstance() {

if (\_instance ==  **null** ) {

\_instance = new _Singleton_();

 }

 return \_instance;

 }

Though it&#39;s a thread-safe and solves issue of multiple instance, it&#39;s not very efficient. We need to bear cost of synchronization all the time we call this method, while synchronization is only needed on first class, by the time Singleton  instance Class  is being created.

This will bring us to  **double checked locking pattern** , where only critical section of code is locked. Programmer call it double checked locking because there are two checks for \_instance == null, one without locking and other with locking block.

# Double-Checked Locking Pattern example:

classSingleton {

    private volatile staticSingleton \_instance;

    privateSingleton() {

        /\* preventing Singleton object instantiation from outside\*/

 }

publicstaticSingletongetInstance() {

        if (\_instance ==null) {

            \_instance =newSingleton();

        }

        return \_instance;

}
   
publicstaticsynchronizedSingletongetInstanceTS(){

      if (\_instance ==null) {

            \_instance =newSingleton();

       }

       return \_instance;

 }

 publicstaticSingletongetInstanceDC() {

      if (\_instance ==null) {

           synchronized (Singleton.class) {

               if (\_instance ==null) {

                   \_instance =newSingleton();

               }

           }

       }

       return \_instance;

  }

}

#

# Conclusion:

Though The Double-Checked Locking Pattern is heplfull but is not thread safe in combination with the Singleton pattern. In The implementation of the DCLP should be analyzed very carefully. It is better to avoid it than playing the hero. In the case of the Singleton pattern, we have to make sure the Singleton object is created before it can be accessed by multiple threads.
