# Binding properties

## Intent

#### The intent of Binding properties is to concatenate multiple observers to syncronized the different object. Binding properties is follow under the Concurrency pattern which is address some aspect of multithreaded programming.

#### Use the Binding Properties pattern when

#### an different object need to combine together . The Binding Properties pattern;s component binding together.

## Problem

#### Usually we need to combine automatically with two different properties object.Graphics user interface is came in regular basis.We need to keep track to check the menu bar, item, and control object etc.Espically set of EqualityConstaints is the problem.
#### which also come with modeling, electronics etc.

#### If we try to solve this problem its shows that some infinite loop and some other loop which are a bit hard to solve and debug it.

## Solution:

#### Firstly we need to remove the the unwanted assignments and then deleting the infinite loop by using the signals / events or we need to compare the assigned value with property value before writting assignment.

### Binding properties with the Transformation :

#### It is reduced by decresing the transformation function of binding properties to the solution and then we can take function as a Type conversion.

## Structure 

![binding_properties_pattern](https://cloud.githubusercontent.com/assets/26067522/24737610/c9e9c0cc-1ab1-11e7-9196-3c8641f62091.png)


### Binding Multiple Properties:

### Resulting context: automatically the properties are held together.


## Sample code :

#### There are two types of binding.If one of the binding is read only then one way binding is applicable otherwise another(two-way binding ) is used.


### One way binding code :

BindingOneWay(sourceObj, SourceProperties, distinationObject[], DistinationPropperties[])

{

for(m, n) in   (distinationObject, Distinationproperties)
{

   BindingOneWay(SourcesProperties, DistinationProperties, m, n);

}

}


### Two way Binding code:

BindingTwoWay(Properties1, Properties2)

{

bind(Properties1, Properties2);

bind(Properties2, Properties1);

}


