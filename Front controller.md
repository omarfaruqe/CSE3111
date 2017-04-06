# FRONT CONTROLLER

**Defination:**
             The Front controller provides a centralized request handling mechanism so that all requests will be handled by a single handler. Front controller is a centralized entry point for handling requests. Front controller will do the authentication/ authorization/ logging or tracking of request and then pass the requests to corresponding handlers.

**Class diagram:**
<br>
![class diagram](https://cloud.githubusercontent.com/assets/26034726/24736727/9ab40caa-1aab-11e7-8f9f-c8caf2936372.PNG)

**Various Strategies for Front Controller:**

*The two strategies supports are front controller:*
Servlent strategy and JSP strategy.

**Servlent strategy:**
Servlent strategy is the Servlent act Front controller.Servlent strategy more preferred since servlent acts as front controller.

**JSP strategy:**
JSP strategy is the JSP acts as controller.JSP strategy not preferred since JSP is the mainly used for view.

**Implemantation:**
we are going to create a *FrontController* and *Dispatcher* to act as Front Controller and Dispatcher correspondingly. *HomeView* and *StudentView* represent various views for which requests can come to front controller.

**FrontControllerPatternDemo:**
<br>
![front](https://cloud.githubusercontent.com/assets/26034726/24736743/b3bec3f2-1aab-11e7-9145-41425ba84e1a.PNG) 


**Step 1
Create Views.**

**HomeView.java**

public class HomeView {

   public void show(){

      System.out.println("Displaying Home Page");
     }
    }
**StudentView.java**

public class StudentView {

   public void show(){

      System.out.println("Displaying Student Page");
      }
    }
**Step 2
Create Dispatcher.**

**Dispatcher.java**

public class Dispatcher {

   private StudentView studentView;

   private HomeView homeView;
   
   public Dispatcher(){

      studentView = new StudentView();
      homeView = new HomeView();
     }

   public void dispatch(String request){

      if(request.equalsIgnoreCase("STUDENT")){
         studentView.show();
      }
      else{
         homeView.show();
        }	
      }
    }
**Step 3
Create FrontController**

**FrontController.java**

public class FrontController {
	
   private Dispatcher dispatcher;

   public FrontController(){

      dispatcher = new Dispatcher();
    }

   private boolean isAuthenticUser(){

      System.out.println("User is authenticated successfully.");
      return true;
    }

   private void trackRequest(String request){

      System.out.println("Page requested: " + request);
    }

   public void dispatchRequest(String request){

      //log each request
      trackRequest(request);
      
      //authenticate the user
      if(isAuthenticUser()){
         dispatcher.dispatch(request);
        }	
      }
    }
**Step 4
Use the FrontController to demonstrate Front Controller Design Pattern.**

**FrontControllerPatternDemo.java**

public class FrontControllerPatternDemo {

   public static void main(String[] args) {
   
      FrontController frontController = new FrontController();
      frontController.dispatchRequest("HOME");
      frontController.dispatchRequest("STUDENT");
      }
    }
**Step 5
Verify the output.**

Page requested: HOME

User is authenticated successfully.

Displaying Home Page

Page requested: STUDENT

User is authenticated successfully.

Displaying Student Page
