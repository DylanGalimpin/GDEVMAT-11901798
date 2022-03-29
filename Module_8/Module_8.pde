Walker[] myWalker = new Walker[10];

PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector(0, -0.4);

void setup()
{
  size(1280, 720, P3D);
  camera (0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < myWalker.length; i++)
  {
    myWalker[i] = new Walker();
    myWalker[i].mass = myWalker[i].mass += i; 
    myWalker[i].scale = myWalker[i].mass * 15; //scale depending on mass (mass * 15)
  }
}

void draw()
{
  background(130);
  
  for ( int i = 0; i < myWalker.length; i++)
  {
    myWalker[i].render();
    myWalker[i].update();
    myWalker[i].applyForce(wind);
    myWalker[i].applyForce(gravity);
    myWalker[i].checkEdges();
  }
}
