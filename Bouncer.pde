class Bouncer {

  RVector location;
  RVector velocity;
  int radius;

  // constructor
  Bouncer() {

    location = new RVector( width / 2, height / 2 );
    velocity = new RVector(-2, -2);
    radius = 8;

}

  // update position
  void update() {
    // Move the ball according to it's speed
    location.add(velocity);
  }

  // show the object
  void display() {
    // Visual characteristics of the ball
    stroke(0);
    fill(175);

    // Display the ball at the location (x, y)
    ellipse(location.x, location.y, radius*2, radius*2);
  }

  // check for edges
  void checkEdges() {

    // Bounce if needed
    if ((location.x > width) || (location.x < 0)) {
      velocity.x = velocity.x * -1;
    }
    if ((location.y > height) || (location.y < 0)) {
      velocity.y = velocity.y * -1;
    }
  }

  // check for a collision with the paddle
  void checkPaddleCollision(Paddle paddle) {
  }

  // check for a collision with the block
  void checkForBlockCollision(Block block) {

    // Look for a collision
    if (location.x > block.location.x &&
        location.x < block.location.x + block.size.x &&
        location.y > block.location.y &&
        location.y < block.location.y + block.size.y)
    {

      block.active = false;
    }
  }
} 