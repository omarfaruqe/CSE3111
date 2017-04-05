### Introduction
Using 'Design Patterns' in object-oriented software engineering is very popular and common now-a-days. Like me, it may come accross your mind also that **Why will I use Design Pattern?**
Research shows that, most of the software design and development can be categorized in some common patterns. Design patterns will help you to solve your problem or designing your software in very efficient way. These solutins that are defiend in design patter is gained through continous testing, error finding, methods of solving the errors, minimizing development process and so on. And these are done by well known software engineers accross the whole world during a remarkable time. So we can expect that Desing Patters will show the best efficient way to design Software.


As I mentioned before, Design Patterns consits of number of patterns according to various types of problems. In this article I will discuss about a well knowned design pattern named **Blackboard Design Pattern**. Pretty cool name, right??

In software engineering, Blackboard pattern is used for such types of problems which contain separate systems and these separate systems are needed to be organized based on thier priority. Actually it is a behavioural design pattern because reactions and performence of software is affected by it.

### Benefits

The Blackboard design patterns allows to devide problem into sub problems. And the special thing is it allows working on all the sub problems together and one can access and react to another subproblem if required. And also the final solution will be updated alongside based on priroity.

### Structure

The Blacboard inclued somes storages which is known as "Global Variables". These are like store house which consists separate informations and can be accessed by automated approaced or systems. This systems can be separate or the same. The automated processes generate some resopnse as output on blackboard. A controller keeps tracks of the responses on blacboard and decides the actions according to the priority.

### Implementation

The implementation of blackboard design pattern follows the below class diagram.

![structure](https://upload.wikimedia.org/wikipedia/commons/1/18/Blackboad_pattern_system_structure.png)

It has three parts as you see in the above diagram.

1. Knowledge Sources
1. Blackboard
1. Control

**Knwoledge Sources** are basically large and diversed.These are highly specialized modules. Conditions are defined in these modules and actions that will be taked based on the conditions.

**Blacboard** is basically some nodes. It a data structure of glabal memory which contains solutions Knowledge Sources can read from the blacboard. Knowledge sources access from blackboard the according to the actions, it again reads on the blackboard.

**Control** reads from Blackboard and activates the Knowledge Sources on basis of that. It conatins some non deterministic logics and complex control stratigies.

### Sample Code

This is sample C# code for a Radar Missile Defence System where several separate systems have to work together, to analyse and act upon incoming objects. 

```C#
public Controller(Blackboard board) 
{ 
    blackboard = board; 
 
    theRadar = new Radar(); 
    KnowledgeSources.Add(theRadar); 
    KnowledgeSources.Add(new SignalProcessor(DateTime.Now.Millisecond)); 
    KnowledgeSources.Add(new ImageRecognition()); 
    KnowledgeSources.Add(new PlaneIdentification()); 
    KnowledgeSources.Add(new WarMachine()); 
 
    OrderKnowledgeBases(); 
 
    foreach (var ks in OrderedKnowledgeSources) 
        ks.Configure(blackboard); 
 
    controlLoopTimer = new DispatcherTimer { Interval = TimeSpan.FromSeconds(1) }; 
    controlLoopTimer.Tick += new EventHandler(tick); 
    controlLoopTimer.IsEnabled = true; 
}
```
*For more documentation on this project [Click here](https://social.technet.microsoft.com/wiki/contents/articles/13461.blackboard-design-pattern-a-practical-example-radar-defense-system.aspx) *

Examples Of Blackboard Design Patten:

Speech to Text conversion or speech recognition is very common example of Backboard design pattern. Actually blackboard design pattered was first implemented on this. There are different parts like frequencies, amplitudes in a sound wave. Saperate systems process this various parts of sound wave and recognizes the words.

![sound-wave](https://cloud.githubusercontent.com/assets/17364343/24720460/0a234a08-1a5f-11e7-93f7-afefdcda92ea.JPG)

 Then it updates the blackboard according to the recognized words. Then a separate system read the generated words from the blackboard and do the sytexical changes like applying sentence sturceture and grammer using the words. Another separate system may use this sentences and reform them to generate various probable meanings. Another more intelligent system can use all the meanings and choose the most appropriate meaning from them. Meanwhile more sound waves are comming and generating the words. So each separates process are working together and all of them have access to the blackboard.

