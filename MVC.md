# Introduction:
  MVC Pattern stands for Model-View-Controller Pattern. It is a software architectural pattern for implementing user interfaces on computers. This pattern is used to separate application's concerns.  

# Description:
 In any typical application we will find  three fundamental parts:
•	Representation of Data (Model)
•	An interface to view and modify the given data (View)
•	The operations that can be performed on the data (Controller)

By the use of MVC pattern we can implement these things :
1.	Model represents the data and does not depend on the controller or the view.
2.	View displays the model data and sends user actions to the controller. The view can be independent of both the model and the controller or actually be the controller, and therefore depend on the model.
3.	Controller provides model data to the view and interprets user actions such as button clicks. The controller depends on the view and the model. In some cases, the controller and the view are the same object.

# Implementation:
Now I create a Student class which  acting as a Model. The StudentView  class which can print student details on console acting as a view and StudentController is the controller class responsible to store data in Student object and update view StudentView accordingly. MVCPatternDemo is  our demo class, will use StudentController to demo.
![](https://www.tutorialspoint.com/design_pattern/images/mvc_pattern_uml_diagram.jpg)
# Sample Code:
### Class 1: Create Model
Student.java
```
public class Student {
   private String rollNo;
   private String name
   public String getRollNo() {
      return rollNo;
   }
   public void setRollNo(String rollNo) {
      this.rollNo = rollNo;
   }
   public String getName() {
      return name;
   } 
   public void setName(String name) {
      this.name = name;
   }
}
```
### Class-2:Create View.
StudentView.java
```
public class StudentView {
   public void printStudentDetails(String studentName, String studentRollNo){
      System.out.println("Student: ");
      System.out.println("Name: " + studentName);
      System.out.println("Roll No: " + studentRollNo);
   }
}
```
### Class-3:Create Controller.
StudentController.java
```
public class StudentController {
   private Student model;
   private StudentView view;

   public StudentController(Student model, StudentView view){
      this.model = model;
      this.view = view;
   }

   public void setStudentName(String name){
      model.setName(name);		
   }

   public String getStudentName(){
      return model.getName();		
   }

   public void setStudentRollNo(String rollNo){
      model.setRollNo(rollNo);		
   }

   public String getStudentRollNo(){
      return model.getRollNo();		
   }

   public void updateView(){				
      view.printStudentDetails(model.getName(), model.getRollNo());
   }	
}
```
### Class -4: MVCPatternDemo
Use the StudentController methods to demonstrate MVC design pattern usage.
MVCPatternDemo.java
```
public class MVCPatternDemo {
   public static void main(String[] args) {

      //fetch student record based on his roll no from the database
      Student model  = retriveStudentFromDatabase();

      //Create a view : to write student details on console
      StudentView view = new StudentView();

      StudentController controller = new StudentController(model, view);

      controller.updateView();

      //update model data
      controller.setStudentName("John");

      controller.updateView();
   }
```
   private static Student retriveStudentFromDatabase(){
      Student student = new Student();
      student.setName("Robert");
      student.setRollNo("10");
      return student;
   }
}
Verify the output:
Student: 
Name: Shahed
Roll No: 21
Student: 
 
