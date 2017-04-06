MODULE DESIGN PATTERN
=====================

### WHAT IS IT?
Module pattern is a design pattern which is intended for the implementation of software modules specially when you want your pieces of code to be independent, easier to maintain. 

The module design pattern is the combination of two design patterns : creational and structural. 

It does the job of creation of objects like a creational pattern does. It can also combine the objects and group them like a structural pattern does.

### WHEN TO USE:
When the whole code needs to be separated from each other.It provides with high encapsulation which protects your code from being accessed from other part. It makes your program easier to handle.

Module design pattern is used mostly in javascript. It is very much important for the front end developers.Most of the common languages dont totally supports the 'MODULE' design pattern.
JAVA can be said a reduced version of 'MODULE'.

## SAMPLE CODE:

class MyRoom <br>
{ <br>
	constructor() <br>
		this.components = ['table', 'computer', 'chair']   //THESE ARE PRIVATE PROPERTIES  
	
	getComponents()  //THESE ARE PUBLIC METHODS 
	{
		return.this.components.join(',') 
	} 

	addCompo(newItem) 
	{
		this.components.push(newItem)
	} 
	deleteCompo(item) 
	{
		this.components.pop(Item) 
	} 

} <br>

export default MyRoom; <br>

import MyRoom from 'libs/module'; <br>
var room = new MyRoom;                //CREATION OF OBJECT <br>
console.log(room.getComponents());    //PRINTING THE COMPONENTS <br>
