PVector blackHole = new PVector();

Walker[] circles = new Walker[100];
Walker spawn = new Walker();

void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < circles.length; i++)
  {
    circles[i] = new Walker();
  }
  blackHole.x = random(-540, 540);
  blackHole.y = random(-360, 360);
}

Walker matterWalker = new Walker();

void draw()
{
  background(0);
  
  for (int i = 0; i < circles.length; i++)
  {
    circles[i].pullDirection();
    circles[i].display();
  }
  
  noStroke();
  fill(225);
  circle(blackHole.x, blackHole.y, 50);
  
  //resets after 600 frames
  if (frameCount % 600 == 0)
  {
    clear();
    background(0);
    setup();
  }
}
