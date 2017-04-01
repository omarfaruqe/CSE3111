## What is the Factory Pattern Design Method:
#### 1. When a method returns one of several possible classes that share a common super class
#### 2.Create a new enemy in a game .
#### 3.Random number generator picks a number assigned to a specific enemy.
#### 4.The factory returns the enemy associated  with the number.
#### 5. And the class will be chosen in run time.

## When to use Factory Pattern
#### 1.When we don't know ahead of time what class object we need.
#### 2.When all of the potential classes are in the same subclass hierarchy.
#### 3.To centralize class selection code .
#### 4.When we don't want the user to have to know every subclass.
#### 5.To encapsulate object creation.

## Advantage of Factory Pattern Design Method:
#### It allows the sub-classes to chose the type of object that should be created.
#### It promote the loose-coupling

## Implementation:
#### Provide an interface for creating an object.
#### Here don't consider the word 'interface' as java interface.
#### It's simply means to provide a method to creat an object.
#### let the subclass decide what exact object to instantiate.
#### This pattern actually involves inheritance.

## Code for design pattern:
```
 public abstract class enemyShip{
              private string name;
              private double damage;
              public string getname {return name;}
  public void setname {string newname} {name = newname;}
  public double getdamage() {return damage;}
  public void setdamage(double newdamage){damage = newdamage}
  public void followship(){
      System.out.println(getname()+"is following the hero")

}
public void displayEnemyship(){                                                    system.out.println(getname() + "is on the screen")

}
 public void enemyShipshoots(){
 system.out.println(getname()+ "attacks and does" +getdamage())
}
```