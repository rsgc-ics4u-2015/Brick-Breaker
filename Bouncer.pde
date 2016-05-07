class Bouncer {

  RVector location;
  RVector velocity;
  int radius;

  // bottom left of canvas
  RVector canvasBottomLeft;
  RVector canvasBottomRight;
  RVector canvasTopRight;


  // constructor
  Bouncer() {

    location = new RVector( width / 2, height / 2 );
    velocity = new RVector(-2, -2);
    radius = 8;

    // Set vectors to represent corners of screen
    canvasBottomLeft = new RVector(0, height);
    canvasBottomRight = new RVector(width, height);
    canvasTopRight = new RVector(width, 0);
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
  void checkPaddleCollision(Paddle p) {
  }

  // check for a collision with the block
  void checkForBlockCollision(Block block) {

    // Get vectors from diagram
    RVector a = block.topLeft;
    RVector b = block.bottomRight;
    RVector c = location;

    RVector d = RVector.sub(block.bottomLeft, canvasBottomLeft);
    RVector e = RVector.sub(block.topRight, canvasBottomLeft);
    RVector f = RVector.sub(location, canvasBottomLeft);

    RVector g = RVector.sub(block.topLeft, canvasBottomRight);
    RVector h = RVector.sub(block.bottomRight, canvasBottomRight);
    RVector i = RVector.sub(location, canvasBottomRight);

    RVector j = RVector.sub(block.bottomLeft, canvasTopRight);
    RVector k = RVector.sub(block.topRight, canvasTopRight);
    RVector l = RVector.sub(location, canvasTopRight);

    // Look for a collision
    if (c.mag() > a.mag() &&
      c.mag() < b.mag() &&
      f.mag() > d.mag() &&
      f.mag() < e.mag() &&
      i.mag() < g.mag() &&
      i.mag() > h.mag() &&
      l.mag() < j.mag() &&
      l.mag() > k.mag())
    {

      block.active = false;
    }
  }
} 