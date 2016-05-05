class Block {

  // properties
  RVector location;
  RVector size;
  int grey;  // amount of greyscale (0 = black, 255 = white)
  boolean active;

  Block(RVector location_, RVector size_, int grey_) {

    location = location_;
    size = size_;
    grey = grey_;
    active = true;
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