

float outsideRadius = 300;
float insideRadius = 250;

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
    float px = x + cos(radians(angle)) * outsideRadius ;
    float py = y + sin(radians(angle)) * outsideRadius ;
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
 
void sun(){
fill(255, 180);
ellipse(400, 100, 100, 100);

fill(255, 10);
ellipse(400, 100, growth, growth);
ellipse(400, 100, 140, 140);
ellipse(400, 100, 160, 160);
 growth=growth+increment;
  if(growth>120) {increment=increment*-20;}  //max ellipse size you can play with those
  if(growth<60) {increment=+20;}            //min ellipse size you can play with those

fill(5, 73, 100);
ellipse(400, 100, 95, 95);


fill(255, 180);
ellipse(100, 400, 100, 100);

fill(255, 10);
ellipse(100, 400, growth, growth);
ellipse(100, 400, 140, 140);
ellipse(100, 400, 160, 160);
 growth=growth+increment;
  if(growth>120) {increment=increment*-20;}  //max ellipse size you can play with those
  if(growth<60) {increment=+20;}            //min ellipse size you can play with those

fill(5, 73, 100);
ellipse(100, 400, 95, 95);
}
 
