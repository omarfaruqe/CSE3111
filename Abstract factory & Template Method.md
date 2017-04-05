# Abstract factory

### Defination :
Abstract Factory patterns work around a super-factory which creates other factories. This factory is also called as factory of factories. This type of design pattern comes under creational pattern as this pattern provides one of the best ways to create an object.

In Abstract Factory pattern an interface is responsible for creating a factory of related objects without explicitly specifying their classes. Each generated factory can give the objects as per the Factory pattern.

### Discussion :

Provide a level of indirection that abstracts the creation of families of related or dependent objects without directly specifying their concrete classes. The "factory" object has the responsibility for providing creation services for the entire platform family. Clients never create platform objects directly, they ask the factory to do that for them.

This mechanism makes exchanging product families easy because the specific class of the factory object appears only once in the application - where it is instantiated. The application can wholesale replace the entire family of products simply by instantiating a different concrete instance of the abstract factory.

Because the service provided by the factory object is so pervasive, it is routinely implemented as a Singleton.


### Code Examples :

FactoryProducer.java  <br>
public class FactoryProducer { <br>
   public static AbstractFactory getFactory(String choice){ <br>
      if(choice.equalsIgnoreCase("SHAPE")){ <br>
         return new ShapeFactory();<br>
      }else if(choice.equalsIgnoreCase("COLOR")){ <br>
         return new ColorFactory(); <br>
      } <br>
      return null; <br>
   } <br>
} <br>

# Template Method

### Defination :
In Template pattern, an abstract class exposes defined way(s)/template(s) to execute its methods. Its subclasses can override the method implementation as per need but the invocation is to be in the same way as defined by an abstract class. This pattern comes under behavior pattern category.

### Discussion :

The component designer decides which steps of an algorithm are invariant (or standard), and which are variant (or customizable). The invariant steps are implemented in an abstract base class, while the variant steps are either given a default implementation, or no implementation at all. The variant steps represent "hooks", or "placeholders", that can, or must, be supplied by the component's client in a concrete derived class.

The component designer mandates the required steps of an algorithm, and the ordering of the steps, but allows the component client to extend or replace some number of these steps.

Template Method is used prominently in frameworks. Each framework implements the invariant pieces of a domain's architecture, and defines "placeholders" for all necessary or interesting client customization options. In so doing, the framework becomes the "center of the universe", and the client customizations are simply "the third rock from the sun". This inverted control structure has been affectionately labelled "the Hollywood principle" - "don't call us, we'll call you".


### Code Examples :

abstract class Generalization { <br>
   public void findSolution() { <br>
      stepOne(); <br>
      stepTwo(); <br>
      stepThr(); <br>
      stepFor(); <br>
   } <br>
   protected void stepOne() { System.out.println( "Generalization.stepOne" ); } <br>
   abstract protected void stepTwo(); <br>
   abstract protected void stepThr(); <br>
   protected void stepFor() { System.out.println( "Generalization.stepFor" ); } <br>
} <br>
abstract class Specialization extends Generalization { <br>
   protected void stepThr() { <br>
      step3_1(); <br>
      step3_2(); <br>
      step3_3(); <br>
   } <br>
   protected void step3_1() { System.out.println( "Specialization.step3_1" ); } <br>
   abstract protected void step3_2(); <br>
   protected void step3_3() { System.out.println( "Specialization.step3_3" ); } <br>
} <br>

class Realization extends Specialization { <br>
   protected void stepTwo() { System.out.println( "Realization   .stepTwo" ); } <br>
   protected void step3_2() { System.out.println( "Realization   .step3_2" ); } <br>
   protected void stepFor() { <br>
      System.out.println( "Realization   .stepFor" ); <br>
      super.stepFor(); <br>
}  } <br>
class TemplateMethodDemo { <br>
   public static void main( String[] args ) { <br>
      Generalization algorithm = new Realization(); <br>
      algorithm.findSolution(); <br>
}  } <br>
