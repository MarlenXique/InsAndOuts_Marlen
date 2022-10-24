//-------backgound hills, bushes, clouds-------
void backgroundFeatures(){
  image(cloud1, cloudRespawn,  100);
  image(cloud2, cloudRespawn +100, 200);
 for(int i = 15; i < 1440; i +=300){
  image(hill, i, height/2 + 65);
  image(bush, i + 100, height/2 + 80);  
  }
  cloudRespawn = cloudRespawn + 1.5;
  if (cloudRespawn >width + 100){
    cloudRespawn = 0 - 200;
   } 
}

//------------enemy: turtle --------------
void  Enemy(){
  float dx = xPlayer - xEnemy;
  xEnemy += dx * easing;
  
}

//-----------shell-------------

void Shell(){  
  image(shell, xShell, yShell);
    xShell = xEnemy;
    yShell  = yShell + shellSpeed;
  
    if (yShell > height-230){
      yShell = yEnemy;
      
   } 
 }


//---------player----------

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

//if shell collides with mario
 void Overlap(){
   if((xShell > xPlayer && xShell < xPlayer + playerRadius || xPlayer > xShell && xPlayer < xShell + shellRadius) && (yShell > yPlayer && yShell < yPlayer + playerRadius || yPlayer > yShell && yPlayer < yShell + shellRadius)){
     yShell= yEnemy;
     lives = lives - 1 ; 
      
      if (lives == 0){
        fill(#82e729);
        stroke(#0d803e);
        strokeWeight(10);
        rect(width/2 - 180, 50, 300, 100);
        
        textSize(30);
        fill(255);
        text(gameOverText, width/2 - 170, 50, 300, 300);
        noLoop();
        gameOver = true;  
       }
   }
 }
 

   
