Walker[] myWalker = new Walker[8];

void setup()
{
  size(1280, 720, P3D);
  camera (0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  float yPos = 0;
  for (int i = 0; i < myWalker.length; i++)
  {
    yPos = (Window.windowHeight / myWalker.length) * (i - (myWalker.length/2));
    myWalker[i] = new Walker();
    myWalker[i].mass = myWalker[i].mass += i; 
    myWalker[i].scale = myWalker[i].mass * 15; 
    myWalker[i].position = new PVector(-600, yPos);
  }
}

void draw()
{
  background(0);
  
  for (int i = 0; i < myWalker.length; i++)
  {
    PVector acceleration = new PVector (0.2, 0);
    float mew;
    
    if (myWalker[i].position.x >= 0)
    {
      mew = 0.4f;
    }
    else
    {
      mew = 0.01f; //initial coefficient
    }
    
    float normal = 1;
    float magFriction = mew * normal;
    PVector friction = myWalker[i].velocity.copy();
    
    friction.mult(-1);
    friction.normalize();
    friction.mult(magFriction);
    
    myWalker[i].render();
    myWalker[i].update();
    myWalker[i].applyForce(acceleration);
    myWalker[i].applyForce(friction);
    myWalker[i].checkEdges();
    
    midWay();
  }
}

void midWay() //midpoint line
{
  strokeWeight(3);
  color white = color(255);
  fill(white);
  stroke(white);
  line(0, 600, 0, -600);
}

void mousePressed() //resets when mouse is clicked
{
  setup();
}
