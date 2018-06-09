float step = 0;

void Intro(){
  stroke(255);
  fill(0);  
  
  if(step < width+10){
    step += 8.0f;
    
  }
  else{
     stage = 1;
     step = width+10;
  }  
  rect(-5,height/2,step,10,10);  
}
