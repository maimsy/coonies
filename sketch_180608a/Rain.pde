
drop[] drops ;

void pour() {
  
  for(int i =0; i< drops.length; i++){
       drops[i].fall();
       drops[i].show();
  
    
  } 
}


class drop{
  float x=random(width);
  float y=random(-500,-50);
 
  float z = random(0,20);
  float len = map(z,0,20,10,20);
  float yspeed= map(z,0,20,1,20);
  
  void fall(){
    y = y+yspeed;
    
    
    if(y > height ){
      y = random(-200,-100);
      float yspeed= map(z,0,20,4,10);
    
  }
   
  }
  void show(){
    float thick= map(z,0,20,1,3);
    strokeWeight(thick);
    stroke(0,191,255);
    line(x,y,x,y+len);
  
  }
}
void Rain(){
cycle += 1; 
 
  for (int j = 0; j<start.length; j++){
      start[j].disp();
  }
}



class elm{
  elm(){
    
  }
}

class stream{
  int startTime, numChar, currHead, currTail, col, count;
  char[] chars;
  stream(int st, int nc, int c){
    this.startTime = st;
    this.numChar = nc;
    this.col = c;
    this.currHead = 0;
    this.currTail = currHead - numChar*textsize;
    this.chars = new char[this.numChar];
    this.count = -1;
    for (int i = 0; i < chars.length; i++){
      chars[i] = 'o';
    }
  }
  void disp(color c){
    this.currHead += textsize;
    this.currTail += textsize;
    this.count ++;
    int start = 0;
    int end = height;
    if (currTail>start){
      start = this.currTail;
    }
    if (this.currHead<end){
      end = this.currHead;
    }
    fill(c);
    for (int i = start; i < end; i+= textsize){
      text(chars[0],this.col,i);
    }
  }
  void reset(int st, int nc){
    this.startTime = st;
    this.numChar = nc;
    this.currHead = 0;
    this.currTail = this.currHead - this.numChar*textsize;
  }
}

class col{
  int num;
  stream s1;
  col(int n){
    this.num = n;
    s1 = new stream((int)random(100.0),(int)random(300.0),this.num*textsize+textsize);
  }
  void disp(){
    if (cycle > s1.startTime && s1.currTail < height){
      s1.disp(green);
    } 
    else if (s1.currTail >= height){
      s1.reset(cycle + (int)random(300),(int)random(300.0));
    }
  }
}
