//Marlen Xique, Dangerous Shells
//How to play: Move Mario around using arrow keys 
//and run away from shells. You have 5 lives, everytime 
//you get hit by a shell you lose a life. Press 2 to start.
//if you lose press 1 to go back to instructions 
//or 2 to restart game
//if you press 1 at any time of the game you will go back to instructions


void setup(){
  size(1080, 700);
  textMode(CENTER);
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

  cloud1 = loadImage("cloud1.png");
  cloud2 = loadImage("cloud2.png");
  bush = loadImage("bush.png");
  hill = loadImage("hill.png");
  
  shell.resize(shellRadius, 0);
  cloud1.resize(100, 0);
  cloud2.resize(150, 0);
  hill.resize(200, 0);
  bush.resize(100, 0);
  enemy.resize(100, 0);
  backgroundFeatures();

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

      image(enemy, xEnemy, yEnemy);  
      image(run[player], xPlayer, yPlayer, playerRadius,playerRadius);
      
      playerRun();
      Shell();
      
      textSize(30);
      text("lives = " + lives, width - 110, 50); 
      Overlap();

    }
  }
 
 void keyPressed(){
  if(key == '1'){
    scene =1;
    if(gameOver == true){
      lives = 5;
      gameOver = false;
      loop(); 
    }
  }
  else if(key == '2'){
    scene =2;
    if(gameOver == true){
      lives = 5;
      gameOver = false;
      loop();     
    }
  }
}
