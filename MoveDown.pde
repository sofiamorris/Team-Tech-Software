import processing.serial.*;
Serial myPort;
Serial val;

/**
 * MoveDown
 */
int autoX, autoY;
int autoSize = 90;
color autoColor, baseColor;
color autoHighlight;
color currentColor;
boolean autoOver = false;
boolean valueHeld = false;

void setup() {
  size(640, 360);
  autoColor = color(0);
  autoHighlight = color(51);
  baseColor = color(102);
  currentColor = baseColor;
  autoX = width/2-autoSize-10;
  autoY = height/2-autoSize/2;
  ellipseMode(CENTER);
  
  
  //String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  //myPort = new Serial(this, portName, 9600);
}

void draw() {
  update(mouseX, mouseY);
  if(valueHeld){
    fill(autoHighlight);
    myPort.write('d');          //send an a
    println("d");
  } else {
    fill(autoColor);
    myPort.write('0');          //send a 0
  }
  stroke(255);
  rect(autoX, autoY, autoSize, autoSize); 
}

void update(int x, int y) {
  if ( overAuto(autoX, autoY, autoSize, autoSize) ) {
    autoOver = true;
  } else {
    autoOver = false;
  }
}

void mousePressed() {
  if (autoOver) {
    valueHeld = true;
  }
}

void mouseReleased() {
  if(valueHeld){
    valueHeld = false;
  }
  println("released");
}

boolean overAuto(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
