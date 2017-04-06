# INTENT
Interpreter provides a way to evaluate language grammar or expression and involves implementing an expression interface which tells to interpret a particular context.

# USE
It is extremely useful if combined with java reflection techniques.

# PROBLEM
A piece of the client community needs a simplified interface to the overall functionality of a complex subsystem.

# Discussion
Facade discusses encapsulating a complex subsystem within a single interface object and reduces the learning curve necessary to successfully leverage the subsystem and also promotes decoupling the subsystem from its potentially many clients.Again if the Facade is the only access point for the subsystem, it will limit the features and flexibility that "power users" may need.

# Structure
Facade takes a riddle wrapped in an enigma and interjects a wrapper that tames the amorphous and inscrutable mass of software.

![interpreter.jpg](.\interpreter.jpg)
[](http://)


# Rules of thumb
Considered in its most general form nearly every use
of the composite pattern will also contain the Interpreter pattern. But
the Interpreter pattern should be reserved for those cases in which we
want to think of this class hierarchy as defining a language. It can use State to define parsing contexts.
The abstract syntax tree of Interpreter is a Composite.The terminal symbols within Interpreter's abstract syntax tree can be shared with Flyweight. At the time when the grammar is very complex, other techniques (such as a parser) are more appropriate.

# Reference 
Design Patterns Explained Simply by Alexander Shvets



