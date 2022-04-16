public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float velocityLimit = 10;
  public float scale = 10;
  public float mass = 1;
  public float gravitationalConst = 1;
  
  //random colors
  float R = random(0,225);
  float G = random(0,225);
  float B = random(0,225);
  float A = 50;
  
  public Walker()
  {
    
  }
  
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }
  
  public void update()
  {
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0);
  }
  
  public void render()
  {
    fill(R, G, B, A);
    circle(position.x, position.y, scale);
  }
  
  public PVector calcAttraction(Walker walker)
  {
    PVector force = PVector.sub(this.position, walker.position);
    float distance = force.mag();
    
    force.normalize();
    distance = constrain(distance, 10, 30);
    
    float strength = (this.gravitationalConst * this.mass * walker.mass) / (distance * distance);
    force.mult(strength);
    
    return force;
  }
}
