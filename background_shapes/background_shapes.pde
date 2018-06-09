float x, y;
float xadd=2;
// Two ArrayLists to store the vertices for two shapes
// This example assumes that each shape will have the same
// number of vertices, i.e. the size of each ArrayList will be the same
ArrayList<PVector> circle = new ArrayList<PVector>();
ArrayList<PVector> diamond = new ArrayList<PVector>();

// An ArrayList for a third set of vertices, the ones we will be drawing
// in the window
ArrayList<PVector> morph = new ArrayList<PVector>();

// This boolean variable will control if we are morphing to a circle or diamond
boolean state = false;

void setup() {
  size(500, 500, P2D);

  // Create a circle using vectors pointing from center
  for (int angle = 0; angle < 360; angle += 9) {
    // Note we are not starting from 0 in order to match the
    // path of a circle.  
    PVector v = PVector.fromAngle(radians(angle-135));
    v.mult(50);
    circle.add(v);
    // Let's fill out morph ArrayList with blank PVectors while we are at it
    morph.add(new PVector());
  }

  // A diamond is a bunch of vertices along straight lines
  // Top of diamond
  //Incrementing the index by 7 or 8 makes the resulting 'circle' look like a pac mac
  int incr = 7; //5 makes the circle
  for (int x = 0, y = 50; x < 50 && y > 0; x += incr, y-=incr) {
    diamond.add(new PVector(x, y));
  }
  // Right side
  for (int x = 50, y = 0; x > 0 && y > -50; x-=incr, y -= incr) {
    diamond.add(new PVector(x, y));
  }
  // Bottom
  for (int x = 0, y = -50; x > -50 && y < 0; x -= incr, y +=incr) {
    diamond.add(new PVector(x, y));
  }
  // Left side
  for (int x = -50, y = 0; x < 0 && y < 50; y +=incr, x +=incr) {
    diamond.add(new PVector(x, y));
  }
}

void draw() {
  background(255,215,0);
  translate (x, y); //For moving the canvas
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
    v2.lerp(v1, 0.4);
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
  for(int t = 0; t < 1000; t += 100) {//TODO: consider changing to while loop
  pushMatrix();
  translate(-200+t, -200+t);//diamond to circle shape //rotate(-200+t);makes cool star/flower to circle transformation
  
  beginShape();
  noFill();
  stroke(255);
  for (PVector v : morph) {
    vertex(v.x, v.y);
  }
  endShape(CLOSE);
  popMatrix();
  }
  popMatrix();
  }
  
  //Code below helps to moves the whole canvas
  x-=xadd;
  //y+=0;
  //if (x>width)
    //xadd=-1*abs(xadd); //causes change of direction
    
}
