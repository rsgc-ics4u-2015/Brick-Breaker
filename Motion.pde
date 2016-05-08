// Create a space in memory for many block objects
Block blocks[] = new Block[30];

// Create a space in memory for the bouncer object
Bouncer bouncer;

// Create a space in memory for the paddle object
Paddle paddle;

// Variable to control frame rate
int rate = 30;

// Variable to control number of rows of blocks
int rows = 3;

// Variable for number of columns
int columns = blocks.length / rows;

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
  for (int i = columns*0; i < columns; i+=1) {
    RVector l = new RVector((i - columns * 0) * (width/15) + (i - 1 - columns * 0) * 25 + 45, 20); // location of block
    RVector s = new RVector(width/15, 25); // size of block
    blocks[i] = new Block(l, s, 50);
  }

  for (int i = columns * 1; i < columns * 2; i+=1) {
    RVector l = new RVector((i - columns * 1) * (width/15) + (i - 1 - columns * 1) * 25 + 45, 60); // location of block
    RVector s = new RVector(width/15, 25); // size of block
    blocks[i] = new Block(l, s, 100);
  }

  for (int i = columns * 2; i < columns * 3; i+=1) {
    RVector l = new RVector((i - columns * 2) * (width/15) + (i - 1 - columns * 2) * 25 + 45, 100); // location of block
    RVector s = new RVector(width/15, 25); // size of block
    blocks[i] = new Block(l, s, 150);
  }
}

// Runs forever
void draw() {
  
  // Clear the background
  background(255);

  // Adjust framerate
  fill(0);
  frameRate(rate);
  text("fps: " + rate, 5, height - 10);

  // Draw the bouncer
  bouncer.update();
  bouncer.checkEdges();
  bouncer.display();


  // Check for collisions then draw all the blocks
  for (int i = 0; i < blocks.length; i+=1) {
    bouncer.checkForBlockCollision(blocks[i]);
    blocks[i].display();
  }


  // Draw the paddle
  paddle.checkEdge();
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
    } else if (keyCode == UP) {
      rate += 1;
    } else if (keyCode == DOWN) {
      if (rate > 1) {
        rate -= 1;
      }
    }
  }
}