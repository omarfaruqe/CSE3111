# &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Command Design Pattern

## Introduction : 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Command pattern is object behavioral design pattern. Command design pattern is used to encapsulate a request as an object and pass to an invoker, wherein the invoker does not knows how to service the request but uses the encapsulated command to perform an action. 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    The key terms of command design pattern are command, invoker, receiver and client. Command is the core of command design pattern which is an interface declaring a method for executing a particular action.The invoker is decoupled from the action performed by the receiver. The invoker has no knowledge of the receiver. The invoker only knows about command, and doesn't care of the actual object which process the request, which can be different. The invoker invokes a command, and the command executes the appropriate action of the receiver. Client creates concrete command object and configure with receiver. The client decides which commands to execute at which points. To execute a command, it passes the command object to the invoker object.

## Advantages of Command Design Pattern :

 **Command design pattern provides following advantages :**
 
1. Command interface or base class breaks dependency between concrete command and invoker. Invoker knows only interface or base class and therefore we can replace implementations of same command without affecting invoker. 
2. Since command pattern encapsulate request, It can be used to record state, implement undo and redo functionality, queuing a request etc.
3. It is possible to create composite commands where one command contains subcommands it can run or execute.
4. Command design pattern is easily extendible. We can add new action methods in receivers and create new command implementations without changing the client code. 
5. Mostly GUI components use command pattern.

## Disadvantages of Command Pattern :

  ** Disadvantages of command design pattern are following :**
 1.  If we have lot of commands, we might end up with lots of small command classes.
 2.  Though similar functionality can be grouped into couple of classes with each method performing task for a particular command.
 3.  The drawback with Command design pattern is that the code gets huge and confusing with high number of action methods and because of so many associations.

##Implementation :
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Now we will create a remote control using command pattern where a remote will control on and off operation of a light. We create an interface Command which is acting as a command. We create a Light class which acts as a receiver. We have concrete command classes LightOnCommand and LightOffCommand implementing Command interface which will do actual command processing. A class RemoteControl is created which acts as an invoker object.

** Command Interface :**

***Command.java***
```java
package command_pattern;

/**
 * Created by Md. Asadul Islam on 4/5/2017.
 */

//Command interface
public interface Command {
    void execute();
}

```

** Comcrete Command :**

***LightOnCommand.java***

```java
package command_pattern;

/**
 * Created by Md. Asadul Islam on 4/5/2017.
 */

//Concrete Command
public class LightOnCommand implements Command {
    //reference to the light
    Light light;
    
    public LightOnCommand(Light light){
        this.light = light;
    }
    
    @Override
    public void execute(){
        light.switchOn();
        System.out.println("Light is on.");
    }
}

```

*** LightOffCommand.java***

```java
package command_pattern;

/**
 * Created by Md. Asadul Islam on 4/5/2017.
 */

//Concrete Command
public class LightOffCommand implements Command {
    //reference to the light
    Light light;
    
    public LightOffCommand(Light light){
        this.light = light;
    }
    
    @Override
    public void execute(){
        light.switchOff();
        System.out.println("Light has switched off.");
    }
}

```

** Receiver Class :**

***Light.java***

```java
package command_pattern;

/**
 * Created by Md. Asadul Islam on 4/5/2017.
 */

//Receiver Class
public class Light {
    private boolean on;
    
    public void switchOn(){
        on = true;
    }
    
    public void switchOff(){
        on = false;
    }
}

```

** Invoker Class : **

***RemoteControl.java***

```java
package command_pattern;

/**
 * Created by Md. Asadul Islam on 4/5/2017.
 */

//Invoker class
public class RemoteControl {
    private Command command;
    
    public void setCommand(Command command){
        this.command = command;
    }
    
    public void pressButton(){
        command.execute();
    }
}

```

** Client :**

***Client.java***

```java
package command_pattern;

/**
 * Created by Md. Asadul Islam on 4/5/2017.
 */

//Client
public class Client {
    public static void main(String[] args)    {
        RemoteControl control = new RemoteControl();
        Light light = new Light();
        
        Command lightsOn = new LightOnCommand(light);
        Command lightsOff = new LightOffCommand(light);
        
        //switch on
        control.setCommand(lightsOn);
        control.pressButton();
        
        //switch off
        control.setCommand(lightsOff);
        control.pressButton();
    }
}

```

** Output :**

```
Light is on.
Light has switched off.

```


## Conclusion :
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   The main advantage of the command design pattern is that it decouples the object that invokes the operation from the one that know how to perform it. And this advantage must be kept. There are implementations of this design pattern in which the invoker is aware of the concrete commands classes. This is wrong making the implementation more tightly coupled. The invoker should be aware only about the abstract command class. 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   We should go with the Command design pattern when we have multiple commands to execute, and it does not matter if those commands are related to each other or not.

** Reference : **

1. [http://javapapers.com/](http://javapapers.com/)
2. [https://www.tutorialspoint.com/design_pattern/index.htm](https://www.tutorialspoint.com/design_pattern/index.htm)
3. [http://www.avajava.com/tutorials](http://www.avajava.com/tutorials)
4. [http://javarevisited.blogspot.com/](http://javarevisited.blogspot.com/)
5. [https://dzone.com/articles/design-patterns-command](https://dzone.com/articles/design-patterns-command)