public class Liquid
{
  public float x, y;
  public float horizon, depth;
  public float cDrag;
  
  public Liquid(float x, float y, float horizon, float depth, float cDrag)
  {
    this.x = x;
    this.y = y;
    this.horizon = horizon;
    this.depth = depth;
    this.cDrag = cDrag;
  }
  
  public void render()
  {
    noStroke();
    fill(28, 120, 186);
    
    beginShape();
    vertex(x - horizon, y, 0);
    vertex(x + horizon, y, 0);
    vertex(x + horizon, y + depth, 0);
    vertex(x - horizon, y + depth, 0);
    endShape();
  }
  
  public boolean isCollidingWith(Walker walker)
  {
    PVector pos = walker.position;
    return pos.x > this.x - this.horizon && pos.x < this.x + this.horizon && pos.y < this.y;
  }
  
  public PVector calcDragForce(Walker walker)
  {
    float speed = walker.velocity.mag();
    float magDrag = this.cDrag * speed * speed;
    
    PVector dragForce = walker.velocity.copy().mult(-1);
    
    dragForce.normalize();
    dragForce.mult(magDrag);
    return dragForce;
  }
}
