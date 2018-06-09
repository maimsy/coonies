import moonlander.library.*;
import ddf.minim.*;

Moonlander moonlander;
ArrayList<ParticleSystem> systems;
/****
*** I Dont Have Much Time
*** 
****/

int time = 0;


int stage = 0;   //0 = Intro, 1 = Man Enters 2= MovingShapes1, 


Minim minim;
AudioSample song; 

int textsize, cycle;
color pink = color(255,51,153);
color green = color(51,255,51);
col[] start;

Animation animation1;
PImage lamp;

//MovingShapes1
float x, y;
float xadd=2;
// Two ArrayLists to store the vertices for two shapes
// This example assumes that each shape will have the same
// number of vertices, i.e. the size of each ArrayList will be the same
ArrayList<PVector> circle = new ArrayList<PVector>();
ArrayList<PVector> diamond = new ArrayList<PVector>();

// An ArrayList for a third set of vertices, the ones we will be drawing
// in the window
ArrayList<PVector> morph = new ArrayList<PVector>();

// This boolean variable will control if we are morphing to a circle or diamond
boolean state = false;


void setup(){
  size(500,500);
  background(255,215,0);
  minim = new Minim(this);

  // Runnning animation
  song = minim.loadSample( "MaimunaSyed-CodeBus.wav" );                       
  frameRate(24);
  animation1 = new Animation("run", 6);
  systems = new ArrayList<ParticleSystem>();
  lamp = loadImage("lamp.png");
  
  //Matrix
    textsize = 10;
  textSize(textsize);
  cycle = 0;
  start = new col[width/textsize];
  //dictate max length of charachters and starting time
  for (int i = 0; i < start.length; i++){
    start[i] = new col(i);
  }
  
  
  //MovingShapes1
  // Create a circle using vectors pointing from center
  for (int angle = 0; angle < 360; angle += 9) {
    // Note we are not starting from 0 in order to match the
    // path of a circle.  
    PVector v = PVector.fromAngle(radians(angle-135));
    v.mult(50);
    circle.add(v);
    // Let's fill out morph ArrayList with blank PVectors while we are at it
    morph.add(new PVector());
  }

  // A diamond is a bunch of vertices along straight lines
  // Top of diamond
  //Incrementing the index by 7 or 8 makes the resulting 'circle' look like a pac mac
  int incr = 5; //5 makes the circle
  for (int x = 0, y = 50; x < 50 && y > 0; x += incr, y-=incr) {
    diamond.add(new PVector(x, y));
  }
  // Right side
  for (int x = 50, y = 0; x > 0 && y > -50; x-=incr, y -= incr) {
    diamond.add(new PVector(x, y));
  }
  // Bottom
  for (int x = 0, y = -50; x > -50 && y < 0; x -= incr, y +=incr) {
    diamond.add(new PVector(x, y));
  }
  // Left side
  for (int x = -50, y = 0; x < 0 && y < 50; y +=incr, x +=incr) {
    diamond.add(new PVector(x, y));
  }
  
  //Song
  song.trigger();
  delay(1000);

}

void draw(){ 
  if(stage == 0){
    Intro();
  }  
  else if(stage == 1){
    background(255,215,0);
    ManEnter();
    Intro();
  }
  else if(stage == 2){
    //Rain();
    println(stage);
    background(255,215,0);
     MovingShapes();
    //Intro();
    //ManEnter();
    
  }
  else if(stage == 3){
      
  }
  
}
