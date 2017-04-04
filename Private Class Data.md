# Private Class Data

### Defination :
The Private Class Data Pattern addresses the issue a class may have, concerning around protecting object state, where final cannot be declared.This pattern is structural and is also known as PIMPL(Private IMPLementation).

### Discussion :

A class may expose its attributes (class variables) to manipulation when manipulation is no longer desirable after construction. Using the private class data design pattern prevents that undesirable manipulation.A class may have one-time mutable attributes that cannot be declared final. Using this design pattern allows one-time setting of those class attributes.
The motivation for this design pattern comes from the design goal of protecting class state by minimizing the visibility of its attributes (data).

The private class data design pattern seeks to reduce exposure of attributes by limiting their visibility.

It reduces the number of class attributes by encapsulating them in single Data object. It allows the class designer to remove write privilege of attributes that are intended to be set only during construction, even from methods of the target class.


### Structure:

The private class data design pattern solves the problems above by extracting a data class for the target class and giving the target class instance an instance of the extracted data class.
![private](https://cloud.githubusercontent.com/assets/25974121/24419262/6d3487e6-13a3-11e7-89af-6dc44faa6021.PNG)

### Consequence:

The consequences of using this design pattern include the following:

   * Controlling write access to class attributes;
   * Separating of data from methods that use it;
   * Encapsulating class attribute (data) initialization; and
   * Providing new type of final: final after constructor.

### Implementation :

The private class data design pattern solves the problems above by extracting a data class for the target class and giving the target class instance an instance of the extracted data class.

   * The data class exposes each attribute (variable or property) through a getter.
   * The data class exposes each attribute that must change after construction through a setter.


   
### Sample code

The following C# code illustrates an opportunity to use the private class data design pattern:

![private2](https://cloud.githubusercontent.com/assets/25974121/24420529/ffe86b58-13a7-11e7-9d1e-9166d33c500c.PNG)

The attributes radius, color, and origin above should not change after the Circle() constructor. Note that the visibility is already limited by scoping them as private, but doing methods of class Circle can still modify them.

The excess exposure of the attributes creates a type of (undesirable) coupling between methods that access those attributes. To reduce the visibility of the attributes and thus reduce the coupling, implement the private class data design pattern, as follows:

![private3](https://cloud.githubusercontent.com/assets/25974121/24420933/72ad158e-13a9-11e7-8b3f-c5c60b63d6cc.PNG)
![private4](https://cloud.githubusercontent.com/assets/25974121/24421058/cb8f1d64-13a9-11e7-98f3-9fe456bae4a3.PNG)


