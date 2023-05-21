import processing.serial.*;
Serial myPort;
Serial val;
PFont font48;
PFont font24;

boolean onOver = false;
boolean offOver = false;
boolean upOver = false;
boolean downOver = false;
boolean autoOver = false;
int down = 1;
float centerx;
float centery;
float onButtonHeight;
float onButtonWidth;
float onButtonx;
float onButtony;
float emergencyWidth;
float emergencyHeight;
float emergencyx;
float emergencyy;
float seperationDistance;
float leftx1;
float lefty1;
float rightx1;
float righty1;
float leftx2;
float lefty2;
float rightx2;
float righty2;
float automaticWidth;
float automaticHeight;
float automaticx;
float automaticy;

void setup(){
  size(780, 780);
  noStroke();
  
  background(200,167,218);
  
  font48 = createFont("PTSans-Caption", 48);
  font24 = createFont("PTSans-Caption", 24);
  
  String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
}

void draw(){
  
  update(mouseX,mouseY);

   //BORDER
  stroke(127,69,154);
  strokeWeight(10);
  
  //ON AND OFF BUTTON
  centerx = width/2;
  centery = height/2;
  
  onButtonWidth = width/3;
  onButtonHeight = height/4;

  onButtonx = width/2 - onButtonWidth/2;
  onButtony = height/2 - onButtonHeight/2;
 
  rect(onButtonx, onButtony, onButtonWidth, onButtonHeight, 28);
  
  String onOff = "ON/OFF";
  
  fill(127,69,154);
  textSize(onButtonWidth/5);
  textAlign(CENTER, CENTER);
  textFont(font48);
  text(onOff, centerx, centery-10);
  
 
  stroke(127,69,154);
  strokeWeight(12);
  
  //EMERGENCY OFF
  
  emergencyWidth = width/4;
  emergencyHeight = height/5;
  
  emergencyx = width/6 - emergencyWidth/2;
  emergencyy = height/2 - emergencyHeight/2;

  fill(127,69,154);
  
 
  rect(emergencyx, emergencyy, emergencyWidth, emergencyHeight, 28);

  
  float textx1 = width/6;
  float texty1 = height/2;
  fill(245, 225, 253);
  textSize(emergencyWidth/100);
  textAlign(CENTER, CENTER);
  textFont(font24);
  text("EMERGENCY", textx1, texty1-15);
  
  
  text("OFF", textx1, texty1+15);
  
  fill(245, 225, 253);
  textSize(emergencyWidth/100);
  textAlign(CENTER, CENTER);
  textFont(font24);
  
  
  //AUTOMATIC BUTTON
  
  automaticWidth = width/4;
  automaticHeight = height/5;
  
  automaticx = (5*width)/6 - automaticWidth/2;
  automaticy = height/2 - automaticHeight/2;
  
  fill(127,69,154);

  rect(automaticx, automaticy, automaticWidth, automaticHeight, 28);
  
  float textx2 = (5*width)/6;
  float texty2 = height/2;
  
  fill(245, 225, 253);
  textSize(automaticWidth/100);
  textAlign(CENTER, CENTER);
  textFont(font24);
  text("AUTOMATIC", textx2, texty2);
  
  //MOVE UP BUTTON
  seperationDistance = height/15;
  leftx1 = centerx - onButtonWidth/2;
  lefty1 = centery - onButtonHeight/2 - seperationDistance;
  rightx1 = centerx + onButtonWidth/2;
  righty1 = centery -  onButtonHeight/2 - seperationDistance;
  float vertexx1 = (leftx1 + rightx1)/ 2;
  float vertexy1 = centery - onButtonHeight - 2*seperationDistance;
  
  fill(245, 225, 253);
  
  triangle(leftx1, lefty1, rightx1, righty1, vertexx1, vertexy1);
  
  //MOVE DOWN BUTTTON
  leftx2 = centerx - onButtonWidth/2;
  lefty2 = centery + onButtonHeight/2 + seperationDistance;
  rightx2 = centerx + onButtonWidth/2;
  righty2 = centery +  onButtonHeight/2 + seperationDistance;
  float vertexx2 = (leftx1 + rightx1)/ 2;
  float vertexy2 = centery + onButtonHeight + 2*seperationDistance;
  
  fill(245, 225, 253);
  
  triangle(leftx2, lefty2, rightx2, righty2, vertexx2, vertexy2);
  }

void update(int x, int y) {
  if ( overOn(onButtonx, onButtony, onButtonHeight, onButtonWidth) ) {
    onOver = true;
    offOver = false;
    upOver = false;
    downOver = false;
    autoOver = false;
  } else if ( overOff(emergencyx, emergencyy, emergencyHeight, emergencyWidth) ) {
    offOver = true;
    onOver = false;
    upOver = false;
    downOver = false;
    autoOver = false;
  } else if ( overUp(leftx1, lefty1, rightx1 - leftx1, righty1 - lefty1) ) {
    upOver = true;
    onOver = false;
    offOver = false;
    downOver = false;
    autoOver = false;
  } else if ( overDown(leftx2, lefty2, rightx2 - leftx2, righty2 - lefty2) ) {
    downOver = true;
    onOver = false;
    offOver = false;
    upOver = false;
    autoOver = false;
  } else if ( overAuto(automaticx, automaticy, automaticHeight, automaticWidth) ) {
    autoOver = true;
    onOver = false;
    offOver = false;
    upOver = false;
    downOver = false;
  } else {
    onOver = offOver = upOver = downOver = autoOver = false;
  }
}

void mousePressed() {
  if (onOver && down == 1) {
    myPort.write('h');          //send an h
    println("h");   
    down = 0;
  } if ( (onOver && down == 0) || offOver){
    myPort.write('l');          //send an l
    println("l");   
    down = 1;
  } if (autoOver) {
    myPort.write('a');          //send an a
    println("a");   
  } if ( upOver ){
    myPort.write('u');          //send a u
    println("u");   
  } if (downOver) {
    myPort.write('d');          //send a d
    println("d");   
  }
}

boolean overOn(float x, float y, float width, float height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overOff(float x, float y, float width, float height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overUp(float x, float y, float width, float height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overDown(float x, float y, float width, float height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overAuto(float x, float y, float width, float height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
