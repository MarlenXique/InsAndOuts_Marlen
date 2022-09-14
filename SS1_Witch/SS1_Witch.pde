//Witch by Marlen Xique
void setup(){
size(1080, 720);
background (#916FAF);
}

void draw(){
  
background (#916FAF);

//body
fill(#525E47);
strokeWeight(6);
stroke(#000000);
triangle (575, 500, 500, 500, 540, 360);

//head
fill(#D9B681);
strokeWeight(6);
stroke(#000000);
ellipse(540, 360, 50, 65);

//hat line
strokeWeight(15);
stroke(#000000);
line(505, 325, 575, 325);

//hat top
fill(#343131);
strokeWeight(6);
triangle (555, 315, 525, 315, 540, 280);

//legs
fill(#D9B681);
strokeWeight(6);
stroke(#000000);
rect(525, 500, 30, 50);

//leg separator
strokeWeight(5);
stroke(#000000);
line(540, 500, 540, 550);

//shoes
strokeWeight(15);
stroke(#000000);
line(510, 550, 570, 550);

//hand
fill(#D9B681);
strokeWeight(6);
stroke(#000000);
ellipse(520, 435, 25, 25);

//wand
strokeWeight(4);
stroke(#000000);
line(510, 400, 520, 435);

//glow
strokeWeight(6);
stroke(#FCC747);
line(510, 400, mouseX, mouseY);
}
