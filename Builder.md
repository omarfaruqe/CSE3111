
 #                                                   Builder
 
 ##  Intent
 
#### 1.Seperate the formation of a complex object from its representation so that the same construction process can create different representations.
#### 2.Parse a complex representation and create one of several targets.

## Problem

#### An application needs to make the elements of a complex aggregate. The specification for the aggregate exists on secondary storage and one of many representations needs to be built in primary storage.

## Discussion

#### Separate the algorithm for interpreting a stored persistence mechanism from the algorithm for making and representing one of many target products . The focus distinction is on creating complex aggregates.

#### The director invokes builder services as it interprets the external format. The builder creates part of the complex object each time it is called and maintains all intermediate state. When the product is finished, the client retrieves the result from the builder.

#### Afford finer control over the construction process. Unlike creational patterns that construct products in one shot, the Builder pattern constructs the product step by step under the control of the "director".

## structure


#### The Reader encapsulates the parsing of the general input. The Builder hierarchy makes possible the polymorphic creation of many peculiar representations or targets.


![alt text](https://sourcemaking.com/files/v2/content/patterns/Builder.svg)


## Example

#### The Builder pattern separates the construction of a complex object from its representation so that the same construction process can create different representations. This pattern is used by fast food restaurants to construct children's meals. Children's meals typically consist of a main item, a side item, a drink, and a toy . Note that there can be variation in the content of the children's meal, but the construction process is the same. Whether a customer orders a hamburger, cheeseburger, or chicken, the process is the same. The employee at the counter directs the crew to assemble a main item, side item, and toy. These items are then placed in a bag. The drink is placed in a cup and remains outside of the bag. This same process is used at competing restaurants.

![alt text](https://sourcemaking.com/files/v2/content/patterns/Builder_example1.svg)

## Check List

#### 1.Decide if a common input and many possible representations is the problem at hand.
#### 2.Encapsulating the parsing of the common input in a Reader class.
#### 3.Design a standard protocol for creating all possible output representations and Capture the steps of this protocol in a Builder interface.
#### 4.Define a builder derived class for each target representation.
#### 5.The client creates a reader object and a builder object, and registers the latter with the former.
#### 6.The client asks the Reader to construct.
#### 7.The client asks the builder to return the  result.
## Rules of thumb.

#### 1.Sometimes creational design patterns are complementary: Builder can use one of the other patterns to implement which components get built. Abstract Factory, builder, and prototype can use Singleton in their implementations.
#### 2.Builder focuses on constructing a complex object step by step. Abstract Factory emphasizes a family of product objects . Builder returns the product as a final step, but as far as the Abstract Factory is concerned, the product gets returned immediately.
#### 3.Builder  often  builds a Composite objects.
#### 4.Often, designs start out using Factory Method and evolve toward Abstract Factory, Prototype, or Builder as the designer discovers where more flexibility is needed..
