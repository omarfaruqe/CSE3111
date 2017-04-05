##Composite Pattern

###Intent:
The intent is to compose the objects by tree structure to represent part-whole hierarchy. Here the term “part-whole hierarchy” means components of a system where the components can further be partitioned or parted into smaller components.  Implementation of composite pattern allows clients treat single objects as well as compositions of objects in the same manner as a single object.

###Motivation:
While working with tree-structured data, programmers sometimes have to differentiate among leaf-nodes and branches which leads to more complexity in code and causes error. It can be solved by using an interface which will allow to treat composite and primitive objects indiscriminately. In OOP, an object which is designed as a composition of one-or-more similar objects, where all these objects exhibit similar functionality, is a composite. The main thing is that one can manipulate a single instance of an object just like he/she would manipulate a composition of those objects. Most of the times the operations that can be performed on all these composite objects have a least common denominator relationship among them. For example, consider a file system is a tree structure where folders are branches and files are leaf-nodes. A folder object can consist of one or more file or folder objects; thus it is a complex object. On the other hand, file is a simple object. Now files and folders have common functionalities, such as operations like moving and copying a file or a folder, listing file or folder and attributes like file name and size. So it would be more convenient and easier to treat both file and folder objects uniformly.

###Applicability:
When it is the case that the clients to ignore discrimination between compositions of objects and single objects, Composite pattern can be used. More specifically if programmers realize that they are treating multiple objects in the same manner and almost every time they are using nearly the same code to handle each of these objects, then it is a good choice to implement composite pattern; in this situation it is less complex to treat primitives and composites as homogeneous.

###Structure:
![structure](https://cloud.githubusercontent.com/assets/26010300/24720832/35156d94-1a60-11e7-8713-fe2eb8da7449.png)

* Component: It is the abstraction for all objects, including composite ones. Here, the declaration of the interface for objects in the composition, takes place.
* Leaf: It represents leaf objects i.e. objects that do not have children in the composition. All component methods are implemented here.
* Composite: represents a composite object i.e. objects that have children). Methods to manipulate children are implemented here. Component methods are also implemented here.


###Example:
An example of composite pattern is given below. Here “back end developer” and “front end developer” working under “Developer”. Again Front end engineers (F.E engg) are working under “Front end developer” and Back end engineers (B.E engg) are working under “Back end developer”. So, here F.E. engg and B.E. engg are leaf-nodes and others are composite components. It is also shown in the pictorial diagram.
![](C:\Users\Aashique\Desktop\composite pattern/Untitled.png)


