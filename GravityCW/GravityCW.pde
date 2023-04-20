float GRAVITY = 0.4;
int MAX_SIZE  = 50;
int MIN_SIZE = 10;
float MAX_MASS = 10;
float MIN_MASS = 1;

int NUM_ORBS = 10;
Orb[] orbs;
boolean moving;
boolean multiBall;
boolean earthGravity;
boolean orbit;
boolean bounce;
boolean trails;

Orb earth;
Orb centerGravity;

void setup() {
  noStroke();
  size(600, 600);
  background(200);
  orbs = new Orb[NUM_ORBS];
  resetRandom();

}//setup

void draw() {
  if (!trails) {
    background(200);
    stroke(0);
  }
  displayMode();
  if (trails) {
    noStroke();
  }

  //always display the orbs
  for (int i=0; i<orbs.length; i++) {
    orbs[i].display();
  }//show orbs


  //if moving is active, run the gravity simulation
  //using whatever modes are currently active.
  if (moving) {
    for (int i=0; i<orbs.length; i++) {

      //for mutual attraction mode, each orb should
      //exert gravity on each other orb.
      if (multiBall) {

      }//orbs attract each other

      //for earth gravity mode, each orb should feel a
      //downward gravity force similar to how the earth's
      //gravity pulls on all objects on earth.
      if (earthGravity) {

      }//orbs pulled down by earth

      //for orbit mode, a single orb at the center should
      //exert a gravitational force on all the other orbs
      if (orbit) {

      }//orbs pulld toward center

    }//apply gravity

    //if moving is on, call run on each orb
    //This is the ONLY TIME RUN SHOULD BE CALLED
    for (int i=0; i<orbs.length; i++) {
      orbs[i].run(bounce);
    }//run the sumlation
  }

}//draw

void pushAll(PVector p) {
  for (int i=0; i<orbs.length; i++) {
    orbs[i].applyForce(p);
  }
}//pushAll

void resetRandom() {
  moving = false;
  bounce = false;
  multiBall = true;
  earthGravity = false;
  orbit = false;
  background(200);
  for (int i=0; i<orbs.length; i++) {
    int s = int(random(MIN_SIZE, MAX_SIZE));
    float m = random(MIN_MASS, MAX_MASS);
    int x = int(random(s, width-s));
    int y = int(random(s, height-s));
    orbs[i] = new Orb(x, y, s, m);
  }
}//resetRnadom

void resetHorizontal() {
  moving = false;
  bounce = false;
  multiBall = false;
  earthGravity = true;
  orbit = false;
  background(200);
  int x = 10;
  int y = 60;
  for (int i=0; i<orbs.length; i++) {
    int s = int(random(MIN_SIZE, MAX_SIZE));
    float m = random(MIN_MASS, MAX_MASS);
    x+= s/2;
    orbs[i] = new Orb(x, y, s, m);
    x+= s/2 + 10;
  }
}//resetHorizontal

void resetVertical() {
  moving = false;
  bounce = false;
  earthGravity = false;
  multiBall = false;
  orbit = true;
  background(200);
  int x = width/2;
  int y = 62;
  for (int i=0; i<orbs.length; i++) {
    int s = 16;//int(random(MIN_SIZE, MAX_SIZE));
    float m = random(MIN_MASS, MAX_MASS);
    orbs[i] = new Orb(x, y, s, m);
    y+= 44;

    if (i == orbs.length/2-1) {
      y = height/2 + 40;
    }
  }
}//reset

void keyPressed() {
  if (key == ' ') {
    moving = !moving;
  }
  if (key == 'b')  {
    bounce = !bounce;
  }
  if (key == 'm')  {
    multiBall = !multiBall;
  }
  if (key == 'e')  {
    earthGravity = !earthGravity;
  }
  if (key == 'o') {
    orbit = !orbit;
  }
  if (key == 't') {
    trails = !trails;
  }
  if (key == 'r') {
    resetRandom();
  }
  if (key == 'h') {
    resetHorizontal();
  }
  if (key == 'v')  {
    resetVertical();
  }
  if (keyCode == UP) {
    pushAll(new PVector(0, -0.5));
  }
  if (keyCode == DOWN) {
    pushAll(new PVector(0, 0.5));
  }
  if (keyCode == LEFT) {
    pushAll(new PVector(-0.5, 0));
  }
  if (keyCode == RIGHT) {
    pushAll(new PVector(0.5, 0));
  }
}//keyPressed

void displayMode() {
  //initial setup
  color c;
  textAlign(LEFT, TOP);
  textSize(15);
  noStroke();

  //red or green boxes
  c = moving ? color(0, 255, 0) : color(255, 0, 0);
  fill(c);
  rect(0, 0, 53, 20);
  c = bounce ? color(0, 255, 0) : color(255, 0, 0);
  fill(c);
  rect(54, 0, 57, 20);
  c = multiBall ? color(0, 255, 0) : color(255, 0, 0);
  fill(c);
  rect(112, 0, 140, 20);
  c = earthGravity ? color(0, 255, 0) : color(255, 0, 0);
  fill(c);
  rect(253, 0, 100, 20);
  c = orbit ? color(0, 255, 0) : color(255, 0, 0);
  fill(c);
  rect(354, 0, 42, 20);
  stroke(0);
  fill(0);
  text("MOVING", 1, 0);
  text("BOUNCE", 55, 0);
  text("MUTUAL ATTRACTION", 113, 0);
  text("EARTH GRAVITY", 254, 0);
  text("ORBIT", 355, 0);

}
