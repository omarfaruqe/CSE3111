
# Builder Design Pattern

## Definition
#### Builder pattern makes an complex objects by using simple objects and by using a step by step approach.

#### The process or procedure of building an complex object must be generic so that the same process can be used to make different representation of the same complex object.

## Why Builder Design pattern is needed ?

#### * When we would like to make an object made up from other objects.
#### *when we would like to the creation of this part to be independent of main object.

#### *Hide the creation of the parts from the client so that  both are not dependent.
#### * The builder knows the particular task and anybody doesn't else.

# Example:
   
#### Laptop is an complex object that consists branch of objects given below:-

####  1) LCD display
####  2) Plastic case
####  3) USB ports
####  4) Wirless
####  5) Hard Drive
####  6) DVD/CD reader
####  7) memory
####  8) Pointing Device
####  9) Battery

####  There is exist generic process to construct a laptop by which can make different representation of same complex objects laptop.So we cab make laptop with 2gb RAM or laptop with 4gb RAM and so on using same generic process.

## Another Example with Java code: Phone
``` 

  class Phone
  {     
        String os;
        int ram;
        String processor;
        double screenSize;
        int battery;
        
        phone(string os,ram,processor,screenSize,battery)
        {
           this.os = os;
           this.ram = ram;
           this.processor = processor;
           this.screenSize = screenSize;
           this.battery = battery;
        }
  		
  }
  class Market 
  {
  	public static void main(String arg[])
    {
    	Phone phone = new PhoneBuilder().setOs("Windows                   10").setBattery(10).getPhone();
        system.out.println(phone);
    }
  }
  
  class PhoneBuilder 
  {
        String os;
        int ram;
        String processor;
        double screenSize;
        int battery;
        
        
         PhoneBuilder setOs(String os)
        {
        	this.os = os;
            
            return this;
        }
        PhoneBuilder setRam(int ram)
        {
        	this-ram = ram;
            return this;
        }
        PhoneBuilder setProcessor(String processor)
        {
        	this.processor = processor;
            
            return this;
        }
        PhoneBuilder setBattery(int battery)
        {
        	this.battery = battery;
            return this;
        }
        PhoneBuilder setScreenSize(double screenSize)
       {
       		this.screenSize = screenSize;
            return this;
       }
       
       Phone getPhone()
       {
       	 return new Phone(os,ram,processor,battery,screenSize);
       }
     
  }
```




