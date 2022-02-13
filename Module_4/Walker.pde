public class Walker
{
  public float x;
  public float y;
  public float tx = 0, ty = 10000;
  
  public float thick;
  public float tt = 5;
  public float pRed = 100;
  public float pGreen = 150;
  public float pBlue = 255;
  public float tR = 255, tG = 255, tB = 255;
  
  void render()
  {
    noStroke();
    fill(pRed, pGreen, pBlue);
    circle (x, y, thick);
  }
  
  void perlinWalk() //Perlin xy
  {
    x = map(noise(tx), 0, 1, -640, 640);
    y = map(noise(ty), 0, 1, -360, 360);
    
    tx += 0.01f;
    ty += 0.01f;
  }
  
  void perlinThickness() //Perlin scale and thickness (5 to 150)
  {
    thick = map(noise(tt), 0, 1, 5, 150);
    
    tt += 0.01f;
  }
  
  void perlinColor() //Perlin color change
  {
    pRed = map(noise(tR), 0, 1, 0, 255);
    pGreen = map(noise(tG), 0, 1, 0, 255);
    pBlue = map(noise(tB), 0, 1, 0, 255);
    
    tR += 0.01f;
    tG += 0.01f;
    tB += 0.01f;
  }
}
