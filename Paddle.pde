class Paddle {

  // properties
  RVector location;
  RVector velocity;
  RVector size;

  Paddle() {

    size = new RVector(100, 10);
    reset();
  }

  // draw the paddle
  void display() {

    // draw
    fill(0, 0, 30);
    rect(location.x, location.y, size.x, size.y);
  }

  // update the paddle's position
  void update() {

    // update the position
    location.add(velocity);
  }

  // reset the paddle position
  void reset() {
    location = new RVector(width / 2 - size.x / 2, height - 50);
    velocity = new RVector(0, 0);
  }

  // Check for a collision on an edge
  void checkEdge() {

    if (location.x + size.x > width) {
      location.x -= 5;
      velocity.mult(-1);
    } else if (location.x < 0) {
      location.x += 5;
      velocity.mult(-1);
    }
  }

  void goLeft() {
    velocity.x = -4;
  }

  void goRight() {
    velocity.x = 4;
  }
}