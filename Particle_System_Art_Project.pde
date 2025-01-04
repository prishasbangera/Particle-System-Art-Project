SampleImage sampleImage;
ParticleSystem pSystem;

final int PIXEL_DENSITY = 2;

final String IMAGE_PATH = "pic2.png";

void setup() { //<>//

  size(800, 800);
  pixelDensity(PIXEL_DENSITY);
  
  sampleImage = new SampleImage(IMAGE_PATH);
  sampleImage.getImage().resize(pixelWidth, pixelHeight);
  
  // create the field from the image
  sampleImage.createField();
  
  // particle system
  pSystem = new ParticleSystem(sampleImage);
  
  println("Ready to draw");
   
}

void mouseDragged() {
  
  int s = 2;
  int m = 2;
  for (int x = -s; x < s; x++) {
    for (int y = -s; y < s; y++) {
      pSystem.addParticle(mouseX + x * m, mouseY + y * m);
    }
  }
  
}

void draw() {
  pSystem.run();
  saveFrame();
}
