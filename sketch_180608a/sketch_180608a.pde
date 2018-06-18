import moonlander.library.*;
import ddf.minim.*;

Moonlander moonlander;
ArrayList<ParticleSystem> systems;
/****
*** I Dont Have Much Time
*** 
****/

int time = 0;


int stage = 0;   //0 = Intro, 1 = Man Enters 2= MovingShapes1, 3 = HeartBeatEffect, 


Minim minim;
AudioSample song; 

int textsize, cycle;
color pink = color(255,51,153);
color green = color(51,255,51);
col[] start;

Animation animation1;
Animation animation2;
Animation animation3;

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
   
  
  //fullScreen();
  size(500,500);
  noCursor();
  background(255,215,89);
   fill(0,4,68);
  rect(0,height/2,width+20, height);
  
  minim = new Minim(this);

  
  song = minim.loadSample( "MaimunaSyed-CodeBus.wav" );  
  drops = new drop[600];
   for(int i =0; i< drops.length; i++){
      drops[i] = new drop();
  }
  
  // Runnning animation
  frameRate(24);
  animation1 = new Animation("run", 6);
  animation2 = new Animation("run_transparent",6);
  animation3 = new Animation("fall",10);
  
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
    
  background(255,215,89);
   fill(0,4,68);
  rect(-10,height/2,width+20, height);
  //FallMan();
    ManEnter();
    EnterWhiteMan();
    Intro();
    //FallMan();
  }
  else if(stage == 2){
    //Rain();
    
  background(255,215,89);
   fill(0,4,68);
  rect(-10,height/2,width+20, height);
    MovingShapes();
    Intro();
    EnterWhiteMan();
    ManEnter();
  }
   else if(stage == 3){
     
  background(255,215,89);
   fill(0,4,68);
  rect(-10,height/2,width+20, height);
  
     HeartbeatEffect();
     Intro();
     EnterWhiteMan();
     ManEnter();
   }
   else if(stage == 4){
  background(255,215,89);
   fill(0,4,68);
  rect(-10,height/2,width+20, height);
  EnterWhiteMan();
     ManEnter();
     Intro();
  boxx();
     
     
   }
   else if(stage == 5){
     
     rotationStep += 1f;
     /*
    background(255,215,89);
   fill(0,4,68);
   */
if(rotationStep < 25){
        background(15,166,194);
   fill(255,0,31);
       translate(width/2 + ((width/2)-80), 0);
       rotate(radians(90));sun();
      }
      else if(rotationStep > 25 && rotationStep < 75){
         background(218,255,138);
   fill(138,230,255);
    translate(650+width/2, height/2 + 350); 
        rotate(radians(180));
        sun();
     }
      else if(rotationStep > 75 && rotationStep < 90){
         background(255,2,160);
   fill(0,87,13);
         translate(80, height/2 + 400);
      rotate(radians(270));sun();
     }
     else if(rotationStep > 90 && rotationStep < 115){
        background(144,208,240);
   fill(248,176,160);
       translate(width-80, 0);
       rotate(radians(90));sun();
      }
       else if(rotationStep > 115 && rotationStep < 135){
         background(255,215,89);
   fill(0,4,68);
        
    translate(650+width/2, height/2 + 350); 
        rotate(radians(180));
        sun();
     }
       else if(rotationStep > 135){
          background(255,177,109);
   fill(45,23,77);
         translate(80, height/2 + 400);
      rotate(radians(270));
       textSize(25);
      text("Presenting the Coonies", 10, 30); 
  
      textSize(25);
       text("Music using Sonic Pi and Code using Processing", 50, 50); 
       textSize(25);
       pour();
       FallMan();
     }
      else if(rotationStep > 170){
        stage = 7;
      }
     
  rect(-10,height/2,width+20, height);
  
  
  if(rotationStep < 160){
     ManEnter();
     EnterWhiteMan();
     Intro(); 
     
  }

   }
    
  
  else if(stage == 7){
  exit();
  }
  
  delta = millis()- lastTime;
  lastTime = millis();
}

int rotationStep = 0;
