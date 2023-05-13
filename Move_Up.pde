import processing.serial.*;
Serial myPort;
Serial val;

/**
 * Moveup
 */
int upX, upY;
int upSize = 90;
color upColor, baseColor;
color upHighlight;
color currentColor;
boolean upOver = false;
boolean valueHeld = false;

void setup() {
  size(640, 360);
  upColor = color(0);
  upHighlight = color(51);
  baseColor = color(102);
  currentColor = baseColor;
  upX = width/2-upSize-10;
  upY = height/2-upSize/2;
  ellipseMode(CENTER);
  
  String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  update(mouseX, mouseY);
  if(valueHeld){
    fill(upHighlight);
    myPort.write('u');          //send an u
    println("u");
  } else {
    fill(upColor);
    myPort.write('0');          //send a 0
  }
  stroke(255);
  rect(upX, upY, upSize, upSize);
  
}

void update(int x, int y) {
  if ( overup(upX, upY, upSize, upSize) ) {
    upOver = true;
  } else {
    upOver = false;
  }
}

void mousePressed() {
  if (upOver) {
    valueHeld = true;
  }
}

void mouseReleased() {
  if(valueHeld){
    valueHeld = false;
  }
  println("released");
}

boolean overup(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
