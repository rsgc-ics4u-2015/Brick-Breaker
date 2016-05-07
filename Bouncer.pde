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

    // Check for 36 points around the circumference of the bouncer
    for (int i = 0; i < 360; i += 10) {

      float x = location.x + cos(radians(i))*radius; 
      float y = location.y + sin(radians(i))*radius; 
      RVector positionOnCircumference = new RVector(x, y);

      // Look for a collision
      if (positionOnCircumference.x > block.location.x &&
        positionOnCircumference.x < block.location.x + block.size.x &&
        positionOnCircumference.y > block.location.y &&
        positionOnCircumference.y < block.location.y + block.size.y &&
        block.active == true)
      {

        block.active = false;
        
        // Change direction based on bounce location and velocity
        if (i > 180 && velocity.y < 0) {
          velocity.y *= -1;                // hit on top of ball when moving up on screen
        } else if (i > 90 && i < 270 && velocity.x < 0) {
          velocity.x *= -1;                // hit on left side of ball when moving left on screen
        } else if (i > 0 && i < 180 && velocity.y > 0) {
          velocity.y *= -1;                // hit on bottom of ball when moving down on screen
        } else if (i > 270 && velocity.x > 0 || i < 90 && velocity.x > 0) {
          velocity.x *= -1;                // hit on right side of ball when moving right on screen
        }
      }
    }
  }
} 