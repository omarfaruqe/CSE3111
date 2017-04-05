
#MEMENTO DESIGN PATTERN

####Introduction
The memento pattern is a software design pattern that provides the ability to restore an object to its previous state. The Memento design pattern defines three distinct roles:

1.  Originator - It is the object where we see how to save itself.

2. Caretaker - It is the object wherw we see why and when the Originator needs to save and restore itself.

3. Memento - It is the lock box that is written and read by the Originator, and shepherded by the Caretaker. 

The originator is some object that has an internal state.The originator is some object that has an internal state. The caretaker is going to do something to the originator, but wants to be able to undo the change. The caretaker first asks the originator for a memento object. Then it does whatever operation and it was going to do. To roll back to the state before the operations, it returns the memento object to the originator. The memento object itself is an opaque object where the caretaker cannot change. When using this pattern, care should be taken if the originator may change other objects or resources. The memento pattern operates on a single object. If the client subsequently needs to "rollback" the source object's state, it hands the Memento back to the source object for reinstatement. It is one of the best design pattern of any software resources.


####Intent

1. Without violating encapsulation, capture an object's internal state so that the object can be returned to this state later.

2. A magic cookie that encapsulates a "check point" capability.

3. Promote undo or rollback to full object status.


####Structure

#![](imgs/20170404-225214.png)


####Implementation

Memento pattern uses three actor classes. Memento contains state of an object to be restored. Originator creates and stores states in Memento objects and Caretaker object is responsible to restore object state from Memento. We have created classes which are memento,originator and caretaker.


Here the diagram of memento design pattern


#![](imgs/20170404-225725.png)

####The three classes of java code


####Create Memento class.
###Memento.java

public class Memento {
   private String state;

   public Memento(String state){
      this.state = state;
   }

   public String getState(){
      return state;
   }	
}


####Create Originator class
###Originator.java

public class Originator {
   private String state;

   public void setState(String state){
      this.state = state;
   }

   public String getState(){
      return state;
   }

   public Memento saveStateToMemento(){
     return new Memento(state);
   }
   
   public void getStateFromMemento(Memento memento){
      state = memento.getState();
   }
}
   

   
####   Create CareTaker class
###   CareTaker.java
   
Import java.util.ArrayList;

import java.util.List;

public class CareTaker {
   privateList <<Memento>Memento> mementoList = new ArrayList<<Memento>Memento>();

   public void add(Memento state){
      mementoList .add(state);
   }

   Public Mementoget(int index){
      return mementoList.get(index);
   }
}



####Example

The memento captures and externalizes an object's internal state so that the object can later be restored to that state. This pattern is common among do-it-yourself mechanics and it is repairing drum brakes on their cars. The drums are removed from both sides, exposing both the right and left brakes. Only one side is disassembled and the other serves as a memento of how the brake parts fit together. Only after the job has been completed on one side is the other side disassembled. When the second side is disassembled, the first side acts as the memento.

##![](imgs/20170404-231900.png)

####Check list
1. First into the class and declare the originator a friend.
3. Caretaker knows when to check point the originator.
4. Originator creates a Memento and copies state to that Memento.
5. Caretaker holds on to the Memento but cannot peek into here.
6. Caretaker knows when to "roll back" the originator.


####Rules of thumb

Command and Memento act as magic tokens to be passed around and invoked at a later time. In Command, the token represents a request,in Memento, it represents the internal state of an object at a particular time. Polymorphism is important to Command, but not to Memento because its interface is so narrow that a memento can only be passed as a value. Command can use Memento to maintainthe state required for an undo operation. Memento is often used in conjunction with Iterator. The Iterator stores the Memento internally.
`

