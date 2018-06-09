import moonlander.library.*;
import ddf.minim.*;

Moonlander moonlander;

/****
*** I Dont Have Much Time
*** 
****/

int time = 0;
float step = 0;

int stage = 0;   //0 = Intro, 1 = Man Enters


Minim minim;
AudioSample song; 


 
Animation animation1;
void setup(){
  size(500,500);
  background(255);
  minim = new Minim(this);

  // load BD.wav from the data folder
  song = minim.loadSample( "MaimunaSyed-CodeBus.wav"      // buffer size
                         );                       
  frameRate(24);
  animation1 = new Animation("girl", 3);
  
  //song.trigger();
  delay(1000);

}

void draw(){ 
  if(stage == 0){
    Intro();
  }  
  else if(stage == 1){
    ManEnter();
    Intro();
  }
}
