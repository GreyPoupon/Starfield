Particle[] star;
void setup()
{
  background(0);
  size(500, 500);
  noStroke();
  star = new Particle[30];
  for(int i = 2; i < star.length; i++)
  {
  	star[i] = new NormalParticle();
  }
  star[0] = new OddballParticle();
  star[1] = new JumboParticle();
}

void draw()
{
  fill(0, 15);
  rect(-25, -25, 525, 525);
  for(int i = 0; i < star.length; i++)
  {
  	star[i].show();
  	star[i].move();
  	star[i].faster();
  }
}

interface Particle
{
  public void show();
  public void move();
  public void faster();
}

class NormalParticle implements Particle
{
  double x, y, angle, speed;
  int[] colorValue;
  NormalParticle()
  {
  	x = 250;
  	y = 250;
  	speed = (Math.random()*5)+2;
  	angle = Math.random()*(2*PI);
  	colorValue = new int[3];
  	colorValue[0] = (int)(Math.random()*255);
    colorValue[1] = (int)(Math.random()*255);
  	colorValue[2] = (int)(Math.random()*255);
  }
  public void show()
  {
  	fill(colorValue[0], colorValue[1], colorValue[2]);
  	ellipse((float)(x), (float)(y), 5, 5);
  }
  public void move()
  {
  	x += speed*cos((float)(angle));
  	y += speed*sin((float)(angle));
  	if(x > 500 || x < 0 || y > 500 || y < 0)
  	{
  	  x = 250;
  	  y = 250;
  	  angle = Math.random()*(2*PI);
  	  speed = (Math.random()*5)+2;
  	  colorValue = new int[3];
  	  colorValue[0] = (int)(Math.random()*255);
      colorValue[1] = (int)(Math.random()*255);
  	  colorValue[2] = (int)(Math.random()*255);
  	}
  	angle += 0.01;
  }
  public void faster()
  {
  	if(mousePressed)
  	{
  	  speed = speed*1.1;	
  	}
  }
}
class OddballParticle implements Particle //uses an interface
{
  double x, y, angle, speed;
  int[] colorValue;
  OddballParticle()
  {
  	x = 250;
  	y = 250;
  	speed = (Math.random()*5)+4;
  	angle = Math.random()*(2*PI);
  	colorValue = new int[3];
  	colorValue[0] = (int)(Math.random()*255);
    colorValue[1] = (int)(Math.random()*255);
  	colorValue[2] = (int)(Math.random()*255);
  }
  public void show()
  {
  	fill(colorValue[0], colorValue[1], colorValue[2]);
  	ellipse((float)(x), (float)(y), 5, 5);
  }
  public void move()
  {
  	x += (int)(Math.random()*5) - 2;
  	y += (int)(Math.random()*5) - 2;
  	if(x > 500)
  	{
  	  x = 500;
  	}
  	if(x < 0)
  	{
  	  x = 0;
  	}
  	if(y > 500)
  	{
  	  y = 500;
  	}
  	if(y < 0)
  	{
  	  y = 0;
  	}
  }
  public void faster()
  {
  	if(mousePressed)
  	{
  	  speed = speed*1.1;	
  	}
  }
}

class JumboParticle extends NormalParticle
{
  public void show()
  {
  	fill(colorValue[0], colorValue[1], colorValue[2]);
  	ellipse((float)(x), (float)(y), 15, 15);
  }
}

