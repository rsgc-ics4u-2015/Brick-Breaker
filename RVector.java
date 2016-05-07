class RVector {
  
  // Data
  float x;
  float y;
  
  // Constructor
  RVector(float x_, float y_) {
    
    x = x_;
    y = y_;
    
  }
  
  void add(RVector v) {
    x = x + v.x;
    y = y + v.y;
  }
  
  static RVector add(RVector v1, RVector v2) {
    
    return new RVector( v1.x + v2.x, v1.y + v2.y);
    
  }

  void sub(RVector v) {
    x = x - v.x;
    y = y - v.y;
  }

  static RVector sub(RVector v1, RVector v2) {
    
    return new RVector( v1.x - v2.x, v1.y - v2.y);
    
  }
  
  // scale the vector with multiplication
  void mult(float n) {
    x = x * n;
    y = y * n;
  }
  
  static RVector mult(RVector v1, float n) {
    
    return new RVector( v1.x * n, v1.y * n);
    
  }

  // scale the vector with division
  void div(float n) {
    x = x / n;
    y = y / n;
  }
  
  static RVector div(RVector v1, float n) {
    
    return new RVector( v1.x / n, v1.y / n);
    
  }

  // vector magnitude – how long is the vector?
  float mag() {
    return (float) Math.sqrt(x*x + y*y);
  }
  
  // vector normalization – make the vector a unit vector
  void normalize() {
    
    float m = mag();  // get magnitude
    
    // Make sure we don't divide by zero
    if (m != 0) {
      div(m);  // normalize this vector instance using the magnitude
    }
    
  }
  
  static RVector normalize(RVector v) {
    
    float m = v.mag();
    
    // Make sure we don't divide by zero
    if (m != 0) {
      v.div(m);  // normalize this vector instance using the magnitude
    }
    
    return v;
  }
  
  // limit the magnitude of this vector
  void limit(float max) {
    if (mag() > max) {
      normalize();
      mult(max);
    }
  }
  
  // Return a 2D RVector with a max magnitude of 1 pointing in a random direction
  static RVector random2D() {
    
    RVector v = new RVector( (float) Math.random() * 2 - 1, (float) Math.random() * 2 - 1 );
    
    return v;
    
  }
  
}