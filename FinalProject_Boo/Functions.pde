//-------backgound trees, bushes, clouds-------
void backgroundFeatures(){
  image(cloud1, cloudRespawn,  100);
  image(cloud2, cloudRespawn +100, 200);
 for(int i = 15; i < 1440; i +=300){
  image(tree, i, height/2);
  image(bush, i + 100, height/2 + 63);  
  }
  cloudRespawn = cloudRespawn + 1.5;
  if (cloudRespawn >width + 100){
    cloudRespawn = 0 - 200;
   } 
}

//------------enemy: bat --------------
void bat(){  
  image(bat, xbat, ybat);
    xbat = xEnemy;
    float dx = xPlayer - xEnemy;
    xEnemy += dx * easing;
    ybat  = ybat + batSpeed;
  
    if (ybat > height-230){
      ybat = yEnemy;
      
   } 
 }
 
 
 

//---------player----------

 void playerRun(){
   
   if (keyPressed){
     //running.loop(); //test
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

//-----------if bat collides with player-------------
 void Overlap(){
   if((xbat > xPlayer && xbat < xPlayer + playerRadius 
   || xPlayer > xbat && xPlayer < xbat + batRadius) 
   && (ybat > yPlayer && ybat < yPlayer + playerRadius 
   || yPlayer > ybat && yPlayer < ybat + batRadius)){
     ybat = yEnemy;
     fill(255, 0, 0);
     lives = lives - 1 ;
    
      if (lives == 0){
        fill(#d4e8c3);
        stroke(#202924);
        strokeWeight(10);
        rect(width/2 - 180, 50, 300, 100);
        
        textSize(30);
        fill(#803028);
        text(gameOverText, width/2 - 170, 50, 300, 300);
        noLoop();
        gameOver = true;  
       }
   }
   if((xbat > mouseX && xbat < mouseX + val1 
   || mouseX > xbat && mouseX < xbat + batRadius) 
   && (ybat > mouseY && ybat < mouseY + val1 
   || mouseY > ybat && mouseY < ybat + batRadius)){
     ybat = yEnemy;
     fill(255, 0, 0);
     score = score + 1 ;
   }   
 }

//-------------------timer----------
void milli(){
  int m = millis() - restartTimer;
  text(m/1000, width/2, 50);
  if(m > timer){
    scene = 3;
    restartTimer = millis();    
  }
} 

void keyPressed(){
  if(key == '1'){
    scene = 1;
    if(gameOver == true){
      lives = 3;
      score = 0;
      gameOver = false;
      loop(); 
    }
  }
  else if(key == '2'){    
    scene = 2;
    //flashlight();
    //wingsSound.loop();
    if(gameOver == true){
      //wingsSound.stop();
      lives = 3;
      score = 0;
      gameOver = false;
      loop();     
    }
  }
}
