//Marlen Xique, Dangerous Snow
//move player around using arrow keys and the cloud will follow

PImage[] run = new PImage [2];
PImage player_run0;
PImage player_run1;

int player = 0;
int xPlayer = 10;
int playerSpeed = 10;

PImage enemy;

float xEnemy;
float easing = 0.05;
int pos;


void setup(){
  size(1080, 700);
  imageMode(CENTER);
  rectMode(CORNER);
  frameRate(40);

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
  
  enemy.resize(100, 0);
   
  image(enemy, xEnemy, 100);  
  image(run[player], xPlayer, height/2 + 100, 75, 75);
  playerRun();
  Enemy();
}

void  Enemy(){
  float dx = xPlayer - xEnemy;
  xEnemy += dx * easing;
 
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
