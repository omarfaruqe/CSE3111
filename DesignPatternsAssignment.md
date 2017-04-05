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

## Intercepting Filter Pattern

### Intent

 - Provide pluggable filters to conduct necessary pre-processing and post-processing to request from client to a target.
 - Authentication/ authorization/ logging or tracking of request to corresponding handlers.

### Use the Intercepting Filter pattern when 

 - A system use pre-processing or post-processing requests.
 - A system should do the authentication/ authorization/ logging or tracking of request and then pass the request to the corresponding handlers.
 - You want a modular approach to configuring pre-processinng and post-processing schemes.
 
### Problem

Preprocessing and post-processing of a client Web request and response are required.When a request enters a Web application, it often must pass several entrance tests prior to the main processing stage.  For example:-

 - Has the client been authenticated? 
 - Does the client have a valid session?
 - Is the client's IP address from a trusted network?
 - Does the request path violate any constraints?
 - What encoding does the client use to send the data?
 - Do we support the browser type of the client?
 
The key to solving this problem in a flexible and unobtrusive manner is to have a simple mechanism for adding and removing processing components, in which each component completes a specific filtering action.

### Solution
Creating pluggable filters to process common services in a standard manner without requiring changes to core request processing code. The filters intercept incoming request and outgoing responses, allowing preprocessing and postprocessing. We are able to add and remove these filters unobtrusively, without requiring changes to our existing code.

We are able, in effect, to decorate our main processing with a variety of common services, such as security, logging, debugging, and so forth. These filters are components that are independent of the main application code, and they may be added or removed declaratively. For example, a deployment configuration file may be modified to set up a chain of filters. The same configuration file might include a mapping of specific URLs to this filter chain. When a client requests a resource that matches this configured URL mapping, the filters in the chain are each processed in order before the requested target resource is invoked.

### Structure
 
*Client*, *Filter manager*, *Filter chain*, *Filters* and *Target* are components of the pattern.
![Figure of intercepting filter pattern](http://www.oracle.com/ocom/groups/public/@otn/documents/digitalasset/148055.gif)

##### *Client*:-

The *Client* sends a request to the *FilterManager*.

##### *Filter Manager*:-
	
 The *FilterManager* manages filter processing. It creates the *FilterChain* with the appropriate filters, in the correct order, and initiates processing.

##### *FilterChain*:-

The *FilterChain* is an ordered collection of independent filters.

##### *FilterOne, FilterTwo, FilterThree*:-

These are the individual filters that are mapped to a target. The *FilterChain* coordinates their processing.

##### *Target*:-

The *Target* is the resource requested by the *client*.

### Implementation

We are going to create a *FilterChain*, *FilterManager*, *Target*, *Client* as various objects representing our entities. *AuthenticationFilter* and *DebugFilter* represent concrete filters.

*InterceptingFilterDemo*, our demo class, will use *Client* to demonstrate Intercepting Filter Design Pattern.[Reference](file:///C:/Users/Lenovo/Downloads/Design%20Pattern%20Intercepting%20Filter%20Pattern.html)

![Implementation image](https://www.tutorialspoint.com/design_pattern/images/interceptingfilter_pattern_uml_diagram.jpg)

##### Create Filter interface:-

*Filter.java*

	public interface Filter {
	   public void execute(String request);
	}
 
##### Create concrete filters:-

*AuthenticationFilter.java*

	public class AuthenticationFilter implements Filter {
	   public void execute(String request){
		  System.out.println("Authenticating request: " + request);
	   }
	}

*DebugFilter.java*

	public class DebugFilter implements Filter {
	   public void execute(String request){
		  System.out.println("request log: " + request);
	   }
	}

##### Create Target:-

*Target.java*

	public class Target {
	   public void execute(String request){
		  System.out.println("Executing request: " + request);
	   }
	}

##### Create Filter Chain:-

*FilterChain.java*

	import java.util.ArrayList;
	import java.util.List;

	public class FilterChain {
	   private List<Filter> filters = new ArrayList<Filter>();
	   private Target target;

	   public void addFilter(Filter filter){
		  filters.add(filter);
	   }

	   public void execute(String request){
		  for (Filter filter : filters) {
			 filter.execute(request);
		  }
		  target.execute(request);
	   }

	   public void setTarget(Target target){
		  this.target = target;
	   }
	}

##### Create Filter Manager:-

*FilterManager.java*

	public class FilterManager {
	   FilterChain filterChain;

	   public FilterManager(Target target){
		  filterChain = new FilterChain();
		  filterChain.setTarget(target);
	   }
	   public void setFilter(Filter filter){
		  filterChain.addFilter(filter);
	   }

	   public void filterRequest(String request){
		  filterChain.execute(request);
	   }
	}

##### Create Client:-

*Client.java*

	public class Client {
	   FilterManager filterManager;

	   public void setFilterManager(FilterManager filterManager){
		  this.filterManager = filterManager;
	   }

	   public void sendRequest(String request){
		  filterManager.filterRequest(request);
	   }
	}

##### Use the Client to demonstrate Intercepting Filter Design Pattern:-

*InterceptingFilterDemo.java*

	public class InterceptingFilterDemo {
	   public static void main(String[] args) {
		  FilterManager filterManager = new FilterManager(new Target());
		  filterManager.setFilter(new AuthenticationFilter());
		  filterManager.setFilter(new DebugFilter());

		  Client client = new Client();
		  client.setFilterManager(filterManager);
		  client.sendRequest("HOME");
	   }

##### Verify the output:-

	Authenticating request: HOME
	request log: HOME
	Executing request: HOME

-------------------------
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

### Discussion
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
