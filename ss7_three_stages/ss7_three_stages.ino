//SS7
const int buttonPin = 2;
const int LED1 = 10;//pwm
const int LED2 = 11; //pwm
const int LED3 = 6;
const int LED4 = 5;

int LEDState = 0;
int buttonState = HIGH; //HIGH is not pressed, and LOW is pressed
int lastButtonState = HIGH; 

unsigned long previousMillis = 0;
int numStates = 3;

const unsigned long interval = 500;
const unsigned long interval2 = 200;

const int fadeInterval = 50;
int fadeCounter = 0;
bool blinkState = false;

void setup() {
  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);
  pinMode(LED3, OUTPUT);
  pinMode(LED4, OUTPUT);
  pinMode(buttonPin, INPUT_PULLUP);
}

void loop() {
  unsigned long currentMillis = millis();

  checkButton();

  if(LEDState == 1){
    if(currentMillis - previousMillis >= interval){
      previousMillis = currentMillis;

      if(blinkState == true){
        digitalWrite(LED1, LOW);
        digitalWrite(LED2, LOW);
        digitalWrite(LED3, LOW);
        digitalWrite(LED4, LOW);
      }
      else{
        digitalWrite(LED1, HIGH);
        digitalWrite(LED2, HIGH);
        digitalWrite(LED3, HIGH);
        digitalWrite(LED4, HIGH);

      }
      blinkState = !blinkState;
    }//blinking faster
  } else if(LEDState == 2){
    if(currentMillis - previousMillis >= interval2){
      previousMillis = currentMillis;

      if(blinkState == true){
        digitalWrite(LED1, LOW);
        digitalWrite(LED2, LOW);
        digitalWrite(LED3, LOW);
        digitalWrite(LED4, LOW);
      }
      else{
        digitalWrite(LED1, HIGH);
        digitalWrite(LED2, HIGH);
        digitalWrite(LED3, HIGH);
        digitalWrite(LED4, HIGH);
      }
      blinkState = !blinkState;
    }//fade state 3
  } else if(LEDState == 3){
    if(currentMillis - previousMillis >= fadeInterval){
      previousMillis = currentMillis;

      analogWrite(LED1, fadeCounter);
      analogWrite(LED2, fadeCounter);
      analogWrite(LED3, fadeCounter);
      analogWrite(LED4, fadeCounter);
      if(blinkState == LOW){
        fadeCounter += 5;
        if(fadeCounter >= 255){
          blinkState = HIGH;
        }
      } else {
        fadeCounter -= 5;
        if(fadeCounter <= 0){
          blinkState = LOW;
        }
      }
    }
  } else{
    digitalWrite(LED1, LOW);
    digitalWrite(LED2, LOW);
    digitalWrite(LED3, LOW);
    digitalWrite(LED4, LOW);
    blinkState = false;
  }
}


void checkButton(){
  buttonState = digitalRead(buttonPin);
  delay(10);

  if(buttonState == LOW && lastButtonState == HIGH){
    LEDState++;
    if(LEDState > numStates){
      LEDState = 0;
    }
  }
  else {
  }

  lastButtonState = buttonState;
}