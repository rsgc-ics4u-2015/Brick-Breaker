// Create a space in memory for many block objects
Block blocks[] = new Block[20];

// Create a space in memory for the bouncer object
Bouncer bouncer;

// Runs once
void setup() {

  // Create a white background
  size(800, 360);
  background(255);
  
  // Actually create an instance of the bounder
  bouncer = new Bouncer();

  // Actually make an instance of a block
  for (int i = 0; i < blocks.length / 2; i+=1) {
    blocks[i] = new Block(i * (width/15) + (i - 1) * 25 + 45, 20, width/15, 25, 50);
  }
  
  for (int i = blocks.length / 2; i < blocks.length; i+=1) {
    blocks[i] = new Block((i - blocks.length / 2) * (width/15) + (i - 1 - blocks.length / 2) * 25 + 45, 60, width/15, 25, 100);
  }
}

// Runs forever
void draw() {

  // Clear the background
  background(255);

  // Draw all the blocks
  for (int i = 0; i < blocks.length; i+=1) {
    blocks[i].update();
  }
  
  // Draw the bouncer
  bouncer.update();
  bouncer.checkEdges();
  bouncer.display();
}