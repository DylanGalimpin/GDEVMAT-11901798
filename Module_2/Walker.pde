class Walker
{
  float x;
  float y;
  
  void render()
  {
    noStroke();
    fill (random(0, 225), random(0, 225), random(50, 100), 75);
    circle(x, y, 25);
  }
  
  void randomWalk()
  {
    int rng = int(random(7));
    
    if (rng == 0) //Up
    {
      y+=10;
    }
    else if (rng == 1) //Down
    {
      y-=10;
    }
    else if (rng == 2) //Right
    {
      x+=10;
    }
    else if (rng == 3) //Left
    {
      x-=10;
    }
    else if (rng == 4) //Upper right corner
    {
      x+=10;
      y+=10;
    }
    else if (rng == 5) //Lower left corner
    {
      x-=10;
      y+=10;
    }
    else if (rng == 6) //Lower right corner
    {
      x+=10;
      y-=10;
    }
    else if (rng == 7) //Upper left corner
    {
      x-=10;
      y+=10;
    }
    
  }
  
  void randomBiasedWalker()
  {
    int rng = int(random(4));
    
    if (rng == 0 || rng == 1) //right
    {
      x+=10;
    }
    else if (rng == 2) //up
    {
      y+=10;
    }
    else if (rng == 3) //down
    {
      y-=10;
    }
    else if (rng == 4) //left
    {
      x-=10;
    }
  }
}
