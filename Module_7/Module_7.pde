Walker[] myWalker = new Walker[100];

void setup()
{
  size(1280, 720, P3D);
  
  for (int i = 0; i < myWalker.length; i++)
  {
    myWalker[i] = new Walker();
  } 
}

void draw()
{
  background(80);
  
  for (int i = 0; i < myWalker.length; i++)
  {
    myWalker[i].update();
    myWalker[i].render();
  }
}
