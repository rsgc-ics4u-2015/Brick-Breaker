class Block {

  // properties
  RVector location;
  RVector size;
  int hue;
  int saturation;
  int brightness;
  int value;       // point value for this block
  boolean active;  // in play when true, destroyed when false
  
  RVector topLeft;      // Corners of this block
  RVector bottomLeft;
  RVector topRight;
  RVector bottomRight;
  
  Block(RVector location_, RVector size_, int hue_, int saturation_, int brightness_, int value_) {

    // Initalize the block with the given values
    location = location_;
    size = size_;
    hue = hue_;
    saturation = saturation_;
    brightness = brightness_;
    active = true;
    value = value_;
    
    // Set vectors used for detecting collisions
    topLeft = location;
    bottomLeft = RVector.add(topLeft, new RVector(0, size.y));
    topRight = RVector.add(topLeft, new RVector(size.x, 0));
    bottomRight = RVector.add(topLeft, size);
    
  }

  // display the block
  void display() {

    if (active) {
      fill(hue, saturation, brightness);
      rect(location.x, location.y, size.x, size.y);
    }
  }
  
  
}