Messaging design pattern(MDP)
=============================
A messaging design pattern is a network-based architectural pattern which describes how two different parts of a message passing throuth system connect and communicate with each other.


Types and Description of Subjects: 
----------------------------------

### 1. Applicability : <br>
 We all know the importance of messaging. It need not to be described at all. Parsing of message is everywhere.
 We are actually all dependent on message. So messaging design pattern is very much important in the real world.

### 2. Participators : <br>

* Receiving of messages: <br>
Component can receive the message that is  given as input and can produce a reply after the proeccesing it. The message that we give as input can be any information. 

* Messenger : <br>
Medium that sneds the message from the sender to the receiver. The person who sends the message and the person who receives does 
not need to know about the internal processing. The modes can be synchronus, asynchronus and two way messaging. 

* Message : <br>
There are only two types of message. Input message and Output message. There is no reply message. 


###  3. Design process : <br>
The Messaging Design Pattern simplifies and ease the process. There is very small resemblance between the UML design pattern and the implementation. The UML model and implement are not connected when Module Design Pattern is not used. 

###  4. Structure : <br>
Messaging Design Pattern is implemented using the messaging interface . The interface handles only one input message and produces only one output message. 

![1](https://cloud.githubusercontent.com/assets/18693440/24081211/8174cd5e-0cd9-11e7-901c-f78c35858ec7.png)

#### Fig. 1. Messaging Interface
The messing design pattern messaging interface is very much simple but strong. The simplicity of the interface is amazing. The function needs only one parameter. It acts as a global model interface . In Java, the messaging interface can be declared 
as the following form :

#### public interface JtInterface { Object processMessage (Object message); }
The message receiver needs to implement this interface for the message that comes as an incoming message. 
Java programming language can be implemented as a messaging design pattern.

![22](https://cloud.githubusercontent.com/assets/18693440/24081542/113cfc76-0ce0-11e7-83ca-d2fe321eac37.png)
#### Fig. 2. Synchronous Messaging Design Pattern 
![3](https://cloud.githubusercontent.com/assets/18693440/24081560/5ecddfbe-0ce0-11e7-887b-4278868103fc.png)
#### Figure 3. Synchronous mode without messenger MDP


### 5. Quality and Maintainability: 

Messaging design pattern improves the software quality and software maintainances.

### 6. Code Examples :

import java.io.FileReader; <br>
import java.io.IOException; <br>
import java.util.Properties; <br>

class MDP <br>
{ <br>

  public static void main(String[] args) throws IOException <br>
  { <br>

    try (FileReader fileReader = new FileReader("db.properties");) 
    { 

      Properties ob = new Properties(); 
      /* 
       Reads a property list from the input character stream in a simple line-oriented format. 
       */ 
      ob.load(fileReader); 

      /* 
       Prints this property list out to the  specified output stream.This method is useful for debugging. 
       */
       ob.list(System.out); 

    } 
  }  <br>
} <br>
