PImage bg1,bg2,treasure,hp,fighter,enemy,end1,end2,start1,start2,enemy1,bomb;//image imort 
int bg1x = 640;
int bg2x= 0;
int x = 0;
int ex1 = -2000;
int ey1 = floor(random(450));
float tx = random(50,600);
float ty = random(50,400);
final int COUNT = 3;
float spacingX = width/COUNT+20;
float spacingY = height/COUNT+10;
int tmp = 0;
void setup() {
  size(641, 482);
  bg1 = loadImage("img/bg1.png");
  treasure = loadImage("img/treasure.png");
  hp = loadImage("img/hp.png");
  fighter = loadImage("img/fighter.png");
  enemy = loadImage("img/enemy.png");
  bg2 = loadImage("img/bg2.png");
  start1 = loadImage("img/start1.png");
  start2 = loadImage("img/start2.png");
  end1 = loadImage("img/end1.png");
  end2 = loadImage("img/end2.png");
  smooth();
  frameRate(120);  
}
boolean changeTmp = false;
boolean tmp2 = false;
void mousePressed(){
 if(!changeTmp){
   if(mouseX > 200 && mouseX <= 430){
   if(mouseY > 380 && mouseY < 420 ){
   changeTmp = true;
     tmp2 = !tmp2;  
   }
 }}else if(changeTmp){
   if(mouseX > 200 && mouseX <= 430){
   if(mouseY > 300 && mouseY < 340 ){
   tmp2 = !tmp2;  
   changeTmp = false;}
 }}
 }
 boolean isPlaying = false;
 int count = 0;
 boolean changeStart = false;
 void draw(){
  background(bg1);//bg
   image(start1, 0, 0); //start initial
   count ++;//framecount
   if(tmp2){//count press time and initial start2
     if(count%30==0 && changeStart==false){ //start game with norepeat
      isPlaying = true;
      
     }else if(!changeStart){
      image(start2,0,0);           
     }else if(changeStart){
     image(end1, 0, 0);}
   }else if(changeStart){
   
   if(count%30==0){
     isPlaying = true;
     }else{
     image(end2,0,0);
     //c=38;
     tmp2=false;
     changeStart=false;
     
     }
   }
   if (isPlaying) {//game start
   background(0);
  image(bg1,bg1x-640, 0);//bg1
  image(bg2,bg2x-640, 0);//bg2
      bg1x++;
      bg2x++;
      bg1x%=1280;
      bg2x%=1280;
      x+=2;
      ex1+=6;
      if(ex1>640){
      ex1=-2300;
      ey1=floor(random(450));
      }
    float x = 0,y1 = 0,y2 = height+spacingY;
  for(int i = 0;i<5;i++){
    image(enemy,1760+ex1+80*i,ey1);  
    image(enemy,800+ex1+50*i,50+40*i);
}
  for(int i = 0;i<COUNT;i++){
    x = i*spacingX;
    image(enemy,100+ex1+x,y1+150);
    y1+=spacingY;
    image(enemy,ex1+x,y1+215);
}
 image(enemy,ex1+40,193);
 image(enemy,ex1+163,297);
  image(fighter,580,320 );//fighter location
  stroke(250, 3, 3);//blood
  strokeWeight(18);
  line(58, 38, 160, 38);//blood line
  image(hp, 50, 25);//initial hp
  image(treasure,tx,ty);//initial treasure
   }   
}
  
  
