public class SampleImage {

  private PImage image;
  public float[][][] field;
  
  // Sobel operator
  private final int[][] xKernel = {
    {-1, 0, 1},
    {-2, 0, 2},
    {-1, 0, 1}
  };
  
  private final int[][] yKernel = {
    {-1, -1, -1},
    {0, 0, 0},
    {1, 1, 1}
  };
  
  public SampleImage(String imagePath) {
    this.image = loadImage(imagePath);
    field = new float[pixelWidth][pixelHeight][2];
  }
  
  public PImage getImage() {
    return image;
  }
  
  public float[] colorToArray(int x, int y) {
     color c;
    synchronized (pixelsLock) {
      c = image.pixels[getPixel(x, y)];
    }
    float[] res = {red(c), green(c), blue(c)};
    return res;
  }
  
  public int getPixel(int x, int y) {
    return (x + y * pixelWidth);
  }
  
  public float calcKernel(int x, int y, int[][] kernel) {
    
    try {
      
      float[][] clrs = {
        colorToArray(x-1,y-1),
        colorToArray(x+0,y-1),
        colorToArray(x+1,y-1),
        colorToArray(x-1,y+0),
        colorToArray(x+0,y+0),
        colorToArray(x+1,y+0),
        colorToArray(x-1,y+1),
        colorToArray(x+0,y+1),
        colorToArray(x+1,y+1)
      };
      
      float res = 0;
    
      for (int i = 0; i < 3; i++) {
        res += (
          kernel[0][0] * clrs[0][i] + 
          kernel[0][1] * clrs[1][i] + 
          kernel[0][2] * clrs[2][i] + 
          kernel[1][0] * clrs[3][i] + 
          kernel[1][1] * clrs[4][i] + 
          kernel[1][2] * clrs[5][i] +  
          kernel[2][0] * clrs[6][i] + 
          kernel[2][1] * clrs[7][i] + 
          kernel[2][2] * clrs[8][i]
        );
      }
      
      res /= 3.0;
      
      if (res == 0)
        res = random(-0.5, 0.5);
        
      return res;
      
    } catch (Exception e) {
      // edge
      if (kernel.equals(xKernel)) {
        return Integer.signum(x - width/2);
      } else {
        return Integer.signum(y - height/2);
      }  
    }
    
  }
  
  
  private final Object pixelsLock = new Object();
  private final Object fieldLock = new Object();
  
  private class PixelRow implements Runnable {
    
    private int x;
    private final float SCALAR = 0.2; // outline before particles are drawn
        
    public PixelRow(int x) {
      this.x = x;
    }
    
    public void run() {
      
        for (int y = 0; y < pixelHeight; y++) {
          // compute the vector for this pixel
          // central difference (take avg of rgb)
          float partialx = calcKernel(x, y, xKernel);
          
          float partialy = calcKernel(x, y, yKernel);
          
          float magn = sqrt(partialx * partialx + partialy * partialy);
          
          // visual display on canvas
          int i = getPixel(x, y);
          synchronized(pixelsLock) {
            pixels[i] = color(
              (int)(SCALAR * partialx), 
              (int)(SCALAR * partialy), 
              (int)(SCALAR * magn), 255);
          }
          
          // add to field array
          synchronized (fieldLock) {
            field[x][y][0] = partialx;
            field[x][y][1] = partialy;
          }
        }
        
        
    }
           
    
  }
  
  public void createField() { //<>//
    
    ArrayList<Thread> threads = new ArrayList<>();
    image.loadPixels();
    loadPixels();
    
    for (int x = 0; x < pixelWidth; x++) {
        Thread t = new Thread(new PixelRow(x));
        threads.add(t);
        t.start();
    }

    
    for (Thread t : threads) {
      try {
        t.join();
      } catch (Exception e) {
        e.printStackTrace();
      }
    }
    
    image.updatePixels();
    updatePixels();
    
  }
  
  
  
  
}
