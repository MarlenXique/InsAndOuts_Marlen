import processing.serial.*;
Serial myPort;
char HEADER = 'H';
short LF = 10;        // ASCII linefeed
int[] values = {0, 1};
color c = color(0, 0, 0);

float move = 0;

void setup() {
  size(600, 600);
  rectMode(CENTER);
  ellipseMode(CORNER);

  String[] portList = Serial.list();
  printArray(portList);
  String portName = Serial.list()[2];
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  readString();
  backGround();
  
  if(values[1] == 0){
     c = color(random(255), random(255), random(255));
  }
  fill (c);
  noStroke();
  ellipse (move, height/2 + 80, 50, 50);
  
  move  = 0 + values[0];
  if (move > width){
      move = 0;
      ;
    }
    
}

void backGround(){
  background(#87CEEB);
  fill(#7CFC00);
  strokeWeight(5);
  stroke(#639c2d);
  rect (width/2, height/2 + 200, 600, 195);
}

void readString(){
  if ( myPort.available() > 0) {
    String message = myPort.readStringUntil(LF);
    
    if(message != null) {
      print(message);
      String [] data  = message.split(","); // Split the comma-separated message
      if(data[0].charAt(0) == HEADER) {       // check for header character in the first field
        for( int i = 1; i < data.length-1; i++) { // skip the header and terminating cr and lf
          try{
            values[i-1] = Integer.parseInt(data[i]);
          }
          catch (NumberFormatException e){
            return;
          }
          println("Value" +  i + " = " + values[i-1]);  //Print the value for each field
        }
        println();
      }
    }
  }
}
