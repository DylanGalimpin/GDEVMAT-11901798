void setup ()
{
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1080, 720, P3D);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

void draw()
{
  background(130);
  
  //Red outer glow
  strokeWeight(10);
  stroke(255, 0, 0, 75);
  
  PVector mouse = mousePos();
  mouse.normalize().mult(300);
  line(0, 0, mouse.x, mouse.y);
  mouse.normalize().mult(300);
  line(0, 0, -mouse.x, -mouse.y);
  
  //White center glow
  strokeWeight(3.5);
  stroke(255);
  
  mouse.normalize().mult(300);
  line(0, 0, mouse.x, mouse.y);
  mouse.normalize().mult(300);
  line(0, 0, -mouse.x, -mouse.y);
  
  //Black lightsaber handle
  strokeWeight(8);
  stroke(0);
  
  mouse.normalize().mult(60);
  line(0, 0, mouse.x, mouse.y);
  mouse.normalize().mult(60);
  line(0, 0, -mouse.x, -mouse.y);
  
  //print magnitude
  println(mag(mouse.x, mouse.y));
}
