# Mediator Design Pattern

	Mediator design pattern is one of the behavioral design pattern, so it deals with the behaviors of objects and it's used to manage algorithms, relationships and responsibilities between objects. Mediator design pattern is used to provide a centralized communication medium between different objects in a system.
   
    The definition of Mediator as provided in the original Gang of Four book on DesignPatterns states:
>     Allows loose coupling by encapsulating the way disparate sets of objects interact and communicate with each other.  Allows for the actions of each object set to vary independently of one another. 

# Intent of Mediator Design Pattern
	Define an object that encapsulates how a set of objects interact. Mediator promotes loose coupling by keeping objects from referring to each other explicitly, and it lets you vary their interaction independently.
    
![mdt..gif](.\mdp.gif)
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