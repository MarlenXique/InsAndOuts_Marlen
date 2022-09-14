PImage basket;
PImage apple;
PImage carrot;

float x;
float y;
float targetX;
float targetY;
float easing = .05;
float grow = 20;

float fall = 5;

int pos;

void setup(){
  size (600,600);
  imageMode(CENTER);
  //frameRate(300);
  noStroke();
  
  basket = loadImage("basket.png");
  apple = loadImage("apple.png");
  carrot = loadImage("carrot.png");

}
void draw (){
  background(50);
  basket.resize(100, 0);
  carrot.resize(75, 0);
  apple.resize(75, 0);
  
  image(basket, x, y);
  image(apple, x, y);
  image(carrot, x, y);
 
  
  float dx = targetX - x;
  float dy = targetY - y;
  
  x += dx *easing;
  y += dy *easing;
  
  println(dx * easing);
  
   image (carrot, 100, fall);
    image(apple, 300, fall);
    fall  = fall +1;
    if (fall > height){
      fall = 0;
    }
  
  if (mousePressed){
    
    targetX = mouseX;
    targetY = mouseY;
    
   
  
  }
}
