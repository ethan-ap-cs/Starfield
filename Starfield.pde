
Particle [] p;
void setup(){
	size(400,400);
	p = new Particle[1000];
	for (int i = 0; i < p.length; i++){
		p[i] = new NormalParticle();
	}
	p[1] = new OddballParticle(200, color(255,0,0), 0);
	p[2] = new OddballParticle(90, color(255,0,0), 0);
	p[3] = new OddballParticle(310, color(255,0,0), 0);
	p[4] = new CrazyOddballParticle(90, color(255,0,0), 0);
	p[5] = new OddballParticle(220, color(0), 20);
	p[6] = new OddballParticle(110, color(0), 20);
	p[7] = new OddballParticle(330, color(0), 20);
}
void draw(){
	for (int i = 0; i < p.length; i++){
		if( !((i >= 1) && (i <= 4)) ){
			p[i].move();
			p[i].show();
		}
	}
	for (int i = 7; i >= 1; i--){
		p[i].move();
		p[i].show();
	}
	//total hacks below
	fill(255,0,0);
	stroke(255,0,0);
	rect(400/5, 90, 50, 50);
	fill(0);
	stroke(0);
	rect(400/5+50, 141, 20, 58);
	rect(400/5+50, 251, 20, 58);
	rect(400/5+20, 361, 80, 19);
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
	protected double myX, myY, myD;
	protected int myColor;
	protected float mySpeed;
	public OddballParticle(int y, int c, int disp){
		myD = disp;
		myX = 400/5 + myD;
		myY = y;
		mySpeed = 1;
		myColor = c;//color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
	}
	public void move(){
		if (myX < 250 + myD){
			myX += mySpeed;
		}
	}
	public void show(){
		fill(myColor);
		stroke(myColor);
		rect((float)myX, (float)myY, 50, 50);
	}
}
class CrazyOddballParticle extends OddballParticle{
	public CrazyOddballParticle(int y, int c, int disp){
		super(y, c, disp);
		myX = 400/5;
		myY = y;
	}
	public void move(){
		if (myY < 310){
			myY += mySpeed;
		}
	}
}
//   |||  JumboParticle replaced with CrazyOddballParticle  |||


// class JumboParticle extends NormalParticle{
// 	public void move(){
// 		//
// 	}
// }
