const int SENSOR = A0; //sensor hooked up to analog pin A0
const int BUTTON = 7;

const int LED1 = 11;
const int LED2 = 10;
const int LED3 = 9;
const int LED4 = 6;

int sensor_val = 0;
int button_val = 0;

void setup() {
  pinMode (SENSOR, INPUT);
  pinMode (LED1, OUTPUT);
  pinMode (LED2, OUTPUT);
  pinMode (LED3, OUTPUT);
  pinMode (LED4, OUTPUT);
  pinMode (BUTTON, INPUT_PULLUP);
  Serial.begin(9600); // Start serial communication at 9600 baud
}

void loop() {
  sensor_val = analogRead(SENSOR); //read sensor and assign to variable called val
  button_val = digitalRead(BUTTON);
  analogWrite(LED1, sensor_val/4);
  analogWrite(LED2, sensor_val/4);
  analogWrite(LED3, sensor_val/4);
  analogWrite(LED4, sensor_val/4);

  Serial.print('H'); // unique header to identify start of message
  Serial.print(",");
  Serial.print(sensor_val,DEC);
  Serial.print(",");
  Serial.print(button_val,DEC);
  Serial.print(",");  // note that a comma is sent after the last field
  Serial.println();  // send a cr/lf

  delay(30); // Wait 100 milliseconds
}