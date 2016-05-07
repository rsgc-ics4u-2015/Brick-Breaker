class Block {

  // properties
  RVector location;
  RVector size;
  int grey;  // amount of greyscale (0 = black, 255 = white)
  boolean active;
  
  RVector topLeft;      // Corners of this block
  RVector bottomLeft;
  RVector topRight;
  RVector bottomRight;
  
  Block(RVector location_, RVector size_, int grey_) {

    // Initalize the block with the given values
    location = location_;
    size = size_;
    grey = grey_;
    active = true;
    
    // Set vectors used for detecting collisions
    topLeft = location;
    bottomLeft = RVector.add(topLeft, new RVector(0, size.y));
    topRight = RVector.add(topLeft, new RVector(size.x, 0));
    bottomRight = RVector.add(topLeft, size);
    
  }

  // display the block
  void display() {

    if (active) {
      stroke(0);
      fill(grey);
      rect(location.x, location.y, size.x, size.y);
    }
  }
  
  
}