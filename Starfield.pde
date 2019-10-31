Particle[] hi;
PImage photo;
void setup()
{
	size(500,500);
	photo = loadImage("planet.png");
	hi = new Particle[100];
	for(int i=0; i<hi.length;i++){
		hi[i] = new Particle(250,250);
		hi[0]=new OddballParticle();
	} 
}
void draw()
{
	background(255);
	for(int i=0; i<hi.length; i++){
		hi[i].move();
		hi[i].show();
	}
}
void mousePressed() {
	setup();
}
class Particle
{
	double myX,myY,mySpeed,myAngle;
	int myColor;
	Particle(int x, int y)
	{
		myY=y;
		myX=x;
		myAngle=(Math.random()*2*Math.PI);
		mySpeed=Math.random()*4+1;
		myColor=color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));

	}
	Particle(){

	}
	void move(){
		myX=myX+Math.cos(myAngle)*mySpeed;
		myY=myY+Math.sin(myAngle)*mySpeed;
	}
	void show(){
		fill(myColor,60);

		ellipse((float)(myX-11*(Math.cos(myAngle)*(mySpeed))),(float)(myY-11*(Math.sin(myAngle)*(mySpeed))),10,10);
		fill(myColor,80);
		ellipse((float)(myX-9*(Math.cos(myAngle)*(mySpeed/2))),(float)(myY-9*(Math.sin(myAngle)*(mySpeed/2))),10,10);
		fill(myColor,200);
		ellipse((float)myX,(float)myY,10,10);

	}
}

class OddballParticle extends Particle
{
	OddballParticle()
	{
		myX=200;
		myY=200;
		myAngle=0;
		mySpeed=0;
		myColor=color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
	}
	void move()
	{
		myX=myX+Math.random()*3-2;
		myY=myY+Math.random()*3-2;
	}
	void show()
	{
		image(photo,(float)myX,(float)myY, 100, 100);
	}
}


