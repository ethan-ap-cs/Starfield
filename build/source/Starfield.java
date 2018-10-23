import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Starfield extends PApplet {


Particle [] p;
public void setup(){
	
	p = new Particle[100];
	for (int i = 0; i < p.length; i++){
		p[i] = new NormalParticle();
	}
	p[1] = new OddballParticle(200);
	p[2] = new OddballParticle(90);
	p[3] = new OddballParticle(310);
}
public void draw(){
	for (int i = 0; i < p.length; i++){
		p[i].move();
		p[i].show();
	}
}
class NormalParticle implements Particle{
	protected double myX, myY, myAngle, mySpeed;
	protected int myColor;
	public NormalParticle(){
		myX = 200;
		myY = 200;
		myAngle = Math.random() * 2 * Math.PI;
		mySpeed = Math.random() * 4 + 5;
		myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
	}
	public void move(){
		myX += Math.cos(myAngle)*mySpeed;
		myY += Math.sin(myAngle)*mySpeed;
	}
	public void show(){
		fill(myColor);
		stroke(myColor);
		ellipse((float)myX, (float)myY, 10, 10);
	}
}
interface Particle{
	public void move();
	public void show();
}
class OddballParticle implements Particle{
	private double myX, myY;
	private int myColor, mySpeed;
	public OddballParticle(int y){
		myX = 400/3-50;
		myY = y;
		mySpeed = (int)(Math.random() * 10);
		myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
	}
	public void move(){
			myX += mySpeed;
		}
	public void show(){
		fill(myColor);
		stroke(myColor);
		rect((float)myX, (float)myY, 50, 50);
	}
}
class JumboParticle extends NormalParticle{

}
  public void settings() { 	size(400,400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Starfield" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
