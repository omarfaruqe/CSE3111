Messaging design pattern(MDP)
=============================

In software architecture, a messaging pattern is a network-oriented architectural pattern which describes how two different parts of a message passing system connect and communicate with each other.

Categories and Subject Descriptors:
-----------------------------------

### 1. Applicability : <br>

This design pattern can be applied to solve a great variety of problems in many diverse scenarios. A messaging paradigm is widely used in the real world. Messages are interchanged all around us. Entities are constantly sending, receiving and processing messages. Human beings for instance: when we watch TV, when we talk to a friend, talk over the phone, or send an email message. Right now, you are reading this written message which is possible because of messaging. Since computer applications seek to model the real world, it is only natural to design and write applications using a messaging approach. We can argue that messaging provides a better and more accurate representation (i.e. model) of the real world.

### 2. Participants : <br>
* Message Sender : Component that sends the message.

* Message Recipient (Receiver) : <br>
Component that receives the input message and may produce a reply (output message) after processing it. The input message, general in nature, may contain any type of information. The component may be instructed to perform computations based on the input message.

* Messenger : <br>
Intermediary that transfers the message from the sender to the recipient. The sender and the recipient do not need to be concerned about how the message is transferred and the transformations performed on the message along the way. The message can be sent directly to the message recipient. Several modes of communication are possible: synchronous, asynchronous and two-way messaging.

* Message : <br>
any piece of information (i.e. data) that needs to be interchanged between sender and recipient. Two messages are usually involved: input message and output message (or reply message). The reply message is not required.


###  3. Design process : <br>
MDP improves and simplifies the design process. The bulk of the design work becomes defining the set of components needed to meet the system requirements and the input/output messages that each component needs to handle. There is a tight correspondence between UML design diagrams and the components needed for the implementation. Several UML diagrams are geared towards messaging although their implementation does not rely on it. The UML model and the implementation are disconnected when MDP is not used. Since all components share the same messaging interface, they can also be readily added to BPM/BPEL diagrams. As mentioned earlier, this is similar to building blocks that can be reused and connected in many different ways.

###  4. Structure : <br>
The messaging design pattern is implemented using the messaging interface (JtInterface). This interface
consists of a single method to process the input message and produce a reply message 

![1](https://cloud.githubusercontent.com/assets/18693440/24081211/8174cd5e-0cd9-11e7-901c-f78c35858ec7.png)
#### Fig. 1. Messaging Interface
The MDP messaging interface is simple but powerful. The simplicity of this interface can be deceiving. One method with one parameter (message) is all that is needed. It acts as a universal messaging interface that applies to local remote and remote components. This interface handles any type of message (For instance, the Java Object class). It returns a reply (of any type). In Java, the messaging interface can be declared as follows: 
#### public interface JtInterface { Object processMessage (Object message); }
The message receiver needs to implement this interface in order to receive and process incoming messages. Although Java is used here, MDP can be implemented using any comparable computer language. Languages that do not use interfaces can simply declare a processMessage() function or method in order to implement MDP.

![22](https://cloud.githubusercontent.com/assets/18693440/24081542/113cfc76-0ce0-11e7-83ca-d2fe321eac37.png)
#### Fig. 2. Messaging Design Pattern (synchronous mode).
![3](https://cloud.githubusercontent.com/assets/18693440/24081560/5ecddfbe-0ce0-11e7-887b-4278868103fc.png)
#### Figure 3. Messaging Design Pattern (synchronous mode without messenger involved)


### 5. Quality and software maintenance : 
Quality and software maintenance efforts are also improved as a result of the all of the above.

### 6. Code Examples :

import java.io.FileReader; <br>
import java.io.IOException; <br>
import java.util.Properties; <br>

/* <br>
 * public void list(PrintStream out) <br>
 *  <br>
 * Parameters: <br>
 * ---------- <br>
 *  <br>
 * out - an output stream. <br>
 */ <br>
class PropertiesDemo <br>
{ <br>

  public static void main(String[] args) throws IOException <br>
  { <br>

    try (FileReader fileReader = new FileReader("db.properties");) <br>
    { 

      Properties p = new Properties(); 
      /* 
       * Reads a property list (key and element pairs) 
       * from the input character stream in a simple 
       * line-oriented format. 
       */ 
      p.load(fileReader); 

      /* 
       * Prints this property list out to the 
       * specified output stream.This method is useful 
       * for debugging. 
       */
      p.list(System.out); 

    } 

  } 
} 
