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
   if((xbat > xPlayer && xbat < xPlayer + playerRadius || xPlayer > xbat && xPlayer < xbat + batRadius) && (ybat > yPlayer && ybat < yPlayer + playerRadius || yPlayer > ybat && yPlayer < ybat + batRadius)){
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
 }


//----------------processing serial-----
void checkingPort(){
  String[] portList = Serial.list();
  printArray(portList);
  String portName = Serial.list()[2];
  myPort = new Serial(this, portName, 9600);
  
}
   
 
   
 //-----------flashlight--------
 void flashlight(){
  // dirX = (mouseX / width - 0.5) * 2;
  // dirY = (mouseY / height - 0.5) * 2;
  
  //directionalLight(250, 250, 250, -dirX, -dirY, -1);
  
  //noStroke();
  //sphere(40);
}
 
 

   
