
PFont font48;
PFont font24;

void setup(){
  size(780, 780);
  noStroke();
  
  background(200,167,218);

  
  font48 = createFont("PTSans-Caption", 48);
  font24 = createFont("PTSans-Caption", 24);
}

void draw(){
  
  //BORDER
  stroke(127,69,154);
  strokeWeight(10);
  
  //ON AND OFF BUTTON
  float centerx = width/2;
  float centery = height/2;
  
  float onButtonWidth = width/3;
  float onButtonHeight = height/4;

  float onButtonx = width/2 - onButtonWidth/2;
  float onButtony = height/2 - onButtonHeight/2;
 
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
  
  float emergencyWidth = width/4;
  float emergencyHeight = height/5;
  
  float emergencyx = width/6 - emergencyWidth/2;
  float emergencyy = height/2 - emergencyHeight/2;

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
  
  float automaticWidth = width/4;
  float automaticHeight = height/5;
  
  float onButtonx3 = (5*width)/6 - automaticWidth/2;
  float onButtony3 = height/2 - automaticHeight/2;
  
  fill(127,69,154);

  rect(onButtonx3, onButtony3, automaticWidth, automaticHeight, 28);
  
  float textx2 = (5*width)/6;
  float texty2 = height/2;
  
  fill(245, 225, 253);
  textSize(automaticWidth/100);
  textAlign(CENTER, CENTER);
  textFont(font24);
  text("AUTOMATIC", textx2, texty2);
  
  //MOVE UP BUTTON
  float seperationDistance = height/15;
  float leftx1 = centerx - onButtonWidth/2;
  float lefty1 = centery - onButtonHeight/2 - seperationDistance;
  float rightx1 = centerx + onButtonWidth/2;
  float righty1 = centery -  onButtonHeight/2 - seperationDistance;
  float vertexx1 = (leftx1 + rightx1)/ 2;
  float vertexy1 = centery - onButtonHeight - 2*seperationDistance;
  
  fill(245, 225, 253);
  
  triangle(leftx1, lefty1, rightx1, righty1, vertexx1, vertexy1);
  
  //MOVE DOWN BUTTTON
  float leftx2 = centerx - onButtonWidth/2;
  float lefty2 = centery + onButtonHeight/2 + seperationDistance;
  float rightx2 = centerx + onButtonWidth/2;
  float righty2 = centery +  onButtonHeight/2 + seperationDistance;
  float vertexx2 = (leftx1 + rightx1)/ 2;
  float vertexy2 = centery + onButtonHeight + 2*seperationDistance;
  
  fill(245, 225, 253);
  
  triangle(leftx2, lefty2, rightx2, righty2, vertexx2, vertexy2);
  
  
 
}
