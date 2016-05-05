// Create a space in memory for many block objects
Block blocks[] = new Block[20];

// Create a space in memory for the bouncer object
Bouncer bouncer;

// Create a space in memory for the paddle object
Paddle paddle;

// Runs once
void setup() {

  // Create a white background
  size(800, 360);
  background(255);
  
  // Actually create an instance of the bouncer
  bouncer = new Bouncer();

  // Actually create an instance of the paddle
  paddle = new Paddle();

  // Actually make an instance of a block
  for (int i = 0; i < blocks.length / 2; i+=1) {
    RVector l = new RVector(i * (width/15) + (i - 1) * 25 + 45, 20); // location of block
    RVector s = new RVector(width/15, 25); // size of block
    blocks[i] = new Block(l, s, 50);
  }
  
  for (int i = blocks.length / 2; i < blocks.length; i+=1) {
    RVector l = new RVector((i - blocks.length / 2) * (width/15) + (i - 1 - blocks.length / 2) * 25 + 45, 60); // location of block
    RVector s = new RVector(width/15, 25); // size of block
    blocks[i] = new Block(l, s, 100);
  }
}

// Runs forever
void draw() {

  // Clear the background
  background(255);

  // Draw all the blocks
  for (int i = 0; i < blocks.length; i+=1) {
    blocks[i].display();
  }
  
  // Draw the bouncer
  bouncer.update();
  bouncer.checkEdges();
  bouncer.display();
  
  // Draw the paddle
  paddle.update();
  paddle.display();
}

// Respond to keypresses
void keyPressed() {
  
  if (key == CODED) {
    
    if (keyCode == LEFT) {
      paddle.goLeft();
    } else if (keyCode == RIGHT) {
      paddle.goRight();
    }
    
  }
  
}