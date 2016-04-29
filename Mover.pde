// The Mover class will let us learn about vectors and simluating
// more interesting forms of motion.
//
// Progression:
// 1. Motion 101 – location and velocity
// 2. Motion w/ Acceleration (Constant)
//    Velocity - rate of change of location
//    Acceleration – rate of change of velocity
//    Acceleration affects velocity; velocity in turn affects location.
// 3. Motion w/ Acceleration (Random)
// 4. Motion w/ Acceleration (Toward the mouse)
class Mover {
  
  // Declare properties of the class here
  // They are in-scope (accessible) to all methods below
  RVector location;
  RVector velocity;
  
  // Constructor – use this to initialize a Mover instance
  Mover() {
    
    // Movers appear in a random location and have random velocity
    location = new RVector(random(width), random(height));
    velocity = new RVector(random(-2, 2), random(-2, 2));
    
  }
  
  // Behaviour
  // Add additional methods to implement Mover object behaviour below.
  
  // update position
  void update() {
    
    location.add(velocity);
    
  }
  
  // show the object
  void display() {
    
    stroke(0);    // black border
    fill(175);    // light gray fill
    
    // draw the mover
    ellipse(location.x, location.y, 25, 25);
    
  }
  
  // wrap around edges
  void checkEdges() {
    
    if (location.x > width) {     // right edge
      location.x = 0;
    } else if (location.x < 0) {  // left edge
      location.x = width;
    }
    
    if (location.y > height) {   // bottom edge
      location.y = 0;
    } else if (location.y < 0) { // top edge
      location.y = height;
    }
    
  }
  
}