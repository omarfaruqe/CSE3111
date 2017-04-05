# Composite Entity Pattern:
  ## Defination: This is basically a J2E That means java to enterprize design pattern.It is used to manage and model a set of correlative persistent object. 
  ## When a composite entity is updated, internally dependent objects beans get updated automatically
  
  ### Composite entity Diagram:
  
![Capture.JPG](C:\Users\USER\Desktop\ripon\Capture.JPG)

  
## Figure: Composite entity pattern  Diagram (Figure Ref   :https://tutorialspoint.com)

# Implementation:
 ### In composite entity pattern there having a client . It can also have a main method or there can be a separate main class . From the client ,the client uses Composite Entity Object.
 
 ### Composite entity is a class that have composite kind of entity which contains many different entities in it. This class may contain a Coarse Grained object. It also implement that coarse grained class . Client depends on composite entity class object.
 
 ### Coarse Grained object is containing two dependent object. So when try to set some data for coarse grained object, both the dependent object data will be set. this is use for parsistance and j2ee.
 
 # Example :
 
 ```
 public class CompositeEntityPatternDemo {

    public static void main(String[] args) {
     Client client = new Client();
client.setData("Test", "Data");
client.printData();
client.setData("Second Test", "Data1");
client.printData();   
    }
    
}
class Client {
private CompositeEntity compositeEntity = new CompositeEntity();
public void printData(){
for (int i = 0; i < compositeEntity.getData().length; i++) {
System.out.println("Data: " + compositeEntity.getData()[i]);
}
} 
public void setData(String data1, String data2){
compositeEntity.setData(data1, data2);
}
}
class CompositeEntity {
private CoarseGrainedObject cgo = new CoarseGrainedObject();
public void setData(String data1, String data2){
cgo.setData(data1, data2);
}
public String[] getData(){
return cgo.getData();
}
}
class CoarseGrainedObject {
DependentObject1 do1 = new DependentObject1();
DependentObject2 do2 = new DependentObject2();
public void setData(String data1, String data2){
do1.setData(data1);
do2.setData(data2);
}
public String[] getData(){
return new String[] {do1.getData(),do2.getData()};
}
}
class DependentObject2 {
private String data;
public void setData(String data){
this.data = data;
}
public String getData(){
return data;
}
}
class DependentObject1 {
private String data;
public void setData(String data){
this.data = data;
}
public String getData(){
return data;
}
}

Reference:https://TutorialsPoint.com
 ```
 ## output:
 ```
 Data: Test
Data: Data
Data: Second Test
Data: Data1
 ```
