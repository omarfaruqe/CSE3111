#Iterator
Iterator Design Pattern is widely used and simplest design pattern.Using this pattern user can go through a list of object by a common interface.User need not to know the internal representation. Another name of iterator pattern is cursor.
There are some kinds of pattern such as behavioral, structural and creational.
Iterator belongs to behavioral pattern.

## Real World Example

Video player is a real world example of an iterator.User need not to know how different videos with different extensions are playing on this video player internally.There are some methods in this design pattern to traverse the list like hasNext(),next(). Video player uses this method internally.


## When to use?

When user need to access  the elements of a collection object sequentially .
The iterator pattern is implemented in Java’s collections like Arraylist and Hashmap

## Advantages

1.	User can access to a collection without knowing its’ internal structure. 
2.	User can get unique interface to access to different aggregates.
3.	It supports simultaneous access.
4.	It encapsulates the internal structure.

## Implementation

![iterator](https://cloud.githubusercontent.com/assets/25974205/24718899/8e94b3cc-1a59-11e7-8bf7-9ccaf3f51124.png)

Iterator interface must have some methods like +first(),+next(),isDone() . These methods are used to traverse the list.Classes like ListIterator and MapIterator which implements Iterator interface have to implement those methods according to their requirement as they works on different data types.

Collection interface must have some methods like +add(),+remove() to add and remove an item from list.Classes like ListCollection and MapCollection which implements collection interface have to implement all these methods of Collection interface according to their requirement on different data types.

## Java Code Example
This is  how  iterator  is created manually:

```
import java.util.*;
public class ExampleIterator  implements Iterator<Boolean> {
	private final BitSet bitset;
	private int ind;
	public ExampleIterator(BitSet bitset)
    {
		this.bitset = bitset;
	}
	public boolean hasNext()
	{
		return ind < bitset.length();
	}
	public Boolean next() 
	{
		if (ind >= bitset.length()) 
		{
			throw new NoSuchElementException();
		}
		boolean b = bitset.get(ind++);
		return new Boolean(b);
	}
	public void remove()
    {
		throw new UnsupportedOperationException();
	}
}
```
Main class

```
import java.util.*;
public class TestBit {
	public static void main(String[] args) {
		BitSet bitset = new BitSet();
		bitset.set(4);
		bitset.set(15);
		bitset.set(16);
		bitset.set(26);
		bitset.set(36);
		bitset.set(39);
		ExampleIterator iter = new ExampleIterator(bitset);
		while (iter.hasNext())
		{
			Boolean a = iter.next();
			String b = (a.booleanValue() ? "T" : "F");
			System.out.print(b);
		}
		System.out.println();
	}
}
```
output: FFFFTFFFFFFFFFFTTFFFFFFFFFTFFFFFFFFFTFFT
This examples shows the iterator of ArrayList.


```
import java.util.*;
public class TestClientIterator {
	public static void main(String[] args) {
		ArrayList<Object> ob = new ArrayList<Object>();
		ob.add(new Integer(42));
		ob.add(new String("test"));
		ob.add(new Double("-12.34"));
		for(Iterator<Object> iter=ob.iterator();iter.hasNext();)
			System.out.println( iter.next() );
		
		for(Object o:ob)
			System.out.println( o );
	}
}
```
output:  
56
12.45
yasgssad
56
12.45
yasgssad
## Point to be noted:

Iterative design pattern is fruitful when user need access to a collection without knowing its’ internal structure.When user needs a uniform traversal interface ,and multiple traversals may also be needed, then this pattern is better choice. 
This makes the code more readable and reasonable and also helps to get rid of typical looping syntax.

