### Student's name along with assigned design patterns
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
## Façade Design Pattern

### Intent
The intent of **_Façade Design Pattern_** provides a unified interface to a set of interfaces in a subsystem.Façade provides an interface which easier to use.Façade wrap a comlpex subsystem with a easier interface.

### Use the Façade pattern when
* The system is complex
* The system is difficult to understand
* implementation of the subsystems are coupled
* an entity point is needed in each level of layered software

### Problem
Clint community needs a simplified interface to the functionality of the complex system.

### Discussion
**_Façade_** discusses about encapsulating a large difficult or complex system into a single simplified interface object.It promotes decoupling the subsystem from every client. On the other hand, if the Facade is the only access point for the subsystem, it will limit the features and flexibility that **"power users"** may need.The clints uses the **_Façade_** object without knowing the implementation details.The **_Façade_** object should work like an advocate.But not like an all-knowing oracle or main object.


### Structure
# In this below Figure we can see that the **Clint** using the **_Façade_** object only and the **_Façade_** wraped the internal subsystem.

![Figure 1](https://sourcemaking.com/files/v2/content/patterns/Facade1.svg)

# This below figure shows the internal structure of the subsystem which is wraped by the **_Façade_** object.

![Figure 2](https://sourcemaking.com/files/v2/content/patterns/Facade_1.svg)


### Rules of thumb
* **_Adapter_** uses two existing interfaces and **_Façade_** uses a new interface.
* **_Adapter_** and **_Façade_**  are both wrappers; but they are different kinds of wrappers. The intent of **_Façade_**  is to produce a simpler interface, and the intent of **_Adapter_** is to design to an existing interface.
* **_Flyweight_** uses a lot of little objects but **_Façade_** uses only one interface to represent the whole system.
* **_Abstract Factory_** can be used as an alternative to **_Façade_** to hide platform-specific classes.
* **_Façade_** objects are often **Singletons** because only one  **_Façade_**  object is required.

### Code Example
[C++ Code](https://ideone.com/qwpz2Q)

### References
**The reference link:**[https://sourcemaking.com/design_patterns/facade](https://sourcemaking.com/design_patterns/facade)


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

