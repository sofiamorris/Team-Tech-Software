import processing.serial.*;
Serial myPort;
Serial val;

/**
 * Manual
 */
int manualX, manualY;
int manualSize = 90;
color manualColor, baseColor;
color manualHighlight;
color currentColor;
boolean manualOver = false;

void setup() {
  size(640, 360);
  manualColor = color(0);
  manualHighlight = color(51);
  baseColor = color(102);
  currentColor = baseColor;
  manualX = width/2-manualSize-10;
  manualY = height/2-manualSize/2;
  ellipseMode(CENTER);
  
  
  String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  update(mouseX, mouseY);
  
  if (manualOver) {
    fill(manualHighlight);
  } else {
    fill(manualColor);
  }
  stroke(255);
  rect(manualX, manualY, manualSize, manualSize);
  
}


void update(int x, int y) {
  if ( overManual(manualX, manualY, manualSize, manualSize) ) {
    manualOver = true;
  } else {
    manualOver = false;
  }
}

void mousePressed() {
  if (manualOver) {
    myPort.write('m');          //send an m
    println("m");   
  } else 
  {                             //otherwise
    myPort.write('0');          //send a 0
  }
}

boolean overManual(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
