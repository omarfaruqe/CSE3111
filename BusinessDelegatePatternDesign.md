# Bussiness delegate pattern

## Defination:

### Business Delegate Pattern is used to decouple presentation tier and business tier. It is basically use to reduce communication or remote lookup functionality to business tier code in presentation tier.


## Component:

### Four Basic components are client, Business delegate, Lookup service and business service.

### a. Client - Presentation tier code may be JSP, servlet or UI java code.

### b. Business Delegate - A single entry point class for client entities to provide access to Business Service methods.

### c. LookUp Service - Lookup service object is responsible to get relative business implementation and provide business object access to business delegate object.

### d. Business Service - Business Service interface. Concrete classes implement this business service to provide actual business implementation logic.


## Why we have to use business delegate pattern?

### presentation-tier components interact directly with budiness serveers.This directly interaction exposes the underlying   implementarion details of the business service application program interface to the presentation tier. As accessresult , the presentation-tier components are vulneravle to changes in the implementation of the business services. Use a business delegation to reduce coupling verween presntation-tier clients and  business services. The Business delegate hides the underlying implement details of the business service, such as lookup and  access details of the EJB architecture business. Business delegate pattern avoid unnecessary invocation of remote service.

### The following lists the benefits of using the budiness delegate pattern:
##### a. Minimizes coupling of client to budiness services.
##### b. Hides remoteness.
##### c. Improves performance.


## Implimentation:
### We are going to create a Client, BusinessDelegate, BusinessService, LookUpService, JMSService and EJBService representing various entities of Business Delegate patterns. BusinessDelegatePatternDemo, our demo class, will use BusinessDelegate and Client to demonstrate use of Business Delegate pattern

```
    // BusinessService interface
	public interface BusinessService 
    {
    	public void doProcessing()
    }
	// EJBService 
    
    
    public class EJBService implements BusinessService 
    {
    	public void doProcessing()
        {
        	System.out.println("Processing task by invoking EJB service");
        }
    }
    
    
    /// JMSService class
    public class JMSService implements BusinessService()
    {   
    	public void doProcessing()
        {
        	System.out.println("Processing task by invoking JMS service");

        }
    }
    
    // BusinessLookUp class
    public class BusinessLookUp 
    {
    	public  BusinessService getBusinessService(String serviceType)
       {
       		if(serviceType.equalsIgnoreCase("EJB"))
            {
            	return new EJBService();
            }
            else if(serviceType.equalsIgnoreCase("JMS"))
            {
            	return new JMSService();
            }
            return null;
       }
    }
    
    // BusinessDelegate class
    
    public class BusinessDelegate 
    {
    	private BusinessLookUp lookUpService = new BusinessLookUp();
        private BusinessService businessService;
        
        public void doTask(String serviceType)
        {
        	businessService = lookUpService.getBusinessService(serviceType);
            
            System.out.println(businessService.toString() + " : Got Business serve object after do the look ");
            businessService.doProcessing();
        }
    }
    
    // Client class
    
    public class client 
    {
    	public static void main(String args[])
        {
        	BusinessDelegate businessDelegate = new BusinessDelegate();
            System.out.println("Invoke the business delegate by passing service type as EJB");
            
            businessDelegate.doTask("EJB");
            
            System.out.println("");
            
            System.out.orintln("Invoke the business delegate by passing service type as JMS");
            businessDelegate.doTask("JMS");
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
```



