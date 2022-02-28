public class Walker
{
  float gaussian = randomGaussian();
  float standardDeviation = 1000;
  float mean = 0;
  float y = random(-Window.windowHeight / 2, Window.windowHeight / 2);
  float x = standardDeviation * gaussian + mean + y;
  float thickness = random(5, 50);
  PVector circles = new PVector(x,y);
  
  float R = random(0,225);
  float G = random(0,225);
  float B = random(0,225);
  float A = random (10,100);
  
  void pullDirection()
  {
    PVector direction = PVector.sub(blackHole, circles);
    circles.add(direction.normalize().mult(5));
  }
  
  void display()
  {
    noStroke();
    fill(R, G, B, A); //random color
    circle(circles .x, circles.y, thickness);
  }
}
