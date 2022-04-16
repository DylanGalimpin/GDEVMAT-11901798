Walker[] myWalker = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera (0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < myWalker.length; i++)
  {
    myWalker[i] = new Walker();
    myWalker[i].mass = random(5, 15);
    myWalker[i].scale = myWalker[i].mass * 15;
    myWalker[i].position = new PVector(random(-640, 640), random(-360, 360)); //random initial position
  }
}

void draw()
{
  noStroke();
  background(155);
  
  for (int i = 0; i < myWalker.length; i++)
  {
    for (int j = 0; j < myWalker.length; j++)
    {
      myWalker[i].render();
      myWalker[i].update();
      myWalker[i].applyForce(myWalker[j].calcAttraction(myWalker[i]));
      
      if (i != j)
      {
        myWalker[j].applyForce(myWalker[i].calcAttraction(myWalker[j]));
      }
    }
  }
}

void mousePressed() 
{
  setup();
}
