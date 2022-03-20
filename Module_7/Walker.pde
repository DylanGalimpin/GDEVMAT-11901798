public class Walker
{
  public PVector position = new PVector(random(width), random(height)); //random position
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float limit = 10; //velocity limit to 10
  public float scale = random(10, 20); //random scale (between 10 - 20)
  
  float R = random(0,225);
  float G = random(0,225);
  float B = random(0,225);
  float A = random (50,100);
  
  public void update()
  {
    PVector mousePos = new PVector(mouseX, mouseY);
    PVector direction = PVector.sub(mousePos, position);
    
    mousePos.sub(position);
    this.acceleration = direction.normalize().mult(0.2); //assign direction to acceleration, multiplied by 0.2
    this.velocity.add(this.acceleration);
    this.velocity.limit(limit);
    this.position.add(this.velocity);
  }
  
  public void render()
  {
    noStroke();
    fill(R, G, B, A);
    circle(position.x, position.y, scale);
  }  
}
