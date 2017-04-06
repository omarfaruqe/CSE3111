/*This code is copied from https://github.com/ppenzin/designpatterns/tree/master/Balking*/

import java.awt.*;
import java.util.*;

/**
 *  This Applet hosts a Balking pattern.
 *  A click on the applet produces an animation.
 *  The animation shows a bubble that grows from the point
 *  of the click and slowly disappears.
 *  
 *  A compile time constant limits the number of bubbles
 *  that can appear at any one time on the applet.
 *  When the maximum number of bubbless is reached,
 *  further clicks are ignored.  As bubbles disappear,
 *  new clicks produce new bubbles.
 */

/*<applet code=ObserveBalkingPattern.java width=500 height=500>
</applet>*/
public class ObserveBalkingPattern extends java.applet.Applet {
    // Maximum number of bubbles
    private static final int maxbubbles = 3;
    private static final Color background = Color.lightGray;
    /** Initialize this applet. */
    public void init () { setBackground (background); }
    /**
     *  Mouse click handler.
     *  Synchronization is needed to start a new bubble only
     *  if the number of bubbles in the applet is not maximum.
     *  @param evt The mouse click event.
     *  @param x The abscissa mouse click event.
     *  @param y The ordinate mouse click event.
     */
    public boolean mouseDown (Event evt, int x, int y) {
        BubbleRunner runner = new BubbleRunner (x, y);
        runner.start();
	return true;
    }
    // The vector holding the current bubbles
    private Vector<Bubble> current = new Vector<Bubble> ();
    /**
     *  Paint this applet.
     *  @param g  The graphic context.
     */
    public void paint (Graphics g) {
	for (int i = 0; i < current.size (); i++) {
	    Bubble bubble = current.elementAt (i);
	    g.setColor (bubble.c);
	    int r = bubble.r;
	    g.fillOval (bubble.x - r, bubble.y - r, 2 * r, 2 * r);
	}
    }
    // Parameters to animate a bubble
    private static final int loops = 20;
    private static final int maxradius = 50;
    private static final int radius [] = new int [loops];
    private static final Color shade [] = new Color [loops];
    static {
	for (int i = 0; i < loops; i++) {
	    int t = 0 + (background.getRed () - 0) * i / (loops - 1);
	    shade [i] = new Color (t, t, t);
	    radius [i] = maxradius * i / (loops - 1);
	}
    }
    // This thread performs the animation of a single bubble.
    // Periodically, it computes the position, size and color
    // of a bubble and calls repaint.
    private class Bubble extends Thread {
	private final int x, y;      // origin of the bubble
	private int r;               // radius during animation
	private Color c;             // color during animation
	private Bubble (int x, int y) { this.x = x; this.y = y; }
	/**
	 *  Periodically compute the position, size and color
	 *  of a bubble and call repaint.
	 *  Remove the bubble from the applet.
	 */ 
	public void run () {
	    for (int i = 0; i < loops; i++) {
		r = radius [i];
		c = shade [i];
		repaint ();
		try { sleep (100); }
		catch (InterruptedException ie) { break; }
	    }
            current.remove (this);
	}
    }
    // This thread to start bubble animation
    private class BubbleRunner extends Thread {
	private final int x, y;      // origin of the bubble
	Bubble bubble;               // instance of the bubble
	private BubbleRunner (int x, int y) { this.x = x; this.y = y; }
	/**
	 *  Wait to start a the animation
	 */ 
	public void run () {
            synchronized (current) {
                if (current.size () < maxbubbles) {
                    Bubble bubble = new Bubble (x, y);
                    current.add(bubble);
                    bubble.start();
                }
            }


	   }
    }
}   

/*
How to run:
	1. Open command prompt in the directory of this file.
	2. Type: javac ObserveBalkingPattern.java
	3. Type: appletviewer ObserveBalkingPattern.java
	A new applet window will appear.
*/ 