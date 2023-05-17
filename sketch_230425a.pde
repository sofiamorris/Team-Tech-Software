
PFont font48;
PFont font24;

void setup(){
  size(780, 780);
  noStroke();
  
  background(200,167,218);
  rectMode(CENTER);
  
  font48 = createFont("PTSans-Caption", 48);
  font24 = createFont("PTSans-Caption", 24);
}

void draw(){
  
  //BORDER
  stroke(127,69,154);
  strokeWeight(10);
  
  //ON AND OFF BUTTON
  float onButtonx1 = width/2;
  float onButtony1 = height/2;
  float onButtonWidth1 = width/3;
  float onButtonHeight1 = height/4;

  rect(onButtonx1, onButtony1, onButtonWidth1, onButtonHeight1, 28);
  
  String onOff = "ON/OFF";
  
  fill(127,69,154);
  textSize(onButtonWidth1/5);
  textAlign(CENTER, CENTER);
  textFont(font48);
  text(onOff, onButtonx1, onButtony1-10);
  
 
  stroke(127,69,154);
  strokeWeight(12);
  
  //EMERGENCY OFF
  float onButtonx2 = width/6;
  float onButtony2 = height/2;
  float onButtonWidth2 = width/4;
  float onButtonHeight2 = height/5;

  //fill(245, 225, 253);
  fill(127,69,154);
  
 
  rect(onButtonx2, onButtony2, onButtonWidth2, onButtonHeight2, 28);

  
  //fill(127,69,154);
  fill(245, 225, 253);
  textSize(onButtonWidth2/100);
  textAlign(CENTER, CENTER);
  textFont(font24);
  text("EMERGENCY", onButtonx2, onButtony2-10);
  
  
  text("OFF", onButtonx2, onButtony2+15);
  //fill(127,69,154);
  fill(245, 225, 253);
  textSize(onButtonWidth2/100);
  textAlign(CENTER, CENTER);
  textFont(font24);
  
  
  //AUTOMATIC BUTTON
  float onButtonx3 = (5*width)/6;
  float onButtony3 = height/2;
  float onButtonWidth3 = width/4;
  float onButtonHeight3 = height/5;
  
  //fill(245, 225, 253);
  fill(127,69,154);

  rect(onButtonx3, onButtony3, onButtonWidth3, onButtonHeight3, 28);
  
  
  //fill(127,69,154);
  fill(245, 225, 253);
  textSize(onButtonWidth2/100);
  textAlign(CENTER, CENTER);
  textFont(font24);
  text("AUTOMATIC", onButtonx3, onButtony3);
  
  //MOVE UP BUTTON
  float seperationDistance = height/15;
  float leftx1 = onButtonx1 - onButtonWidth1/2;
  float lefty1 = onButtony1 - onButtonHeight1/2 - seperationDistance;
  float rightx1 = onButtonx1 + onButtonWidth1/2;
  float righty1 = onButtony1 -  onButtonHeight1/2 - seperationDistance;
  float vertexx1 = (leftx1 + rightx1)/ 2;
  float vertexy1 = onButtony1 - onButtonHeight1 - 2*seperationDistance;
  
  fill(245, 225, 253);
  
  triangle(leftx1, lefty1, rightx1, righty1, vertexx1, vertexy1);
  
  //MOVE DOWN BUTTTON
  float leftx2 = onButtonx1 - onButtonWidth1/2;
  float lefty2 = onButtony1 + onButtonHeight1/2 + seperationDistance;
  float rightx2 = onButtonx1 + onButtonWidth1/2;
  float righty2 = onButtony1 +  onButtonHeight1/2 + seperationDistance;
  float vertexx2 = (leftx1 + rightx1)/ 2;
  float vertexy2 = onButtony1 + onButtonHeight1 + 2*seperationDistance;
  
  fill(245, 225, 253);
  
  triangle(leftx2, lefty2, rightx2, righty2, vertexx2, vertexy2);
  
  
 
}
