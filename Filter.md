Filter Design Pattern
=
Intent
-
1. It can be used to filter a set of objects using different criteria.
2. It uses to unite more than one criteria to one criteria.

When to use
-
Filter or Criteria can be used when objects are to be chosen on different criteria.

Problem
-
A group of objects from a set of objects are to be chosen based on some criteria. Is it would be okay to try a brute force search? or implement some interface?

Discussion
-
Filter pattern mainly focuses on filtering a list of objects. It can be performed by checking and discarding all the objects from a list but with a increased number of objects, it is hard to maintain this idea. Object Oriented feature can easily be implemented to solve this problem. Here, filter pattern uses a interface which is implemented in different classes. By this, a specified list is created by which the filtering is much faster for the preferred criteria.

Structure
-
The interface could represent an abstract base class which would be implemented via different criteria as different concrete classes. Using the criteria objects, the filterred list can easily be generated.

Example & Implementation
-
A filter pattern uses some criteria for a filterred result. As example, a list of employee of a firm can be generated, where the criteria can be a list based on gender, marital status, and/or both.
A criteria interface contains the method to generate the lists. Lists are created via criteria classes.

![Structure of Criteria Pattern of filtering people based on gender and/or marrital status](filter.jpg Structure of Filter Pattern)

###Check List-
1. Identify the criteria.
2. Specify the signature for that criteria in an interface.
3. Bury the alternative implementation details in derived classes.

Rules of Thumb-
-
* Filter pattern is more likely template method.
* It uses the bruteforce checking but in a better manner.

Sample Code
-
    //Person.java
    public class Person 
    {
       private String name;
       private String gender;
       private String maritalStatus;

       public Person(String name, String gender, String maritalStatus)
       {
          this.name = name;
          this.gender = gender;
          this.maritalStatus = maritalStatus;  
        }
       public String getName() 
       {
          return name;
       }
       public String getGender() 
       {
          return gender;
       }
       public String getMaritalStatus() 
       {
          return maritalStatus;
       }    
    }


    //Criteria.java
    import java.util.List;

    public interface Criteria 
    {
       public List<Person> meetCriteria(List<Person> persons);
    }


    //CriteriaMale.java
    import java.util.ArrayList;
    import java.util.List;

    public class CriteriaMale implements Criteria 
    {

       @Override
       public List<Person> meetCriteria(List<Person> persons) 
       {
          List<Person> malePersons = new ArrayList<Person>(); 
          
          for (Person person : persons) 
          {
             if(person.getGender().equalsIgnoreCase("MALE"))
             {
                malePersons.add(person);
             }
          }
          return malePersons;
       }
    }

    //CriteriaFemale.java
    import java.util.ArrayList;
    import java.util.List;

    public class CriteriaFemale implements Criteria 
    {

       @Override
       public List<Person> meetCriteria(List<Person> persons) 
       {
          List<Person> femalePersons = new ArrayList<Person>(); 
          
          for (Person person : persons) 
          {
             if(person.getGender().equalsIgnoreCase("FEMALE"))
             {
                femalePersons.add(person);
             }
          }
          return femalePersons;
       }
    }

    //CriteriaSingle.java
    import java.util.ArrayList;
    import java.util.List;

    public class CriteriaSingle implements Criteria 
    {

       @Override
       public List<Person> meetCriteria(List<Person> persons) 
       {
          List<Person> singlePersons = new ArrayList<Person>(); 
          
          for (Person person : persons) 
          {
             if(person.getMaritalStatus().equalsIgnoreCase("SINGLE"))
             {
                singlePersons.add(person);
             }
          }
          return singlePersons;
       }
    }


    //AndCriteria.java
    import java.util.List;

    public class AndCriteria implements Criteria 
    {
       private Criteria criteria;
       private Criteria otherCriteria;
       public AndCriteria(Criteria criteria, Criteria otherCriteria) 
       {
          this.criteria = criteria;
          this.otherCriteria = otherCriteria; 
       }

       @Override
       public List<Person> meetCriteria(List<Person> persons) 
       {
          List<Person> firstCriteriaPersons = criteria.meetCriteria(persons);       
          return otherCriteria.meetCriteria(firstCriteriaPersons);
       }
    }

    //OrCriteria.java
    import java.util.List;
    public class OrCriteria implements Criteria 
    {
       private Criteria criteria;
       private Criteria otherCriteria;
       public OrCriteria(Criteria criteria, Criteria otherCriteria) 
       {
          this.criteria = criteria;
          this.otherCriteria = otherCriteria; 
       }

       @Override
       public List<Person> meetCriteria(List<Person> persons) 
       {
          List<Person> firstCriteriaItems = criteria.meetCriteria(persons);
          List<Person> otherCriteriaItems = otherCriteria.meetCriteria(persons);
          for (Person person : otherCriteriaItems) 
          {
             if(!firstCriteriaItems.contains(person))
             {
                firstCriteriaItems.add(person);
             }
          } 
          return firstCriteriaItems;
       }
    }

<sub>This code is copied from - [This website](https://www.tutorialspoint.com/design_pattern/filter_pattern.htm) </sub>
