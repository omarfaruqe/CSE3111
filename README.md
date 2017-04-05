#The Specification pattern


Specification pattern is powerfull design pattern.It manily use business purpose.Specification pattern is encapsulating different rule to return boolen value. This rule can be combined to satisfy complex requirements.

The classes and objects participating in Specification Design Pattern are:                                                   
1.Ispecification.
2.Andspecification.
3.Orspecification.
4.Notspcification.

##Ispecification:
                Defines the interface for all specifications.
##Andspecification:
                Andspecification used for multipule purpose define.
##Orspecification:
                Orspecification used to or bollen operator.
##NotSpecification:
                NotSpecification used to not bollen operator.

##Example:
![](https://automatetheplanet.com/wp-content/uploads/2016/01/specification-design-pattern-class-diagram.png)


##Advantage:
          1:Easy to write.
          2.Easy to test.
          3.Reusability.
          4.maintainability.
          5.readability.

##Simple Code for public class customer:

public class Customer
{
    public string Ordanigation;
    public string CustomerName;
    public string CUstomerCity;
}

public class UserProvider
{
    public User[] GetUserByName(string name)
    {
    }

    public User[] GetUsersByCity(string name)
    {
    }

    public User[] GetUsersByCompany(string company)
    {
    }
}

##Using The Specification pattern 

public class User
{
    public string Customer;
    public string CustomerName;
    public string CUstomerCity;
}

public class CustomerSpecification
{
    public virtual bool IsSatisfiedBy(Customer Customer)
    {
        return true;
    }
}

public class UserProvider
{
    public Customer[] GetBySpecification(CustomerSpecification spec)
    {
        ArrayList list = new ArrayList();

        CustomerCollection coll = SomeMethodToPopulateTheUserCollection();
        foreach (Customer Customer in coll)
        {
            if (spec.IsSatisfiedBy(Customer))
            {
                list.Add(Customer);
            }
        }

        return (Customer[])list.ToArray(typeof(Customer));
    }
}

class CustomerCompanySpecification : UserSpecification
{
    private readonly string Ordanigation;

    public CustomerCompanySpecification(string Ordanigation)
    {
        this.Ordanigation = Ordanigation;
    }

    public override bool IsSatisfiedBy(Customer Customer)
    {
        return Customer.Ordanigation.Equals(Ordanigation);
    }
}


