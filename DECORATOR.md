#Decorator Design Pattern

##Defination :
The decorator pattern is a design pattern that extends the functionality of individual objects by wrapping them with one or more decorator classes.
At run-time it can modify existing members and add new methods or properties.


##Discussion :
It is a one kind ofstructural pattern. Because it can creat a relation among classes.
The decorator pattern is used to extend or alter the functionality of objects at run-time by wrapping them in an object of a decorator class.
This provides a easy way to use inheritance for modifing behaviours.

The decorator pattern is used to extend the functionality of individual objects, not classes.
This means that the modifications are took place at run-time not at design time.
This allows changes to be applied to objects in response to specific conditions such as user-selected options and business rules.
It also means that several objects based upon the same underlying class can be decorated in different manners.


##Implementing the Decorator Pattern

###ComponentBase 
Here the abstract class is the base class to concrete components and decorator classes.
The base class defines any standard members that will be implemented by these classes.
If we doon't need any important functionality we can define it as interface.

###DecoratorBase
Here the abstract class is the base class for all decorators for components.
It adds a constructor that accepts a ComponentBase object as its parameter.The object which is being passed to the component that will be wrapped.
As the wrapped object must inherit from ComponentBase, it may be a concrete component or another decorator.
This allows to applie multiple decorator on a single object.
When calls to the DecoratorBase's members are made, these are passed unmodified to the matching member of the wrapped object.

###ConcreteDecorator.
The ConcreteDecorator class provides a decorator for components.
The Operation member can be implemented in two manners.
Firstly, the operation may be unchanged,By calling the base method.
Secondly, the successor operations may be modified or replaced completely.
In this case, new functionality will be added, which may or may not call the base method.


##Sample Code For Decorator Design Pattern

public abstract class ComponentBase
{
    public abstract void Operation();
}
  
public class ConcreteComponent : ComponentBase
{
    public override void Operation()
    {
        Console.WriteLine("Component Operation");
    }
}
  
public abstract class DecoratorBase : ComponentBase
{
    private ComponentBase _component;
 
    public DecoratorBase(ComponentBase component)
    {
        _component = component;
    }
 
    public ovride void Operation()
    {
        _component.Operation();
    }
}

public class ConcreteDecorator : DecoratorBase
{
    public ConcreteDecorator(ComponentBase component) : base(component) { }
 
    public override void Operation()
    {
        base.Operation();
        Console.WriteLine("(modified)");
    }
}