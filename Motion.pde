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
int lives = 2;

// Variable to track overall score
int score = 0;

// Variable to track score on this level
int thisLevelScore = 0;

// Variable to track level
int level = 0;

// Font for game over
PFont gameOver;
PFont fps;

// Runs once
void setup() {

  // Create canvas
  size(800, 400);

  // Set color mode
  colorMode(HSB, 360, 100, 100);

  // Black background
  background(0, 0, 0);

  // No borders on shapes
  noStroke();

  // Actually create an instance of the bouncer
  bouncer = new Bouncer();

  // Actually create an instance of the paddle
  paddle = new Paddle();

  // Initialize the blocks
  initBlocks();

  // Set text fonts
  gameOver = loadFont("HighSchoolUSASans-48.vlw");
  fps = loadFont("HelveticaNeue-12.vlw");

  // No mouse pointer
  noCursor();
}

// Runs forever
void draw() {

  // Clear the background
  background(0, 0, 0);

  // Play game or show game over
  if (lives >= 0) {

    // Adjust framerate
    frameRate(rate);
    fill(0, 0, 70);  // white
    textFont(fps);
    textAlign(LEFT);
    text("fps: " + rate, 5, height - 10);

    // Show score
    fill(0, 0, 70);  // white
    textFont(fps);
    textAlign(RIGHT);
    text("level: " + (level + 1) + "     new lives: " + lives + "     score: " + score, width - 5, height - 10);

    // Update bouncer and check position
    if (bouncer.checkEdges() == -1) {
      lives -= 1;
      bouncer.reset(level*0.2);
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
          score += bouncer.checkForBlockCollision(blocks[i][j]);
          thisLevelScore = score - level * 1000;
          blocks[i][j].display();
        }
      }

      // Go to next level if necessary
      if (score % 1000 == 0 && thisLevelScore > 0) {
        level += 1;
        lives += 1;
        bouncer.reset(level*0.2);
        paddle.reset();
        initBlocks();
        thisLevelScore = 0;
      }

      // Draw the paddle
      paddle.checkEdge();
      paddle.update();
      paddle.display();
    }
  } else {
    textAlign(CENTER, CENTER);
    textSize(48);
    fill(0, 0, 80);
    textFont(gameOver);
    text("GAME OVER", width/2, height/2);
  }
  
}

// Respond to keypresses
void keyPressed() {

  if (key == CODED) {

    if (keyCode == LEFT) {
      paddle.goLeft(-4 - level*0.4);
    } else if (keyCode == RIGHT) {
      paddle.goRight(4 + level*0.4);
    } else if (keyCode == UP) {
      rate += 1;
    } else if (keyCode == DOWN) {
      if (rate > 1) {
        rate -= 1;
      }
    }
  } else if (key == 'c') {  // cheat to test level advancing

    for (int i = 0; i < rows; i+=1) {
      for (int j = 0; j < columns; j+=1) {
        blocks[i][j].active = false;
      }
    }
    blocks[3][6].active = true;
    score = 990 + level * 1000;
    thisLevelScore = 990;

    bouncer.location.x = width/2;
    bouncer.location.y = height - 100;
    bouncer.velocity.x = 2;
    bouncer.velocity.y = -2;
    bouncer.countDown = 60;
  }


}

// Initialize the blocks
void initBlocks() {
  for (int i = 0; i < rows; i += 1) {
    for (int j = 0; j < columns; j += 1) {
      RVector location = new RVector(45 + (j) * (width/15) + (j - 1) * 25, 40 + i * 25 + (i - 1) * 20); // location of block
      RVector size = new RVector(width/15, 25); // size of block
      int hue = (0 + 15 * i + 60 * level) % 360;
      int saturation = 80;
      int brightness = 70;
      int pointValue = 40 - i * 10;
      blocks[i][j] = new Block(location, size, hue, saturation, brightness, pointValue);
    }
  }
}