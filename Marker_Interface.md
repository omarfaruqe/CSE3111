Course Material of

CSE3111-Software Engineering, CSE3112-Software Engineering Lab, CSE3162-Software Development Lab

Design Patterns Assignment

Intent
Marker interface is used as a tag to inform a message to the java compiler so that it can add special behavior to the class implementing it . Java Marker Interface has no members in it. An empty interface having no methods or content is called a marker interface .Java supplied marker interface are very few like cloneable, serializable etc.We can create our won marker interface the same way as they create any other java class.

Purpose of having marker interface
- The purpose to have marker is to create special types in those cases where the types themselves have no behaviors particular to them. 

- marker interface in java serializable , cloneable remote it looks they are use to indicate something to compiler or jvm.

- Marker interface is an interface with no method declaration.

Problem an Solution
At first of java marker interface were the only one way to declare metadata about a class. with the advent of annotation in java 5 , it is considered that marker interface have now no place. they can be completely replaced by Annotation.Which allow for a very flexible metadata capability. Every thing that can be done with marker marker interface can be done instead with annotations.

Structure
![](https://www.researchgate.net/profile/Maarten_Bynens/publication/220116629/figure/download/fig7/AS:305837651316754@1449928786750/Figure-8-Structure-of-marker-interface.png)

Simple Code

	import java.io.FileOutputStream; 
	import java.io.IOException; 
	import java.io.ObjectOutputStream; 
	import java.text.DateFormat; 
	import java.text.ParseException; 
	import java.text.SimpleDateFormat; 
	import java.util.Date; 
	import com.home.markerDemo.Employee; 

	public class SerializeDemo {
	 public SerializeDemo() {
				} 
		public static void main(String[] args) { 
						Employee employee = new Employee(); 
						employee.setFirstName( "John" ); 
						employee.setLastName( "Smith" ); 
						employee.setDepartment( "Technical" );
					 	employee.setEcode(1234); 
						
					try 
						{ 
						String dojStr = "1971-07-15"; 
						DateFormat df = new SimpleDateFormat( "yyyy-MM-dd" ); 
						Date dojDate = null; 
						dojDate = df.parse(dojStr); 
						employee.setDateOfJoining(dojDate); 
						FileOutputStream fileOut = new FileOutputStream( "employee.ser" ); 
						ObjectOutputStream out = new ObjectOutputStream(fileOut); 
					    out.writeObject(employee); 
						out.close(); 
					    fileOut.close();
						} 

						catch (IOException i) 
							{ 
							i.printStackTrace();
							} 

							catch (ParseException e) 
							{ 
							e.printStackTrace(); 
							} 
		} 
}

Conclusion
The interface have dose not any method . In java we have four major marker interface, 
		
	1. Serilzable Interface
	2. Cloneable Interface
	3. Remote Interface
	4. Threadsafe Interface 
