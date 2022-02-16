class Walker
{
  PVector position = new PVector();
  PVector speed = new PVector(5, 5);

  void moveAndBounce()
  {
    //Speed and Position
    position.add(speed);
    
    //Bouncing
    if ((position.x > Window.right) || (position.x < Window.left))
    {
      speed.x *= -1;
      fill (random(0, 225), random(0, 225), random(50, 225));
    }
    
    if ((position.y > Window.top) || (position.y < Window.bottom))
    {
      speed.y *= -1;
      fill (random(0, 225), random(0, 225), random(50, 225));
    }
  }
  
  void render()
  {
    //Circle render
    noStroke();
    circle(position.x, position.y, 50);
  }
}
