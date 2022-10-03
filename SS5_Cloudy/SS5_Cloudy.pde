//Cloudy by Marlen Xique
//the apple doesnt fall far from the tree, especially this one.
//hold mouse button on the tree's leaves to watch the apple fall.
//Press any key and the bunny's eyes will blink!
//you can also watch the clouds come and go and the stars twinkle

PImage[] anim = new PImage [4];
PImage cloud1;
PImage cloud2;
PImage tree1;
PImage flower1;
PImage apple1;
float move = 5;
float fall = 5;
String quote = "Cloudy";
int b = 675;
int bunny = 0;



void setup(){
  size(1080, 720); 
  imageMode(CENTER);
  textAlign(CENTER);
  textSize(50);
  
  cloud1 = loadImage("cloud1.png");
  cloud2 = loadImage("cloud2.png");
  tree1 = loadImage("tree1.png");
  apple1 = loadImage("apple1.png");
  flower1 = loadImage("flower1.png");
  
  for (int i = 0; i < anim.length; i++){
    anim[i] = loadImage ("bunny_" + i + ".png");   
  } 
}
 
void draw(){    
  background (#131862); 
  ellipseMode(CENTER);
  
  fill(#4D833C);
  noStroke(); 
  
  rect(0, height/2 + 250, 1440, 110);
  image(anim[bunny], width/2, height/2 +200, 100, 100);
  
  text(quote, width/2, height/2 - 50);
  
  tree1.resize(400, 0);
  cloud1.resize(300, 0);
  cloud2.resize(300, 0); 
  apple1.resize(50, 0);
  flower1.resize(75, 0);
  
  stars(round(random(width)),round(random(height-200)));
  moon(255, 255, 0, width/2, height/4, 75); 
 
  image(cloud1, move, 150);
  image(cloud2, move, 400);
  
  for(int x = 15; x < 1440; x +=35){
    fill(#355E3B);
    for(int y = 600; y <800; y +=30)
    triangle(x, y, x - 15, y + 30, x + 15, y + 30);
    fill(#4D833C);
    for(int y = 600; y <800; y +=30)
    triangle(x, y + 10, x - 7, y + 30, x + 7, y + 30);   
  }

  image(tree1, 200, height/2 + 150);
  
  for(int a = 15; a < 1440; a +=60){
  image(flower1, a, b);
  }
   
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
 
 void keyPressed(){

    if (bunny == anim.length-1){
      bunny = 0;
   }
    else {
      bunny++;
  }  
 }
 
 void moon(int r, int g, int b,int x, int y, int radius){
   
   
  fill(r, g, 0);
  ellipse(x, y, radius *2, radius *2);
 }
 
void stars(int placeX, int placeY){
  fill(255);
  noStroke();
  ellipse(placeX, placeY, 5, 5);
}
