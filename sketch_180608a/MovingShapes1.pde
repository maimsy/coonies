int movingShapes1Steps = width;
void MovingShapes(){
  
  if(movingShapes1Steps < -500 && movingShapes1Steps > -1200){
    stage = 3;
  }
  
  if(movingShapes1Steps < -1200 ){
    println("stage "+stage);
    stage = 4;
  }
  
   movingShapes1Steps -= 5;
  
  //translate (x, y); //For moving the canvas
  // We will keep how far the vertices are from their target
  float totalDistance = 0;
  
  // Look at each vertex
  //Have an array of shapes that it can transform into
  for (int i = 0; i < diamond.size(); i++) {
    PVector v1;
    // Are we lerping to the circle or diamond?
    if (state) {
      v1 = circle.get(i);
    }
    else {
      v1 = diamond.get(i);
    }
    // Get the vertex we will draw
    PVector v2 = morph.get(i);
    // Lerp to the target
    v2.lerp(v1, 0.5);
    // Check how far we are from target
    totalDistance += PVector.dist(v1, v2);
  }
  
  // If all the vertices are close, switch shape
  if (totalDistance < 0.1) {
    state = !state;
  }
  
  // Draw relative to center
  //translate(width/2, height/2);
  strokeWeight(4);
  // Draw a polygon that makes up all the vertices
  for(int r = -1000; r < 1000; r += 100) {

  pushMatrix();
  translate(r,0);
  for(int t = 0; t < 2000; t += 100) {//TODO: consider changing to while loop
  pushMatrix();
  translate(-200+t, -200+t);//diamond to circle shape //rotate(-200+t);makes cool star/flower to circle transformation
 
  
  beginShape();
  stroke(255);
  for (PVector v : morph) {
    vertex(v.x + movingShapes1Steps, v.y+50);
  }
  fill(random(255), random(255), random(255) );
  
  endShape(CLOSE);
  
  popMatrix();
  }
  popMatrix();
  }
  
     //Code below helps to moves the whole canvas
  x-=xadd;
  y+=0;
  if (x>width)
      xadd=-1*abs(xadd); //causes change of direction
}
