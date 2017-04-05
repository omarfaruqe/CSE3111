# Data Access object pattern design 

## Definition:
#### Data Access Object Pattern or DAO pattern is not used to separate high level data accessing API or operations from high level business services.

#### DAO layer is responsible  for Data access from the persistence storage and manipulation of the data in the persistence storage location.

#### Decouple the persistent storage location implementation from the rest of our software.


## Data access object consist of three participant given below:-

#### 1) DAO Interface:- It defines the standard operation in order to performed in a model object;
#### 2) DAO concrete class: It implements  interface that mentioned above.It is responsible to find data from a data source that can be database or any other storage location.
#### 3) Model Object:- It  consists of get or set method to store data retrieved by using Data Access object class.
 
 ## Implementation with java code:
 
 #### we will create a Car object acting as a Model object.CarDao is data access object interface.CarDaompi is concrete class implementing data access object interface.DaoDemo, our demo class , will use CarDao to demonstrate the use of date access object pattern.

### Formation of Car class:
#### Attributes: name(String),CarId(int)
#### Methods: Car(),String getName(),void setName(),int getCarId(),void setCarId().

### Abstract methods of interface CarDao:

#### Methods: list getAllCar(),void updateCar(),void deleteCar(),void addCar().

### Implementing Class(CarDaolmpl) of the CarDao Interface:
#### Attributes: List car.
#### Methods: carDaolmpl(),List getAllCar(),void updateCar(),void deleteCar(),void addCar() are implemented by this class.





 

