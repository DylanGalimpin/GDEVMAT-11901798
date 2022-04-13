Walker[] myWalker = new Walker[10];
Liquid water = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);

void setup()
{
  size(1280, 720, P3D);
  camera (0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  float xPos = 0;
  for (int i = 0; i < myWalker.length; i++)
  {
    xPos = 2 * (Window.windowWidth /myWalker.length) * (i - (myWalker.length/2)); //equal spacing
    myWalker[i] = new Walker();
    myWalker[i].mass = myWalker.length - i; 
    myWalker[i].scale = myWalker[i].mass * 15; 
    myWalker[i].position = new PVector(xPos, 350);
  }
}

void draw()
{
  background(155);
  water.render();
  
  for ( int i = 0; i < myWalker.length; i++)
  {
    PVector wind = new PVector(0.1, 0); //wind force (0.1, 0)
    PVector gravity = new PVector(0, -0.15 * myWalker[i].mass); //gravitational force (0, -0.15f * mass)
    
    myWalker[i].render();
    myWalker[i].update();
    myWalker[i].applyForce(gravity);
    myWalker[i].applyForce(wind);
    //myWalker[i].checkEdges();
    
    float c = 0.1f;
    float normal = 1;
    float magFriction = c * normal;
    PVector friction = myWalker[i].velocity.copy();
    
    myWalker[i].applyForce(friction.mult(-1).normalize().mult(magFriction));
   
    if (myWalker[i].position.y <= Window.bottom)
    {
      myWalker[i].position.y = Window.bottom;
      myWalker[i].velocity.y *= -1;
    }
    
    if (myWalker[i].position.x >= Window.right)
    {
      myWalker[i].position.x = Window.right;
      myWalker[i].velocity.x *= -1;
    }
    
    if (water.isCollidingWith(myWalker[i]))
    {
      PVector dragForce = water.calcDragForce(myWalker[i]);
      myWalker[i].applyForce(dragForce);
    }
  }
}

void mousePressed() 
{
  setup();
}
