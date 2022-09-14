//Marlen Xique, Playing at sunsrise
//the sun follows your mouse, if the sun is below 
//"ground level" it becomes night time and you can
//see twinkling stars. if you press your mouse during
//day time then the ball will bounce- so you'll be 
// "Playing at sunsrise"



float x, y, xMove, yMove;

void setup(){
  size(1080,720);
  rectMode(CENTER);

  
    
}
void draw(){
  background (#86FFFC);
  
  noStroke();
  fill(#F9F229);
  ellipse(width/2, mouseY, 200, 200);
  
  
  fill(#53F679);
  rect(width/2, 550, 1080, 360);
  
  fill(#F69090);
  ellipse(x,y, 50, 50);
  
  x = x + xMove;
  y = y + yMove;
  
  if (x>width || x<0){
  xMove = -xMove;
  }
  
  // doesnt go beyond the grass point
  if (y>height/2 || y<0){
  yMove = -yMove;
  }
  
//if mouse down then turn night time
  if (mouseY>height/2){
    background (#2B38AE);  
    
    //stars
    fill(255);
    noStroke();
    ellipse(random(width), random(height), 5, 5);
    
    //grass
    fill(#199236);
    rect(width/2, 550, 1080, 360);
    
 
  
    }
    
}
void mousePressed(){
  xMove = random(-10, 10);
  yMove = random(-10, 10);
  
}
