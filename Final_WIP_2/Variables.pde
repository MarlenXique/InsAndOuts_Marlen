import processing.sound.*;
import processing.serial.*;

Serial myPort;
SoundFile wingsSound;
SoundFile running;

PImage[] run = new PImage [2];
PImage player_run0;
PImage player_run1;
PImage cloud1;
PImage cloud2;
PImage tree;
PImage bush;
PImage bat;

float xbat;
float ybat = 100;
float xEnemy;
float yEnemy = 0;
float easing = 0.05;
float cloudRespawn;

float dirX;
float dirY;

int player = 0;
int xPlayer = 500;
int yPlayer = height/2 +400;
int playerSpeed = 5;
int direction;
int pos;
int batRadius = 50;
int batSpeed = 4;
int playerRadius = 75;
int scene = 1;                 
int lives= 3;
int val1 = 0; //pot


boolean gameOver = false;

String gameOverText= "Click 2 to restart or 1 to go back to instructions";
String title= "BOO!";
String start = "How to play: Move the Player around using arrow keys and run away from bats. You have 3 lives, everytime you get hit by a bat- you lose a life. Press 2 to continue";
