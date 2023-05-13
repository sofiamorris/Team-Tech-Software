import processing.serial.*;
Serial myPort;
Serial val;

/**
 * Automatic
 */
int autoX, autoY;
int autoSize = 90;
color autoColor, baseColor;
color autoHighlight;
color currentColor;
boolean autoOver = false;

void setup() {
  size(640, 360);
  autoColor = color(0);
  autoHighlight = color(51);
  baseColor = color(102);
  currentColor = baseColor;
  autoX = width/2-autoSize-10;
  autoY = height/2-autoSize/2;
  ellipseMode(CENTER);
  
  
  String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  update(mouseX, mouseY);
  
  if (autoOver) {
    fill(autoHighlight);
  } else {
    fill(autoColor);
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
    myPort.write('a');          //send an a
    println("a");   
  } else 
  {                             //otherwise
    myPort.write('0');          //send a 0
  }
}

boolean overAuto(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
