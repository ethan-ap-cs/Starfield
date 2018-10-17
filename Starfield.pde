
Particle [] p;
void setup(){
	size(400,400);
	p = new Particle[100];
	for (int i = 0; i < p.length; i++){
		p[i] = new NormalParticle();
	}
}
void draw(){
	for (int i = 0; i < p.length; i++){
		p[i].move();
		p[i].show();
	}
}
class NormalParticle implements Particle{
	protected double myX, myY, myAngle, mySpeed;
	protected int myColor;
	NormalParticle(){
		myX = 320;
		myY = 240;
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
//class OddballParticle implements Particle{
	
//}
class JumboParticle extends NormalParticle{
	
}

