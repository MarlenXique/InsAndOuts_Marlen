//cloudy by Marlen Xique
//the apple doesnt fall far from the tree, especially this one.
//hold mouse button on the tree's leaves to watch the apple fall.
//you can also watch the clouds come and go
PImage cloud1;
PImage cloud2;
PImage tree1;
PImage apple1;
float move = 5;
float fall = 5;
String quote = "Cloudy";


void setup(){
  size(1080, 720);
  background (#87ceeb);
  imageMode(CENTER);
  
  textAlign(CENTER);
  textSize(50);
  
  cloud1 = loadImage("cloud1.png");
  cloud2 = loadImage("cloud2.png");
  tree1 = loadImage("tree1.png");
  apple1 = loadImage("apple1.png");
}

void draw(){
    
  background (#87ceeb);
  
  text(quote, width/2, height/2 - 50); 
  
  noStroke();
  
  fill(#4D833C);
  rect(0, height/2 + 250, 1440, 110);
  
  cloud1.resize(300, 0);
  cloud2.resize(300, 0);
  tree1.resize(400, 0);
  apple1.resize(50, 0);
  
  image(cloud1, move, 150);
  image(cloud2, move, 400);
  
  image(tree1, 200, height/2 + 150);
  
  move  = move +1.5;
  
  if (move > width){
      move = 0;
    }
  
  image(apple1, 250, 475 + fall);
  
  if (mouseX > 50 && mouseX < 325 && mouseY > 325 && mouseY < 580){
    if(mousePressed){
      
    fall  = fall + 1.5;
    if (fall > 150){
      fall = 150;
      }   
    }
  }
}
