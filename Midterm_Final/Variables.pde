PImage[] run = new PImage [2];
PImage player_run0;
PImage player_run1;
PImage cloud1;
PImage cloud2;
PImage hill;
PImage bush;
PImage enemy;
PImage shell;

float xShell;
float yShell = 100;
float xEnemy;
float yEnemy = 100;
float easing = 0.05;
float cloudRespawn;

int player = 0;
int xPlayer = 500;
int yPlayer = height/2 +400;
int playerSpeed = 5;
int pos;
int shellRadius = 50;
int shellSpeed = 5;
int playerRadius = 75;
int scene = 1;                 
int lives= 5;

boolean gameOver = false;

String gameOverText= "Click 2 to restart or 1 to go back to instructions";
String title= "Dangerous Shells";
String start = "How to play: Move Mario around using arrow keys and run away from shells. You have 5 lives, everytime you get hit by a shell- you lose a life. Press 2 to continue";
