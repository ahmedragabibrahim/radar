int eco=9;
int trger=10;

#include <Servo.h>
Servo S1;

void setup() {
 Serial.begin(9600);
  pinMode(eco,INPUT);
  pinMode(trger,OUTPUT);
   pinMode(12,OUTPUT);
  // put your setup code here, to run once:
S1.attach(13);



}

void loop() {
  int d;
  
 for(int i=0;i<180;i+=7)
 {
    S1.write(i);
    delay(50);
  d=altra();

Serial.write(d);
Serial.write(i);
 }
  for(int i=180;i>0;i-=7)
 {
    S1.write(i);
    delay(50);
 d=altra();

Serial.write(d);
Serial.write(i);
 }

  // put your main code here, to run repeatedly:

}
int altra()
{int long k;
int d;
  digitalWrite(trger,LOW);
  delayMicroseconds(2);
  digitalWrite(trger,HIGH);
  delayMicroseconds(10);
  digitalWrite(trger,LOW);
  k=pulseIn(eco,HIGH);
  d=k*0.034/2;
  if(d<20)
  {
    digitalWrite(12,HIGH);
    delay(100);
    digitalWrite(12,LOW);
  }
  return (d);


}


