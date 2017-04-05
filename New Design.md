# Double-Checked Locking Pattern:

# What is Double-Checked Locking Pattern?

In software engineering , double-checked locking is a software design pattern used to reduce the overhead of acquiring a lock by first testing the locking criterion without actually acquiring the lock. Only if the locking criterion check indicates that locking is required does the actual locking logic proceed.

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

Though it&#39;s a thread-safe and solves issue of multiple instance, it&#39;s not very efficient. We need to bear cost of synchronization all the time we call this method, while synchronization is only needed on first class, when Singleton instance is created.

This will bring us to  **double checked locking pattern** , where only critical section of code is locked. Programmer call it double checked locking because there are two checks for \_instance == null, one without locking and other with locking block.

# Double-Checked Locking Pattern example:

classSingleton {

    private volatile staticSingleton \_instance;

    privateSingleton() {

        /\* preventing Singleton object instantiation from outside\*/

 }

/\* 1st version: creates multiple instance if two thread access this method simultaneously \*/

publicstaticSingletongetInstance() {

        if (\_instance ==null) {

            \_instance =newSingleton();

        }

        return \_instance;

}

/\*2nd version : this definitely thread-safe and only

     \* creates one instance of Singleton on concurrent environment

     \* but unnecessarily expensive due to cost of synchronization at every call.\*/

publicstaticsynchronizedSingletongetInstanceTS(){

      if (\_instance ==null) {

            \_instance =newSingleton();

       }

       return \_instance;

 }

/\*3rd version : An implementation of double checked locking of Singleton.

     \* Intention is to minimize cost of synchronization and  improve performance,

     \* by only locking critical section of code, the code which creates instance of Singleton class.

 \* By the way this is still broken, if we don&#39;t make \_instance volatile, as another thread can

     \* see a half initialized instance of Singleton.

     \*/

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

The Double-Checked Locking Pattern is not thread safe in combination with the Singleton pattern. In The implementation of the DCLP should be analyzed very carefully. It is better to avoid it than playing the hero. In the case of the Singleton pattern, we have to make sure the Singleton object is created before it can be accessed by multiple threads.