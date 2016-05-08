// Create a space in memory for many block objects
Block blocks[][] = new Block[4][10];

// Create a space in memory for the bouncer object
Bouncer bouncer;

// Create a space in memory for the paddle object
Paddle paddle;

// Variable to control frame rate
int rate = 60;

// Variable to control number of rows of blocks
int rows = 4;

// Variable for number of columns
int columns = 10;

// Variable to track number of lives
int lives = 3;

// Font for game over
PFont gameOver;
PFont fps;

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
  
  // Set text fonts
  gameOver = loadFont("HighSchoolUSASans-48.vlw");
  fps = loadFont("HelveticaNeue-12.vlw");
}

// Runs forever
void draw() {

  // Clear the background
  background(255);

  // Play game or show game over
  if (lives > 0) {

    // Adjust framerate
    fill(0);
    frameRate(rate);
    textFont(fps);
    text("fps: " + rate, 5, height - 10);

    // Update bouncer and check position
    if (bouncer.checkEdges() == -1) {
      lives -= 1;
      bouncer.reset();
      paddle.reset();
    } else {

      // Bounce on paddle if necessary
      bouncer.checkForPaddleCollision(paddle);

      // Update bouncer position
      bouncer.update();

      // Draw bouncer
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
  } else {
    textAlign(CENTER, CENTER);
    textSize(48);
    fill(0);
    textFont(gameOver);
    text("GAME OVER", width/2, height/2);
  }
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