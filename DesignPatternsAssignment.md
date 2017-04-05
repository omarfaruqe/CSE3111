Design Patterns Assignment
===================
Create a branch on git and name it as your roll and work on it. Once you are done, push the code to github. 
Do not merge with master branch. I have added one such example under the name Shakil Ahmed, 
you will follow this style of writing but you need to add programming code as well.

----------


Student's name along with assigned design patterns
-------------

 1. Abid ahmed sabbir	(Abstract factory, Template method)
 2. Abu Jahid Royal	(Active Object)
 3. Ahmad Yeaseen Khan	(Adapter or Wrapper or Translator)
 4. Anamul Hoque Rony (Specification)
 5. Arongka Nafse Nawer	(Balking, Scheduler)
 6. Basanta raj giri (Binding properties)
 7. Ebrahim Khalilullah (Blackboard)
 8. Horidas Roy (Blockchain)
 9. Maliha Binte Mamun (Bridge, Read-write lock)
 10. Md Muntazur Rahman (Builder)
 11. Md. Sharuar jahan (Business Delegate Pattern)
 12. Md. Golam Azam (Chain of responsibility)
 13. Md. Asadul Islam	(Command)
 14. Md. Ashikuzzaman	(Composite)
 15. Md. Ashiqur Rahman	(Composite Entity Pattern)
 16. Md. Ashraful Islam	(Data Access Object Pattern)
 17. Md. Aslam Hossain	(Decorator, Strategy Pattern)
 18. Md. Imran Hosen	(Double-checked locking)
 19. Md. Ismail Hossain	(Event-based asynchronous)
 20. Md. Maruf Monwar	(Extension object)
 21. Md. Muktadir	(Façade, Reactor)
 22. Md. Rakib Bhuiyan	(Factory method, Transfer Object Pattern)
 23. Md. Sadiqul Amin	(Filter Pattern, Strategy)
 24. Md. Saidur Rahman	(Flyweight)
 25. Md. Abdus Subhan Abu Sayed	(Front controller)
 26. Mehedi Hasan Jony	(Guarded suspension)
 27. Mst. Farhana Khatun	(Intercepting Filter Pattern)
 28. Mst. Halima Afroz	(Interpreter)
 29. Muhammad Sad-Al-Munir (Iterator)
 30. Mustofa Mahmud	(Join)
 31. Nasim Reza	(Lazy initialization)
 32. Nazmul Haque	(Lock)
 33. Rafiul Islam	(Marker)
 34. Rafsan jany Antor	(Mediator)
 35. Rijvi Ahmed	(Memento)
 36. Rubel Rana	(Messaging design pattern (MDP))
 37. Sakib Jamil Dipu (Module)
 38. Salman Rahman Sourav (Monitor object)
 39. Shah Md. Imran Hossain (Singleton, Multiton)
 40. Multiton Shahedul Hasan	(MVC Pattern, Proxy)
 41. Shakil Ahamed	(Null Object, Visitor)

## Visitor Design Pattern

### Refreshing Your Mindset

The pattern name *Visitor* is often misleading. People may think *Visitor Design Pattern* has something to do with visitation or iteration. But it is not. From Design Patterns,

> Visitor lets you define a new operation without changing the classes of the elements on which it operates.

So, Before you read the rest of the article, I strongly recommend you to reset your mind if your had similar assertion that *Visitor* has something to do with visitation. Understanding the pattern will be easier with it.

### Motivation

Let's you have a hierarchy of *Vehicle*s. You have 3 sub-classes of *Vehicle*s Boat, Car and Copter. Now all of their usual functions are defined. For simplicity, lets assume their implementation is very complex(Yes, complexity can simplify things, we will see later).

Now You are going to add a method *repaint* for all the sub-classes of *Vehicle*s. As the classes are complex we are not going to modify each sub-class
every time we need to add an operation on them, right?

But What can we do? If you are programming in a language that support *dynamic method dispatch*, then, *visitor* pattern comes to a rescue.

### The Implementation

  We need a template for visitor operation. All the method will be a subclass of this.

    class Operation
    {
    public:
        virtual void youGotABoat(Boat *b) = 0;
        virtual void youGotACar(Car *c) = 0;
        virtual void youGotACopter(Copter *c) = 0;
    };


The similar classes are decedent from a super-class which defines all the similar properties and methods.

    class Vehicle
    {
        /* codes for all the complex operation we assumed
        //~~~
        //~~~
        */

    public:
        //now, lets make the vehicle visitor friendly
        virtual void perform(Operation *v) = 0;
    };

Concrete implementation of sub-classes.

    //define Boat
    class Boat: public Vehicle
    {
        /* codes for all the complex operation we assumed
        //~~~
        //~~~
        */

    public:
        //now, lets perform the task
        void perform(Operation *v){
            v->youGotABoat(this);
        }
    };

    //define Car
    class Car: public Vehicle
    {
        /* codes for all the complex operation we assumed
        //~~~
        //~~~
        */

    public:
        //now, lets perform the task
        void perform(Operation *v){
            v->youGotACar(this);
        }
    };

    //define copter
    class Copter: public Vehicle
    {
        /* codes for all the complex operation we assumed
        //~~~
        //~~~
        */

    public:
        //now, lets perform the task
        void perform(Operation *v){
            v->youGotACopter(this);
        }
    };

The hierarchy is ready to accept any method that is similar to all the vehicles.

    //Lets add the method Run which will define the running method
    class Run: public Operation
    {
    public:
        void youGotABoat(Boat *b){
            cout << "A boat is running on water." << endl;
        }
        void youGotACar(Car *c){
            cout << "A car is running on road." << endl;
        }
        void youGotACopter(Copter *b){
            cout << "You do not have enough money to run a copter" << endl;
        }
    };

We can add others similarly. I strongly recommend readers to implement a method repaint, without modifying any existing classes which will repaint a Vehicle.

    int main()
    {
        Boat boat;
        Copter copter;
        Run run;

        boat.perform(&run);
        copter.perform(&run);

        return 0;
    }

### Application: Double Dispatch

### Conclusion

### References


 42. Shorif Mahmud Abdullah	(Object Pool)
 43. Shubha Shadik	(Observer or Publish/subscribe)
 44. Tasmima Tabassum	(Private Class Data)
 45. Tipu Sultan	(Prototype)

If you wish to write more, here are some other design patterns you can choose from

 - Resource acquisition is initialization (RAII) 
 - Servant Service Locator 
 - State 
 - Thread pool 
 - Thread-specific storage 
 - Twin
