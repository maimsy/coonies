
void Intro(){
  stroke(255);
  fill(0);  
  
  if(step < width+10){
    step += 5.0f;
  }
  else{
     stage = 1;
     step = 0;
  }  
  rect(-5+step,height/2,step,10,10); 
}
