SampleImage sampleImage;
ParticleSystem pSystem;

final int PIXEL_DENSITY = 2;

String IMAGE_PATH = "";
boolean started = false;
int mouseBrush[] = {2, 2}; // number, spacing

// Handle file input (source: Processing reference)

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    IMAGE_PATH = selection.getAbsolutePath();
    println("User selected " + selection.getAbsolutePath());
    
    sampleImage = new SampleImage(IMAGE_PATH);
    sampleImage.getImage().resize(pixelWidth, pixelHeight);
    
    // create the field from the image
    sampleImage.createField();
    
    // init particle system
    pSystem = new ParticleSystem(sampleImage);
    
    println("Ready to draw");
    started = true;
  }
}

void setup() {
  
  size(800, 800);
  pixelDensity(PIXEL_DENSITY);
  
  selectInput("Select an image", "fileSelected");
  
}

// add particles on mouse drag

void mouseDragged() {
  
  if (started) {
    for (int x = -mouseBrush[0]; x < mouseBrush[0]; x++) {
      for (int y = -mouseBrush[0]; y < mouseBrush[0]; y++) {
        pSystem.addParticle(mouseX + x * mouseBrush[1], mouseY + y * mouseBrush[1]);
      }
    }
  }
  
}

// RUN EACH FRAME

void draw() {
  if (started) {
    pSystem.run();
  }
}

// when f is pressed, save screen to Snapshots folder

void keyPressed() {
  if (key == 'f') {
    saveFrame("Snapshots\\snapshot-######.png");
  }
}
