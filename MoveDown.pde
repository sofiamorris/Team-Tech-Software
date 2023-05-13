import processing.serial.*;
Serial myPort;
Serial val;

/**
 * MoveDown
 */
int downX, downY;
int downSize = 90;
color downColor, baseColor;
color downHighlight;
color currentColor;
boolean downOver = false;
boolean valueHeld = false;

void setup() {
  size(640, 360);
  downColor = color(0);
  downHighlight = color(51);
  baseColor = color(102);
  currentColor = baseColor;
  downX = width/2-downSize-10;
  downY = height/2-downSize/2;
  ellipseMode(CENTER);
  
  String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  update(mouseX, mouseY);
  if(valueHeld){
    fill(downHighlight);
    myPort.write('d');          //send an d
    println("d");
  } else {
    fill(downColor);
    myPort.write('0');          //send a 0
  }
  stroke(255);
  rect(downX, downY, downSize, downSize);
  
}

void update(int x, int y) {
  if ( overDown(downX, downY, downSize, downSize) ) {
    downOver = true;
  } else {
    downOver = false;
  }
}

void mousePressed() {
  if (downOver) {
    valueHeld = true;
  }
}

void mouseReleased() {
  if(valueHeld){
    valueHeld = false;
  }
  println("released");
}

boolean overDown(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
