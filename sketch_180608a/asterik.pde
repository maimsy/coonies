

float outsideRadius = 150;
float insideRadius = 100;

int boxxStep = 0;

void boxx(){
  int numPoints = int(map(random(20,100), 0, width, 6, 60));
  float angle = 0;
  float angleStep = 180.0/numPoints;
  int x = 0;
  int y = 0;
    
  translate(width/2, height/2);
  rotate(radians(frameCount));
  
  beginShape(TRIANGLE_STRIP); 
   
  for (int i = 0; i <= numPoints; i++) {
    float px = x + cos(radians(angle)) * outsideRadius;
    float py = y + sin(radians(angle)) * outsideRadius;
    angle += angleStep;
    fill(243,180,197);
    vertex(px, py);
    px = x + cos(radians(angle)) * insideRadius;
    py = y + sin(radians(angle)) * insideRadius;
    fill(99,99,99);
    vertex(px, py); 
    angle += angleStep;
  }
  endShape();
  
  boxxStep += 5;
  if(boxxStep >= 500){
    stage = 5;
  }
}
