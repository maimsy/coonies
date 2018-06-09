/****
*** I Dont Have Much Time
*** 
****/

int time = 0;
float step = 0;

int stage = 0;   //0 = Intro, 1 = Man Enters
void setup(){
  size(500,500,P2D);
  background(255);

}

void draw(){
  if(stage == 0){
    Intro();
  }  
}

void Intro(){
  stroke(255);
  fill(0);  
  
  if(step < width+10){
    step += 3.0f;
  }
  else{
     stage = 1;
  }
  
  rect(-5,height/2,step,20); 
}


void ManEnter(){
}
