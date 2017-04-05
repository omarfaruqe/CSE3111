# Flyweight design pattern #


In internet training, flyweight is a application design pattern. A flyweight is usually an object that minimizes ram usage by sharing as often data as possible having other similar objects; This can be a way to use objects in thousands when a simple replicated representation would use an unacceptable number of memory. Often some parts on the object state can be shared and it's common practice to store them in external facts structures and pass those to the flyweight objects temporarily whenever they are used.

## Categories and Subject Description:  ##

## Motivation ##
Some programs require quite a few objects that have some shared state and this includes. Consider for example an activity of war, were there is quite a few soldier objects; a soldier object maintain the graphical representation of some sort of soldier, soldier behavior like motion, and firing items, in addition soldiers health and location on the struggle terrain. Creating a multitude of soldier objects is required however it would incur a big memory cost. 

## Intent ##
•	This intent of this pattern using sharing to support quite a few objects that have component of their internal state in keeping where the other component of state can vary.

### Why do we care for number of objects in our program? ###
•	Less volume of objects reduces the ram usage, and it manages and keep us away from errors relevant to memory like java. lang. OutOfMemoryError.

Although creating an object in Java is very fast, we can still reduce the execution time of your program by sharing materials.

## 	Specific problems and implementation ##



-	**Text Editors**

Target oriented text editors ought to create Character Objects to help represent each character that is certainly in the document. A Character object maintains info on what is the identity, what is its font, what is the length of the character, as well as character location into the document. A document typically consists of extremely multitude of character objects which involves large memory. 



## Implementation ##

The figure below shows a UML class diagram for the Flyweight Pattern:


![](http://www.oodesign.com/images/design_patterns/structural/flyweight-design-pattern-implementation-uml-class-diagram.png)

Figure-1:Class diagram for the Flyweight pattern

###  Flyweight ###
-	Flyweight-Declares an interface where flyweights can receive in addition to act on extrinsic talk about.

	### ConcreteFlyweight  ###
-	ConcreteFlyweight -- Implements the Flyweight screen and stores intrinsic talk about. A ConcreteFlyweight object need to be sharable. The Concrete flyweight target must maintain state it's intrinsic to it, and must have the capacity to manipulate state that is usually extrinsic. In the war activity example graphical representation is usually an intrinsic state, where position and health states usually are extrinsic. Soldier moves, the motion behavior manipulates this external state (location) to manufacture a new location.

-	### FlyweightFactor ###
FlyweightFactor -This factory creates and is able to flyweight objects. In addition the factory ensures sharing on the flyweight objects. 

From the war example a Soldier Flyweight factory can produce two types of flyweights: some sort of Soldier flyweight, as well to be a Colonel Flyweight. When your customer asks the Factory for just a soldier, the factory checks to see if you experience a soldier in this pool, if there is usually, it is returned towards client, if there isn't a soldier in pool, a soldier is generated, added to pool, and returned towards client, the next time a client asks for a knight, the soldier created recently is returned, no new soldier is generated.

 -  Client 

-	Client - A client maintains references to flyweights together with computing and maintaining extrinsic state.

A client needs a flyweight object; it calls the factory to discover the flyweight object. The factory checks a pool of flyweights to view if a flyweight object of the requested type was in the pool, if there is, the mention of the that object is returned. If there is absolutely no object of the required type, the factory creates a flyweight on the requested type, adds it to this pool, and returns a reference towards flyweight. The flyweight maintains intrinsic state (are convinced that is shared among the multitude of objects that we have created the flyweight for) and provides methods to manipulate external state (Are convinced that vary from object to object and is particularly not common among the objects we have now created the flyweight for).

## Applicability & Examples ##
The flyweight pattern applies to a program using a huge number of objects that have part of their internal state in common where the other part of state can vary. The pattern is used when the larger part of the objects state can be made extrinsic (external to that object).

### Example - The war game. ###
This war game instantiates 5 Soldier buyers, each client maintains its internal state that's extrinsic to the soldier flyweight. And Although 5 clients are instantiated only one flyweight Soldier has become used. 


![](http://www.oodesign.com/images/design_patterns/structural/flyweight-design-pattern-example-uml-class-diagram.png)

### Figure-2: The war game pattern ###



## Flyweight pattern code ##

**Code.java**


package com.javacodegeeks.patterns.flyweightpattern;

public class Code {
	
	private String code;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
}




**Another code for testing flyweight:**
------------------

Testflyweight.java

package com.javacodegeeks.patterns.flyweightpattern;

public class Code {
	
	private String code;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
}


## Consequences ##
Flyweight pattern saves memory by sharing flyweight objects among clients. The amount of memory saved generally depends on the number of flyweight categories saved (for example a soldier category and a lieutenant category as discussed earlier).