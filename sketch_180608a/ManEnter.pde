
float animStep = 0;
void ManEnter(){
  if(animStep < 50){
    animStep += 0.5f;
  } 
   animation1.display(animStep, height/2 - 50);
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
    image(images[frame], xpos, ypos, 50 ,50);
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
