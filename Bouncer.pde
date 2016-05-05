class Bouncer {
  
  RVector location;
  RVector velocity;

  // constructor
  Bouncer() {
    
    location = new RVector( width / 2, height / 2 );
    velocity = new RVector(2, 2);
    
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
    ellipse(location.x, location.y, 16, 16);
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
}