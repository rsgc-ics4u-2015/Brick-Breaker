// Create a space in memory for many block objects
Block blocks[][] = new Block[4][10];

// Create a space in memory for the bouncer object
Bouncer bouncer;

// Create a space in memory for the paddle object
Paddle paddle;

// Variable to control frame rate
int rate = 30;

// Variable to control number of rows of blocks
int rows = 4;

// Variable for number of columns
int columns = 10;

// Runs once
void setup() {

  // Create a white background
  size(800, 360);
  background(255);

  // Actually create an instance of the bouncer
  bouncer = new Bouncer();

  // Actually create an instance of the paddle
  paddle = new Paddle();

  for (int i = 0; i < rows; i += 1) {
    for (int j = 0; j < columns; j += 1) {
      RVector l = new RVector(45 + (j) * (width/15) + (j - 1) * 25, 40 + i * 25 + (i - 1) * 20); // location of block
      RVector s = new RVector(width/15, 25); // size of block
      blocks[i][j] = new Block(l, s, 50 * i);
    }
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
  for (int i = 0; i < rows; i+=1) {
    for (int j = 0; j < columns; j+=1) {
      bouncer.checkForBlockCollision(blocks[i][j]);
      blocks[i][j].display();
    }
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