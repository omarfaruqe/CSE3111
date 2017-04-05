#include <iostream>
using namespace std;

// Forward declaration
class Boat;
class Car;
class Copter;
//template for visitor operation
class Operation
{
public:
    virtual void youGotABoat(Boat *b) = 0;
    virtual void youGotACar(Car *c) = 0;
    virtual void youGotACopter(Copter *c) = 0;
};

//super class for all the vehicles
class Vehicle
{
    /* codes for all the complex operation we assumed
    //~~~
    //~~~
    */

public:
    //now, lets make the vehicle visitor friendly
    virtual void perform(Operation *v) = 0;
};

//define Boat
class Boat: public Vehicle
{
    /* codes for all the complex operation we assumed
    //~~~
    //~~~
    */

public:
    //now, lets perform the task
    void perform(Operation *v){
        v->youGotABoat(this);
    }
};

//define Car
class Car: public Vehicle
{
    /* codes for all the complex operation we assumed
    //~~~
    //~~~
    */

public:
    //now, lets perform the task
    void perform(Operation *v){
        v->youGotACar(this);
    }
};

//define copter
class Copter: public Vehicle
{
    /* codes for all the complex operation we assumed
    //~~~
    //~~~
    */

public:
    //now, lets perform the task
    void perform(Operation *v){
        v->youGotACopter(this);
    }
};

//Now, we are ready to add method to the classes
//without modifying them any more

//Lets add the method Run which will define the running method
class Run: public Operation
{
public:
    void youGotABoat(Boat *b){
        cout << "A boat is running on water." << endl;
    }
    void youGotACar(Car *c){
        cout << "A car is running on road." << endl;
    }
    void youGotACopter(Copter *c){
        cout << "You do not have enough money to run a copter" << endl;
    }
};
 //We can define further method similarly
 //The reader are asked to try a method repaint
 //which will change the color of a vehicle

int main()
{
    Boat boat;
    Copter copter;
    Run run;

    boat.perform(&run);
    copter.perform(&run);

    return 0;
}
