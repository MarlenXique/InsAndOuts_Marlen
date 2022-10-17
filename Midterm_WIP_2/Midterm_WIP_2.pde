//Marlen Xique, Dangerous Snow
//move player around using arrow keys and the cloud will follow

PImage[] run = new PImage [2];
PImage player_run0;
PImage player_run1;

int player = 0;
int xPlayer = 10;
int yPlayer = height/2 +400;
int playerSpeed = 5;

PImage enemy;
PImage shell;
float xShell;
float yShell = 100;
float xEnemy;
float easing = 0.05;
int pos;

int scene = 1;                 
int lives= 5;                  
boolean lost= false;
String title= "Dangerous Shells";
String start = "How to play: Move Mario around using arrow keys and run away from shells. You have 5 lives, everytime you get hit by a shell- you lose a life. Press 2 to continue";

void setup(){
  size(1080, 700);
  imageMode(CENTER);
  rectMode(CORNER);
  frameRate(40);
  shell = loadImage("shell.png");
  enemy = loadImage("enemy.png");

  for (int i = 0; i < run.length; i++){
    run[i] = loadImage ("player_run" + i + ".png");   
  }
}

void draw(){ 
  background(#8ca8e6);  
  fill(#3f593f);
  noStroke();  
  rect(0, height/2 + 100, 1440, 255);
  
  shell.resize(50 ,0);
  enemy.resize(100, 0);  
  
   if(scene == 1){
 
     fill(#82e729);
     stroke(#0d803e);
     strokeWeight(30);
     rect(width/2 - 300, height/2 - 250, 600, 500);
     
     fill(0);
     textSize(50);
     text(title, width/2 - 280, height/2 - 150);
     
     fill(255);
     textSize(30);
     text(start,width/2 - 280, height/2 - 100, 500, 500);
   
   }
   
    else if(scene == 2){
      Enemy();

      image(enemy, xEnemy, 100);  
      image(run[player], xPlayer, yPlayer, 75, 75);
      playerRun();
      
      textSize(30);
      text("lives = " + lives, width - 110,50);      
    }
  }

void  Enemy(){
  float dx = xPlayer - xEnemy;
  xEnemy += dx * easing;
  
  image(shell, xShell, yShell);
  xShell = xEnemy;
  yShell  = yShell +1;
  
    if (yShell > height-230){
      yShell = 0;    
    } 
}

 void playerRun(){
   
   if (keyPressed){
   if (keyCode == RIGHT){
      xPlayer =  xPlayer + playerSpeed;
      if (xPlayer > width + 30){
      xPlayer = 0;
     }
   }
    if  (keyCode == LEFT) {
      xPlayer =  xPlayer - playerSpeed;
      if (xPlayer <= -30){
      xPlayer = width + 30;
      }
    }
   
    if (player == run.length-1){
      player = 0;
   }
    else {
      player++;
  }
   }
 }
 
 void keyPressed(){
  if(key == '1'){
    scene =1;
  }
  else if(key == '2'){
    scene =2;
  }
}
