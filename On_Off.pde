import processing.serial.*;
Serial myPort;
Serial val;

/**
 * OnOff
 */
int powerX, powerY;
int powerSize = 90;
color powerColor, baseColor;
color powerHighlight;
color currentColor;
boolean powerOver = false;

void setup() {
  size(640, 360);
  powerColor = color(0);
  powerHighlight = color(51);
  baseColor = color(102);
  currentColor = baseColor;
  powerX = width/2-powerSize-10;
  powerY = height/2-powerSize/2;
  ellipseMode(CENTER);
  
  
  String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  update(mouseX, mouseY);
  
  if (powerOver) {
    fill(powerHighlight);
  } else {
    fill(powerColor);
  }
  stroke(255);
  rect(powerX, powerY, powerSize, powerSize);
  
}


void update(int x, int y) {
  if ( overPower(powerX, powerY, powerSize, powerSize) ) {
    powerOver = true;
  } else {
    powerOver = false;
  }
}

void mousePressed() {
  if (powerOver && down == 1) {
    myPort.write('h');          //send an h
    println("h");   
    down = 0;
  } else if ( powerOver && down == 0 ){
    myPort.write('l');          //send an l
    println("l");   
    down = 1;
  }else 
  {                             //otherwise
    myPort.write('0');          //send a 0
  }
}

boolean overPower(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