Now the corresponding class diagram showing attributes and operations of leaf-nodes and composite components is shown below:
![class_diagram](https://cloud.githubusercontent.com/assets/26010300/24720617/8854a3ea-1a5f-11e7-84ff-767a064a55ec.png)
A corresponding java code implementing this example by using composite pattern is given below:
**IEmployee.java:**
```java
public interface IEmployee
{
  public int getYearlySalary();

}
```
**Employee.java:**
```java
import java.util.ArrayList;

// Employee class is the Composite node [i.e. it can have other objects below it]

public class Employee implements IEmployee
{

  private String               name;
  private int                  monthlySalary;
  
  // Employee designation Can be Lead Developer,Front end developer, Back end developer
  
  private String               designation;

  private ArrayList<IEmployee> subordinateList = new ArrayList<IEmployee>();

  public Employee( String name, int monthlySalary, String designation )
  {
    super();
    this.name = name;
    this.monthlySalary = monthlySalary;
    this.designation = designation;
  }

  public String getName()
  {
    return name;
  }

  public void setName( String name )
  {
    this.name = name;
  }

  public int getMonthlySalary()
  {
    return monthlySalary;
  }

  public void setMonthlySalary( int monthlySalary )
  {
    this.monthlySalary = monthlySalary;
  }

  public String getDesignation()
  {
    return designation;
  }

  public void setDesignation( String designation )
  {
    this.designation = designation;
  }

  public ArrayList<IEmployee> getSubordinateList()
  {
    return subordinateList;
  }

  public void setSubordinateList( ArrayList<IEmployee> subordinateList )
  {
    this.subordinateList = subordinateList;
  }

  @Override
  public int getYearlySalary()
  {
    return monthlySalary * 12;
  }

  public void addSubordinate( IEmployee employee )
  {
    subordinateList.add(employee);
  }

  public void removeSubordinate( IEmployee employee )
  {
    subordinateList.remove(employee);
  }

  public ArrayList<IEmployee> getChilds()
  {
    return getSubordinateList();
  }

}

```
**SoftwareEngineer.java:**
```java
// SoftwareEngineer class is the Leaf node [i.e. it cann't have other objects below it]

public class SoftwareEngineer implements IEmployee
{
  private String name;
  private int    monthlySalary;
  
  // Employee designation Can be F.E Engineer, B.E Engineer
  private String designation;

  public SoftwareEngineer( String name, int monthlySalary, String designation )
  {
    super();
    this.name = name;
    this.monthlySalary = monthlySalary;
    this.designation = designation;
  }

  public String getName()
  {
    return name;
  }

  public void setName( String name )
  {
    this.name = name;
  }

  public int getMonthlySalary()
  {
    return monthlySalary;
  }

  public void setMonthlySalary( int monthlySalary )
  {
    this.monthlySalary = monthlySalary;
  }

  public String getDesignation()
  {
    return designation;
  }

  public void setDesignation( String designation )
  {
    this.designation = designation;
  }

  @Override
  public int getYearlySalary()
  {
    return monthlySalary * 12;
  }
}
```
**CompositePatternDemo.java**
```java
import java.util.ArrayList;

public class CompositePatternDemo
{

  public static void main( String[] args )
  {
    //Employee dave = new Employee("Dave", 200000, "CEO");
    Employee AAA = new Employee("AAA", 200000, "Lead Developer");

    Employee BBB = new Employee("BBB", 100000, "Front end developer");
    Employee CCC = new Employee("CCC", 100000, "Back end developer");

    SoftwareEngineer DDD = new SoftwareEngineer("DDD", 50000, "F.E Engineer");
    SoftwareEngineer EEE = new SoftwareEngineer("EEE", 50000, "F.E Engineer");
    
    SoftwareEngineer FFF = new SoftwareEngineer("FFF", 50000, "B.E Engineer");
    SoftwareEngineer GGG = new SoftwareEngineer("GGG", 50000, "B.E Engineer");

    AAA.addSubordinate(BBB);
    AAA.addSubordinate(CCC);

    BBB.addSubordinate(DDD);
    BBB.addSubordinate(EEE);

    CCC.addSubordinate(FFF);
    CCC.addSubordinate(GGG);

    getSubOrdinates(AAA);
    getSubOrdinates(BBB);
    getSubOrdinates(CCC);
    getSubOrdinates(DDD);
    getSubOrdinates(EEE);

 }

  private static void getSubOrdinates( IEmployee iemployee )
  {
    if( iemployee instanceof Employee )
    {
      Employee employee = (Employee) iemployee;
      System.out.println("\n------------- SubordinatesListOf "+ employee.getName() +" : "+employee.getDesignation() + " ---------------------------------\n");
      ArrayList<IEmployee> subordinatesListOfDave = employee.getChilds();
      for( IEmployee iEmployee : subordinatesListOfDave )
      {
        if( iEmployee instanceof Employee )
        {
          Employee employeeObj = (Employee) iEmployee;
          System.out.println(employeeObj.getName() + " : " + employeeObj.getDesignation() + ":"
                          + employeeObj.getMonthlySalary() + ":" + employeeObj.getYearlySalary());
        }
        else
        {
          SoftwareEngineer softwareEngineer = (SoftwareEngineer) iEmployee;
          System.out.println(softwareEngineer.getName() + " : "
                          + softwareEngineer.getDesignation() + ":"
                          + softwareEngineer.getMonthlySalary() + ":"
                          + softwareEngineer.getYearlySalary());

        }

      }
    }
    else
    {
      System.out.println("\n--------------------------------------------------------------------------------------");
      SoftwareEngineer softwareEngineer = (SoftwareEngineer) iemployee;
      System.out.println("\nNo Subordinates for "+softwareEngineer.getName()+" : "+softwareEngineer.getDesignation()
          +" : "+softwareEngineer.getMonthlySalary()+" : "+softwareEngineer.getYearlySalary());
    }
    
  }

}
```
###Rules of thumb

* There is similarity between Composite and Decorator structure diagrams, reflecting the fact that the both depend on recursive composition for the organization of an open-ended number of objects.
* Composite can be implemented with Iterator. An operation can be applied over a Composite by a Visitor. Composite could implement Chain of Responsibility to let the child components access global properties through their parent. Decorator can also be used by composite to override these properties on parts of the composition. Observer could be used to tie one object structure to another and stated to let a component change its behavior with its state changes.
* By implementing Composite pattern one can compose a Mediator out of smaller pieces by recursive composition.
* Flyweight and Composite is often combined to implement shared leaf nodes.

###References
1. Gamma, Erich; Richard Helm; Ralph Johnson; John M. Vlissides (1995). Design Patterns: Elements of Reusable Object-Oriented Software. Addison-Wesley. p. 395. ISBN 0-201-63361-2.
2. https://www.tutorialspoint.com/design_pattern/composite_pattern.htm
3. https://sourcemaking.com/design_patterns/composite
4. http://www.journaldev.com/1535/composite-design-pattern-in-java
