byte val;
const int LED1 = 13;
const int LED2 = 12;
const int LED3 = 11;
const int PIEZO  = 10; //piezo
const int SENSOR  = A0; //potentiometer

int sensorVal = 0;
int piezoVal = 0;
int ledVal = 0;

void setup() {
  
  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);
  pinMode(LED3, OUTPUT);
  //pinMode(PIEZO, I);
  pinMode(SENSOR, INPUT);
  Serial.begin(9600);
}

void loop() {
  sensorVal = analogRead(SENSOR); //read sensor and assign to variable called val
  sensorVal = sensorVal/4;

  //piezoVal = digitalRead(PIEZO);
  
  delay(50);

  Serial.write(sensorVal);
  }

