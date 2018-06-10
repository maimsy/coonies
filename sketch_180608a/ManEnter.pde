
float animStep = -50;
float lampStep = width+10;
float manEndLocation = 0;


void ManEnter(){
  /*
  if(stage == 4){
    // Draw relative to center
    translate(width/2, height/2);
    // rotate around the center of the sketch
    rotate(radians(frameCount));
    //stage = 5;
  }*/
  
   animation1.display(animStep, height/2 - 90);
   if(stage < 3){ manEndLocation = 50; }
   else{ 
     manEndLocation = (width/2)-60;
   }
   
    if(animStep < manEndLocation){
      animStep += 1f;
    } 
    /*else if(animStep >= width/2-50){
      println(stage);
      stage = 4;
    }*/
    else if(stage < 3){
      stage = 2;
    } 
    else if(stage < 5){
      stage = 4;
    }
    else{
      stage = 5;
    }
    
   
   //lamp enters
  if(stage == 2){
    image(lamp, lampStep , height/2 - 40, 40, 40);
    if(lampStep > -10){
      lampStep = lampStep - 8;
    }
    else {
      lampStep = width+10;
    }
  }
}


void EnterWhiteMan(){ 
  animation2.display((width-140)-animStep, height/2 - 5);
}


// Class for animating a sequence of GIFs
class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 1) + ".png";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos, 150 ,120);
  }
  
  int getWidth() {
    if(images[0] == null){
    println("no images");}
    return images[0].width;
  }
  
  int getHeight(){
    return images[0].height;
  }
}
