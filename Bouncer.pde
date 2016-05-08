class Bouncer {

  RVector location;
  RVector velocity;
  int radius;
  int countDown; 

  // constructor
  Bouncer() {

    location = new RVector( width / 2, height / 4 * 3 );
    velocity = new RVector(2, 2);
    countDown = 60;
    radius = 8;
  }

  // update position
  void update() {
    // Move the ball according to it's speed
    if (countDown > 0) {
      countDown -= 1;
    } else {
      location.add(velocity);
    }
  }

  // show the object
  void display() {
    // Visual characteristics of the ball
    fill(0, 0, 90);

    // Display the ball at the location (x, y)
    ellipse(location.x, location.y, radius*2, radius*2);
  }

  // reset position
  void reset() {
    location = new RVector( width / 2, height / 4 * 3 );
    velocity = new RVector(2, 2);
    countDown = 60;
  }

  // check for edges
  int checkEdges() {

    // Bounce if needed
    if ((location.x > width) || (location.x < 0)) {
      velocity.x = velocity.x * -1;
    }
    if (location.y < 0) {
      velocity.y = velocity.y * -1;
    }
    if (location.y > height) {
      return -1;
    } else {
      return 0;
    }
  }

  // check for a collision with the paddle
  void checkForPaddleCollision(Paddle paddle) {

    // Check for 36 points around the circumference of the bouncer
    for (int i = 0; i < 360; i += 10) {

      float x = location.x + cos(radians(i))*radius; 
      float y = location.y + sin(radians(i))*radius; 
      RVector positionOnCircumference = new RVector(x, y);

      // Look for a collision
      if (positionOnCircumference.x > paddle.location.x &&
        positionOnCircumference.x < paddle.location.x + paddle.size.x &&
        positionOnCircumference.y > paddle.location.y &&
        positionOnCircumference.y < paddle.location.y + paddle.size.y)

      {

        // Change direction based on bounce location and velocity
        if (i > 0 && i < 180 && velocity.y > 0) {
          velocity.y *= -1;                // hit on bottom of ball when moving down on screen
        } else if (i > 270 && velocity.x > 0 || i < 90 && velocity.x > 0) {
          if (!(paddle.velocity.x > 0 && velocity.x > 0 || paddle.velocity.x < 0 && velocity.x < 0)) {
            velocity.x *= -1;                // hit on right side of ball when moving right on screen
          }
        } else if (i > 90 && i < 270 && velocity.x < 0) {
          if (!(paddle.velocity.x > 0 && velocity.x > 0 || paddle.velocity.x < 0 && velocity.x < 0)) {
            velocity.x *= -1;                // hit on left side of ball when moving left on screen
          }
        }
      }
    }
  }

  // check for a collision with the block
  int checkForBlockCollision(Block block) {
    
    int pointsEarned = 0;

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
        pointsEarned += block.value;

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
    
    return pointsEarned;
    
  }
} 