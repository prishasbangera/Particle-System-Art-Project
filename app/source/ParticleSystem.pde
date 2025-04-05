public class ParticleSystem {
  
  private final int NUM_INIT_PARTICLES = 0;
  private final ArrayList<Particle> particles = new ArrayList<>();
  
  private final SampleImage sampleImage;

  public ParticleSystem(SampleImage sampleImage) {
    
    this.sampleImage = sampleImage;
    for (int i = 0; i < NUM_INIT_PARTICLES; i++) {
      addParticle(random(width), random(height));
    }
  
  }
  
  public void addParticle(float x, float y) {
    particles.add( new Particle(x, y, sampleImage) );
  }
  
  public void run() {
    for (int i = 0; i < particles.size();) {
      Particle p = particles.get(i);
      if (!p.isAlive()) {
        particles.remove(p);
        continue;
      }
      i++;
      p.run();
    }
  }
  

}
