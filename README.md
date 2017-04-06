Course Material of 

CSE3111-Software Engineering, CSE3112-Software Engineering Lab, CSE3162-Software Development Lab

## Object Pool Design Pattern

### Intent
The intent of a Object pool is to improve performance when working with classes that are slow to create.Rather construct a new objects,reusable objects are retrieved from a pool and use it.
### Use of Object Pool pattern
 - When an application need a objects which are very expensive to instantiate then Object pool design pattern are very effective.
 - When there are several phase or section in application need the same object at different times Object pool design pattern can be used.
### Problem
Given that an object may have already exist in a application and this object won't need for a long time. if a condition arise that there need a new object.then what will do create a new object or reuse the previous object?
###Discussion
Sometimes we see that we have a object and it's not used in our application for a long time and it won't use for long run.at this point if we have to crate a new object.then what we do? we create another object.but in actual object creation are very expensive and time consuming.

When you are working a huge number of object where this object creation are very expensive and time consuming in real.and this object are only need a object for a short time. then the performance of your application may be affected.so,in this type of condition you can follow a design pattern called Object pool design pattern.

In object pool design pattern at first create a set of object and reuse this object.that is when need to create a existing object then rather create a new object you request from pool.If a previous object is exist it is returned immediately.If no objects are present in the pool,then a new item is created and returned.and after using this object and no longer need it,return this object it to the pool,for the purpose of use it again in the future without going through the slow creation process.

Actually when a object are used in different time in a application then object pool design pattern are very efficient and effective.
### Structure
The main purpose Object Pool design pattern is that if instances of a class can be reused, avoid creating a new object reuse the previous existing object.

 - Client
  -  This is the class that uses an object of the Pooled Object type.
 - Pooled Object
  -  The Pooled Object class is the type that is expensive or slow to instantiate, or that has limited availability, so is to be held in the object pool.
 - Pool 
  - It's check for available object in the pool if this object exist then it pull from the pool class otherwise it's create a new instance.
### Rules of thumb
  - it's normally implemented as singleton.
  - Factory Method pattern encapsulate the creation logic.
### Sample code

```
import java.util.HashSet;
import java.util.Set;
public abstract class ObjectPool<T> {
  private Set<T> available = new HashSet<>();
  private Set<T> inUse = new HashSet<>();
  protected abstract T create();
  public synchronized T checkOut() {
    if (available.size() <= 0) {
      available.add(create());
    }
    T instance = available.iterator().next();
    available.remove(instance);
    inUse.add(instance);
    return instance;
  }
  public synchronized void checkIn(T instance) {
    inUse.remove(instance);
    available.add(instance);
  }
  public String toString() {
    return String.format("Pool available=%d inUse=%d", available.size(), inUse.size());
  }
}
```
