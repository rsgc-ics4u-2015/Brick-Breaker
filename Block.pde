class Block {
  
  // properties
  int x;    // horizontal position of top-left corner
  int y;    // vertical position of top-left corner
  int w;    // block width
  int h;    // block height
  int grey;  // amount of greyscale (0 = black, 255 = white)
  
  Block(int x_, int y_, int w_, int h_, int grey_) {
    
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    grey = grey_;
    
  }
  
  // display the block
  void display() {
    
    stroke(0);
    fill(grey);
    rect(x, y, w, h);
    
  }
  
}