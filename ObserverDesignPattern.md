# Observer

### Defination : 
Observer pattern is used when there is one-to-many relationship between objects such as if one object is modified, its depenedent objects are to be notified automatically. Observer pattern falls under behavioral pattern category.

A large monolithic design does not scale well as new graphing or monitoring requirements are levied.

### Discussion :

Define an object that is the "keeper" of the data model and/or business logic (the Subject). Delegate all "view" functionality to decoupled and distinct Observer objects. Observers register themselves with the Subject as they are created. Whenever the Subject changes, it broadcasts to all registered Observers that it has changed, and each Observer queries the Subject for that subset of the Subject's state that it is responsible for monitoring.

This allows the number and "type" of "view" objects to be configured dynamically, instead of being statically specified at compile-time.

The protocol described above specifies a "pull" interaction model. Instead of the Subject "pushing" what has changed to all Observers, each Observer is responsible for "pulling" its particular "window of interest" from the Subject. The "push" model compromises reuse, while the "pull" model is less efficient.

Issues that are discussed, but left to the discretion of the designer, include: implementing event compression (only sending a single change broadcast after a series of consecutive changes has occurred), having a single Observer monitoring multiple Subjects, and ensuring that a Subject notify its Observers when it is about to go away.

The Observer pattern captures the lion's share of the Model-View-Controller architecture that has been a part of the Smalltalk community for years.


### Example :

The Observer defines a one-to-many relationship so that when one object changes state, the others are notified and updated automatically. Some auctions demonstrate this pattern. Each bidder possesses a numbered paddle that is used to indicate a bid. The auctioneer starts the bidding, and "observes" when a paddle is raised to accept the bid. The acceptance of the bid changes the bid price which is broadcast to all of the bidders in the form of a new bid.

![untitlefd](https://cloud.githubusercontent.com/assets/25998129/24098702/13d16f74-0d96-11e7-97ee-b3ec7b6c4f4b.png)

### Code Example :
interface AlarmListener { public void alarm(); } <br>
class SensorSystem { <br>
   private java.util.Vector listeners = new java.util.Vector(); <br>
   public void register( AlarmListener al ) { listeners.addElement( al ); } <br>
   public void soundTheAlarm() { <br>
      for (java.util.Enumeration e=listeners.elements(); e.hasMoreElements(); ) <br>
         ((AlarmListener)e.nextElement()).alarm(); <br>
}  } <br>
class Lighting implements AlarmListener { <br>
   public void alarm() { System.out.println( "lights up" ); } <br>
} <br>
class Gates implements AlarmListener { <br>
   public void alarm() { System.out.println( "gates close" ); } <br>
} <br>
class CheckList { <br>
   public void byTheNumbers() {  // Template Method design pattern <br>
      localize(); <br>
      isolate(); <br>
      identify(); } <br>
   protected void localize() { <br>
      System.out.println( "   establish a perimeter" ); }  <br>
   protected void isolate()  {  <br>
      System.out.println( "   isolate the grid" ); }  <br>
   protected void identify() {  <br>
      System.out.println( "   identify the source" ); }  <br>
}  <br>
                   // class inheri.  // type inheritance  <br>
class Surveillance extends CheckList implements AlarmListener {  <br>
   public void alarm() {  <br>
      System.out.println( "Surveillance - by the numbers:" );  <br>
      byTheNumbers(); }  <br>
   protected void isolate() { System.out.println( "   train the cameras" ); }  <br>
} <br>
public class ClassVersusInterface {  <br>
   public static void main( String[] args ) {  <br>
      SensorSystem ss = new SensorSystem();  <br>
      ss.register( new Gates()        );  <br>
      ss.register( new Lighting()     );  <br>
      ss.register( new Surveillance() );  <br>
      ss.soundTheAlarm();  <br>
}  }
