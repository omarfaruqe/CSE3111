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



# Mediator Design Pattern

	Mediator design pattern is one of the behavioral design pattern, so it deals with the behaviors of objects and it's used to manage algorithms, relationships and responsibilities between objects. Mediator design pattern is used to provide a centralized communication medium between different objects in a system.
   
    The definition of Mediator as provided in the original Gang of Four book on DesignPatterns states:
>     Allows loose coupling by encapsulating the way disparate sets of objects interact and communicate with each other.  Allows for the actions of each object set to vary independently of one another. 

# Intent of Mediator Design Pattern
	Define an object that encapsulates how a set of objects interact. Mediator promotes loose coupling by keeping objects from referring to each other explicitly, and it lets you vary their interaction independently.
    
![mdt..gif](.\1510276135\mdp.gif)
	The Mediator defines the interface for communication between Colleague objects. 	The ConcreteMediator implements the Mediator interface and coordinates 			communication between Colleague objects. It is aware of all the Colleagues and their purpose with regards to inter communication.The ConcreteColleague communicates with other colleagues through the mediator.
    
Without this pattern, all of the Colleagues would know about each other, leading to high coupling. By having all colleagues communicate through one central point we have a decoupled system while maintaining control on the object's interactions.

# Implementation
First of all we will create Mediator interface that will define the contract for concrete mediators.
**ChatMediator.java**
```
public interface ChatMediator {

	public void sendMessage(String msg, User user);

	void addUser(User user);
}
```
# Mediator Pattern Colleague Interface
Users can send and receive messages, so we can have User interface or abstract class. I am creating User as abstract class like below.
**User.java**
```

public abstract class User {
	protected ChatMediator mediator;
	protected String name;
	
	public User(ChatMediator med, String name){
		this.mediator=med;
		this.name=name;
	}
	
	public abstract void send(String msg);
	
	public abstract void receive(String msg);
}


```
# Concrete Mediator
Now we will create concrete mediator class, it will have a list of users in the group and provide logic for the communication between the users.

**ChatMediatorImpl.java**

```
import java.util.ArrayList;
import java.util.List;

public class ChatMediatorImpl implements ChatMediator {

	private List<User> users;
	
	public ChatMediatorImpl(){
		this.users=new ArrayList<>();
	}
	
	@Override
	public void addUser(User user){
		this.users.add(user);
	}
	
	@Override
	public void sendMessage(String msg, User user) {
		for(User u : this.users){
			//message should not be received by the user sending it
			if(u != user){
				u.receive(msg);
			}
		}
	}

}
```

# Mediator Design Pattern Concrete Colleague
**UserImpl.java**
```
public class UserImpl extends User {

	public UserImpl(ChatMediator med, String name) {
		super(med, name);
	}

	@Override
	public void send(String msg){
		System.out.println(this.name+": Sending Message="+msg);
		mediator.sendMessage(msg, this);
	}
	@Override
	public void receive(String msg) {
		System.out.println(this.name+": Received Message:"+msg);
	}

}
```
#Mediator Pattern Example Client Program Code
Let’s test this our chat application with a simple program where we will create mediator and add users to the group and one of the user will send a message
**ChatClient.java**
```
public class ChatClient {

	public static void main(String[] args) {
		ChatMediator mediator = new ChatMediatorImpl();
		User user1 = new UserImpl(mediator, "Antor");
		User user2 = new UserImpl(mediator, "Asad");
		User user3 = new UserImpl(mediator, "Shakil");
		User user4 = new UserImpl(mediator, "Labib");
		mediator.addUser(user1);
		mediator.addUser(user2);
		mediator.addUser(user3);
		mediator.addUser(user4);
		
		user1.send("Hi All");
		
	}

}
```

Notice that client program is very simple and it has no idea how the message is getting handled and if mediator is getting user or not.

**Output of the mediator pattern example program is**
```
Antor: Sending Message=Hi All
Asad: Received Message:Hi All
Shakil: Received Message:Hi All
Labib: Received Message:Hi All
```


#Conclusion

Usually a program is made up of a large number of classes. Logic and computation is distributed among
these classes. However, as more classes are added to a program, especially during maintenance and/or
refactoring, the problem of communication between these classes may become more complex. This
makes the program harder to read and maintain. Furthermore, it can become difficult to change the
program, since any change may affect code in several other classes.
With the mediator pattern, communication between objects is encapsulated within a mediator object.
Objects no longer communicate directly with each other, but instead communicate through the mediator.
This reduces the dependencies between communicating objects, thereby reducing coupling.



 35. Rijvi Ahmed	(Memento)
 36. Rubel Rana	(Messaging design pattern (MDP))
 37. Sakib Jamil Dipu (Module)
 38. Salman Rahman Sourav (Monitor object)
 39. Shah Md. Imran Hossain (Singleton, Multiton)
 40. Multiton Shahedul Hasan	(MVC Pattern, Proxy)
 41. Shakil Ahamed	(Null Object, Visitor)

## Null Object Design Pattern

### Intent
The intent of a Null Object is to encapsulate the absence of an object by providing a substitutable alternative that offers suitable default do nothing behavior. In short, a design where "nothing will come of nothing"

