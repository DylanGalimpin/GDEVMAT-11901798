int globalVariable = 100;
int time = 10000;

void setup()
{
  size(1280, 720, P3D); //window size 1280 X 720  
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

void draw()
{
  background(0); //background
  
 CartiseanPlane(); //draw cartisean plane function
 QuadraticFunction(); //draw quadratic function
 SineWaveFunction(); //draw sine wave function
 LinearFunction(); //draw linear funtion
}

void CartiseanPlane()
{
   //Cartisean Plane
  strokeWeight(2);
  color white = color(255, 255, 255);
  fill(white);
  stroke(white);
  line(300, 0, -300, 0);
  line(0, 300, 0, -300);
  
  for(int i = -300; i <= 300; i += 10)
  {
   line(i, -3, i, 3);
   line(-3, i, 3, i);
  }
}

void LinearFunction()
 {
   //f(x) = -5x + 30
   color purple = color(127, 0, 255); //Apply color purple
   fill(purple);
   stroke(purple);
   strokeWeight(2);
   
   for(int x = -300; x <= 300; x++)
   {
     circle(x * 5, (-5 * x) + 30, 5);
     
   }
 }
 
void QuadraticFunction()
{
  //f(x) = x^2 - 15x - 3
  color yellow = color(255, 255, 0); //Apply color yellow
  fill(yellow);
  noStroke();
  
  for(float x = -300; x <= 300; x+=0.1f)
  {
    circle(x * 5, (float)Math.pow(x,2) - (15 * x) - 3, 5);
  }
  
}

void SineWaveFunction()
{
  //f(x) = 30 sin(x / 10) + 10
  color green = color(0, 128, 0); //Apply color green
  fill(green);
  noStroke();
  
  for (float x = -300; x <= 300; x += 0.1f)
  {
    circle(x, (float)30 * sin(x / 10) + 10, 5);
  }
}
