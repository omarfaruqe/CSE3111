# Singleton

## What is Singleton?

In mathematics, singleton is a special kind of  set with exactly one element.
For example, the set {5} is singleton.
But in software engineering, the singleton pattern is a software design pattern that –

1. 	Ensure a class has only one instance
1. 	Provide global access to that instance
1. 	Initialization on first use


### Advantage
1. 	Reusability 
1. 	Global presence of instance 
1. 	life cycle (more appropriately instance/object data life cycle)


### Applications
1. 	The abstract factory, builder and prototype patterns can use singleton in their implementation
1. 	Facade objects are often singletons because only one façade object is required 
1. 	State object are often singletons

### Implementation
In singleton, first of all, we need to need to create a single object class. It involves a static member in the "Singleton" class and a private constructor and also a static public method that returns a reference to the static member. The Singleton Pattern defines a getInstance operation which exposes the unique instance which is accessed by the users. getInstance operation is responsible for creating its class unique instance in case it is not created yet and to return that instance.
### Java code implementation
![singleton_pattern_uml_diagram](https://cloud.githubusercontent.com/assets/19298597/24719875/1abcdbe2-1a5d-11e7-9153-67f27808da14.jpg)

```
class Singleton
{
	private static Singleton instance;
	private Singleton()
	{
		/* code goes on */
	}

	public static synchronized Singleton getInstance()
	{
		if (instance == null)
			instance = new Singleton();

		return instance;
	}
	...
	...
	public void doTheJob()
	{
		/* code goes on */	
	}
}

```

### Lazy initialization using double locking mechanism
Lazy initialization is a workable technique when static method is called from multiple threads simultaneously. By using lazy initialization with double-checked locking, we can prevent creation of multiple instances of the class.
