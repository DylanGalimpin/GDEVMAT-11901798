void setup()
{
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(0);
}

void draw()
{
  noStroke();
  fill (random(0, 225), random(0, 225), random(0, 225), random(50, 100)); //Random color generator
  
  //x-coordinates
  float xGaussian = randomGaussian(); //Gaussian x coordinates
  float standardDeviation = 1000;
  float mean = 0;
  float yHeight = random(-360, 360); //random y coordinates
  float x = standardDeviation * xGaussian + mean + yHeight;
  
  //paint thickness Gaussian
  float thickGaussian = randomGaussian();
  float thickSDeviation = 40;
  float thickMean = 5;
  float thickness = thickSDeviation * thickGaussian + thickMean;
  
  circle(x, yHeight, thickness);
  
  //Flush screen after 300 frames
  if (frameCount % 300 == 0)
  {
    background(0);
  }
  
}
