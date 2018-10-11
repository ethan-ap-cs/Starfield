
void setup(){
	
}
void draw(){
	
}
class NormalParticle implements Particle{
	double myX, myY, myAngle, mySpeed;
	int myColor;
	NormalParticle(){
		myX = 320;
		myY = 240;
		myAngle = Math.random() * 2 * Math.PI;
		mySpeed = Math.random() * 10;
	}
	public void move{

	}
	public void show{
		ellipse(myX, myY, 10, 10);
	}
}
interface Particle{
	
}
class OddballParticle implements Particle{
	
}
class JumboParticle extends NormalParticle{
	
}

