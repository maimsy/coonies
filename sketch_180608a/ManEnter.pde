
float animStep = -20;
float lampStep = width+10;
void ManEnter(){
   animation1.display(animStep, height/2 - 60);
   
   if(animStep < 50){
    animStep += 0.5f;
  } 
  else{
    stage = 2;
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
    image(images[frame], xpos, ypos, 100 ,80);
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