### Use the Null Object pattern when

 - an object requires a collaborator. The Null Object pattern does not
   introduce this collaboration it makes use of a collaboration that already exists 
 - some collaborator instances should do nothing 
 - you want to abstract the handling of null away from the client 

### Problem
Given that an object reference may be optionally null, and that the result of a null check is to do nothing or use some default value, how can the absence of an object — the presence of a null reference — be treated transparently?

###Discussion
Sometimes a class that requires a collaborator does not need the collaborator to do anything. However, the class wishes to treat a collaborator that does nothing the same way it treats one that actually provides behavior.

Consider for example a simple screen saver which displays balls that move about the screen and have special color effects. This is easily achieved by creating a Ball class to represent the balls and using a Strategy pattern to control the ball's motion and another Strategy pattern to control the ball's color.

It would then be trivial to write strategies for many different types of motion and color effects and create balls with any combination of those. However, to start with you want to create the simplest strategies possible to make sure everything is working. And these strategies could also be useful later since you want as strategies as possible strategies.

![enter image description here](https://sourcemaking.com/files/v2/content/patterns/Null_Object1.svg)

Now, the simplest strategy would be no strategy. That is do nothing, don't move and don't change color. However, the Strategy pattern requires the ball to have objects which implement the strategy interfaces. This is where the Null Object pattern becomes useful.

Simply implement a NullMovementStrategy which doesn't move the ball and a NullColorStrategy which doesn't change the ball's color. Both of these can probably be implemented with essentially no code. All the methods in these classes do "nothing". They are perfect examples of the Null Object Pattern.

The key to the Null Object pattern is an abstract class that defines the interface for all objects of this type. The Null Object is implemented as a subclass of this abstract class. Because it conforms to the abstract class' interface, it can be used any place this type of object is needed. As compared to using a special "null" value which doesn't actually implement the abstract interface and which must constantly be checked for with special code in any object which uses the abstract interface.

It is sometimes thought that Null Objects are over simple and "stupid" but in truth a Null Object always knows exactly what needs to be done without interacting with any other objects. So in truth it is very "smart."

### Structure

![enter image description here](https://sourcemaking.com/files/v2/content/patterns/Null_Object2.svg)

- Client -
 - requires a collaborator.
- AbstractObject -
 - declares the interface for Client's collaborator 
 - implements default behavior for the interface common to all classes, as appropriate
- RealObject -
 - defines a concrete subclass of AbstractObject whose instances provide useful behavior that Client expects

- NullObject -
 - provides an interface identical to AbstractObject's so that a null object can be substituted for a real object
 - implements its interface to do nothing. What exactly it means to do nothing depends on what sort of behavior Client is expecting
 - when there is more than one way to do nothing, more than one *NullObject* class may be required

### Rules of thumb

- The Null Object class is often implemented as a Singleton. Since a null object usually does not have any state, its state can't change, so multiple instances are identical. Rather than use multiple identical instances, the system can just use a single instance repeatedly.

- If some clients expect the null object to do nothing one way and some another, multiple * NullObject* classes will be required. If the do nothing behavior must be customized at run time, the * NullObject* class will require pluggable variables so that the client can specify how the null object should do nothing (see the discussion of pluggable adaptors in the Adapter pattern). This may generally be a symptom of the AbstractObject not having a well defined (semantic) interface.
- A Null Object does not transform to become a Real Object. If the object may decide to stop providing do nothing behavior and start providing real behavior, it is not a null object. It may be a real object with a do nothing mode, such as a controller which can switch in and out of read-only mode. If it is a single object which must mutate from a do nothing object to a real one, it should be implemented with the State pattern or perhaps the Proxy pattern. In this case a Null State may be used or the proxy may hold a Null Object.

- The use of a null object can be similar to that of a Proxy, but the two patterns have different purposes. A proxy provides a level of indirection when accessing a real subject, thus controlling access to the subject. A null collaborator does not hide a real object and control access to it, it replaces the real object. A proxy may eventually mutate to start acting like a real subject. A null object will not mutate to start providing real behavior, it will always provide do nothing behavior.

- A Null Object can be a special case of the Strategy pattern. Strategy specifies several *ConcreteStrategy* classes as different approaches for accomplishing a task. If one of those approaches is to consistently do nothing, that *ConcreteStrategy* is a  * NullObject*. For example, a Controller is a View's Strategy for handling input, and NoController is the Strategy that ignores all input.

- A Null Object can be a special case of the State pattern. Normally, each ConcreteState has some do nothing methods because they're not appropriate for that state. In fact, a given method is often implemented to do something useful in most states but to do nothing in at least one state. If a particular ConcreteState implements most of its methods to do nothing or at least give null results, it becomes a do nothing state and as such is a null state.

- A Null Object can be used to allow a Visitor to safely visit a hierarchy and handle the null situation.

- Null Object is a concrete collaborator class that acts as the collaborator for a client which needs one. The null behavior is not designed to be mixed into an object that needs some do nothing behavior. It is designed for a class which delegates to a collaborator all of the behavior that may or may not be do nothing behavior.

### References
[Null Object: https://sourcemaking.com/design_patterns/null_object](https://sourcemaking.com/design_patterns/null_object)

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
