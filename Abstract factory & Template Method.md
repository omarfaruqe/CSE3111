# Abstract factory

### Defination :
Abstract Factory pattern is an interface is responsible for creating a new factory of related object without explicitly specifying their classes. Each generated factory can give the objects as per the Factory pattern.

Abstract pattern works a super-factory that creates other factory.so we can say this factory is also known as factory of factories. This kind of design pattern come under creational pattern as this pattern provides one of the best ways to create an object.

### Discussion :

The mechanism make  product family easy because the class of that factory object appears only once in the application in where it is being instantiated. This application can be wholesale replace the  family of product simply by instantiating a different concrete in instance of the abstract factory.


Provide the level of indirection that is abstract the creation of families of the related or the dependent object without directly specify their concrete class. The factory object have the responsibility for providing creation services for the entire platform famiies. Client never creates platform objects directly, they ask the factory to do that for them.
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
In the Template pattern method, the abstract classes expose defined way to execute this method. Its subclasses can be override the method implementation as per need but that invocation is to be in the same way as defined by the abstract class. This template patterns come under pattern category.

### Discussion :

This Method is being used prominently in framework.Every framework implement the invariant pieces of the domain's architecture,and defines placeholders for all necessaries  client customization options. So doing, the framework becomes the center of  univers, and the client customizations are simply the third rock from the sun. This inverted control structure has been affectionately labellel the Hollywood, dont call us, we will call you.

The component designer decide in which steps of the algorithm are invariant, and which are variant. The invariant step are being implemented in abstract base class when the variant steps are either given a default implementation. The variant steps represent hooks that can be supplied by the component's client in the concrete derived classes.

In component designer mandate the required steps of the algorithm and the ordering of the step but allows the component clients to extend some number of steps.




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
