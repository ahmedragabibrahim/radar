import processing.serial.*;
Serial myport;
float pixsDistance;
PImage plane;
int d=0;
int first=0;
int second=0;
int[] sArray=new int[2];
void setup()
{
   size (900, 700);
  myport=new Serial(this,"COM3",9600);
  
  background(0);
   plane =loadImage("download.jpg");
}
void draw()
{
  radardraw();
   // drawObject();
   
}
void serialEvent(Serial myport)
{
  sArray[d] =myport.read();
 d++;
  if (d>1)
  {
    first=sArray[0];
    second=sArray[1];
    d=0;
    println(mouseX + "\t" +mouseY);
   
   
  }
  // println(first + "/t" +second);
}
void radardraw()
{
   translate(width/2,height); 
  fill(0);
 strokeWeight(1);
  stroke(0,255,0);
  rect(-700,-700,700,700);
   arc(0,0,(width),(width),PI,TWO_PI);
  arc(0,0,(width-width*0.003),(width-width*0.003),PI,TWO_PI);
  arc(0,0,(width-width*0.0625),(width-width*0.0625),PI,TWO_PI);
  arc(0,0,(width-width*0.27),(width-width*0.27),PI,TWO_PI);
  arc(0,0,(width-width*0.479),(width-width*0.479),PI,TWO_PI);
  arc(0,0,(width-width*0.687),(width-width*0.687),PI,TWO_PI);
  
  line(0,0,-692.82,-400);
  line(0,0,692.82,-400);
  line(0,0,-230.94,-400);
   line(0,0,230.94,-400);
   line(0,0,0,-430);
   fill(255,255,0);
    textSize(15);
   text("10cm",80,-100);
  text("20cm",147,-170);
  text("30cm",224,-232);
  text("40cm",278,-306);
   text("30 degree",369,-194);
  text("60 degree ",206,-427);
  text("90 degree",-66,-457);
   text("120 degree ",-282,-396);
  text("150 degree",-449,-251);
  stroke(255,0,0);
  for(int o=second;o>second-20;--o)
  {
    strokeWeight(1);
    stroke(0,255,0);
   line(0,0,(200*cos(radians(o))),-(400*sin(radians(o))));
   
   if (first<21)
  {
  float r=map(first,0,20,0,300);
    stroke(255,0,0);
    strokeWeight(4);
   //image(plane,r*cos(radians(o)),-r*sin(radians(o)));
   line(r*cos(radians(o)),-r*sin(radians(o)),((r+150)*cos(radians(o))),-((r+150)*sin(radians(o))));
   textSize(30);
   fill(255,0,0);
   text("Enemy is close ",-400,-500);
     }

 
    
  }
}
void drawObject() {
  
  pushMatrix();
  translate(960,1000); // moves the starting coordinats to new location
  strokeWeight(10);
  stroke(255,10,10); // red color
  pixsDistance = first*22.5; // covers the distance from the sensor from cm to pixels
  // limiting the range to 40 cms
  if(first<40){
    // draws the object according to the angle and the distance
  line(pixsDistance*cos(radians(second)),-pixsDistance*sin(radians(second)),950*cos(radians(second)),-950*sin(radians(second)));
  }
  popMatrix();
}