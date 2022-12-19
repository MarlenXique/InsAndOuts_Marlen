int led1 = 13;
int led2 = 12;
int led3 = 11;
int sensor = A0;
int sensorOutput;   

// const int buzzer  = 3;

void setup() {
  Serial.begin(9600);
  pinMode(led1, OUTPUT);
  pinMode(led2, OUTPUT);
  pinMode(led2, OUTPUT);
  Serial.begin(9600);
}

void loop() {

  sensorOutput= analogRead(sensor);
  int mappedOutput = map(sensorOutput, 0, 1023, 0, 255);

  Serial.println(mappedOutput);
  if(Serial.available() > 0){
    char state = Serial.read();
    if(state == '1'){
      digitalWrite(led1, HIGH);
      digitalWrite(led2, HIGH);
      digitalWrite(led3, HIGH);
    }
    if(state == '0'){
      digitalWrite(led1, LOW);
      digitalWrite(led2, LOW);
      digitalWrite(led3, LOW);

    }
  }
}