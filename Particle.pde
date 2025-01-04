public class Particle {
  
  private final int VEL_MULTIPLIER = 3;
  private final int RAND_MULTIPLIER = 0;
  private final int STROKE_WEIGHT = 2;
  private final int OPACITY = 50;
  
  private PVector pos;
  private PVector oldPos;
  private PVector vel;
  
  private color clr;
  
  private SampleImage sampleImage;
  
  private int steps = 100;
    
  public Particle(float x, float y, SampleImage sampleImage) {
    
    this.sampleImage = sampleImage;
    
    this.pos = new PVector(x, y);
    this.oldPos = new PVector(x, y);
    this.vel = new PVector(0, 0);
    
    // get color at particle position
    int xInd = Math.round(this.pos.x) * pixelDensity;
    int yInd = Math.round(this.pos.y) * pixelDensity;
    color c = color(sampleImage.getImage().get(xInd, yInd));
    clr = color(red(c), green(c), blue(c), OPACITY); // slightly transparent
   
  }
  
  private void update() {
    
    this.oldPos.x = this.pos.x;
    this.oldPos.y = this.pos.y;
    
    // update - get vector for this pixel
    // vector points in direction of the greatest increase in brightness
    
    int xInd = (int)Math.floor(this.pos.x) * pixelDensity;
    int yInd = (int)Math.floor(this.pos.y) * pixelDensity;
    
    float px = sampleImage.field[xInd][yInd][0];
    float py = sampleImage.field[xInd][yInd][1];
    
    float m = sqrt(px * px + py * py);
    
    // trying
    this.vel.x = VEL_MULTIPLIER*px/m + random(-1,1)*RAND_MULTIPLIER;
    this.vel.y = VEL_MULTIPLIER*py/m + random(-1,1)*RAND_MULTIPLIER;
    
    // rotate gradient vector by 90 degrees
    this.pos.x += -this.vel.y;
    this.pos.y += this.vel.x;

    // reduce lifespan
    this.steps--;

    
  }
  
  public void draw() {
    
    stroke(clr);
    strokeWeight(STROKE_WEIGHT);
    
    line(this.oldPos.x, this.oldPos.y, this.pos.x, this.pos.y);
    
    
  }
  
  public boolean isAlive() {
    return steps > 0 && this.pos.x >= 0 && this.pos.y >= 0 && this.pos.x < width && this.pos.y < height;
  }
  
  // calls the update function
  public void run() {
    draw();
    update();
  }
  
  
}
