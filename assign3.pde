PImage bg1,bg2,treasure,hp,fighter,enemy,end1,end2,start1,start2,enemy1,bomb;//image imort 
int x = 0;
int y = 0;
int z = -640;
int more = 5;
int c = 38;
int t = floor(random(600));
int s = floor(random(480));
boolean isPlaying = false;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
float speed = 5;
float fx = 500;
float fy = 240;
int cc = 0;
int cs = 0;
int tmp =0;
int bg1x = 640;
int bg2x = 0;
boolean tmp2 = false; 
int count = 0;
float eyfinal;
int changetmp = 0;
int ex = 0;
int ey ;
boolean changeTreasurePlace = false;
boolean changeEnemyPlace = false;
boolean changeStart = false;
float fytmp = 0;
int eyPro = 0;
int exPro = 0;
boolean changeTmp = false;
void setup() {
  size(641, 482);
  bg1 = loadImage("img/bg1.png");
  treasure = loadImage("img/treasure.png");
  hp = loadImage("img/hp.png");
  fighter = loadImage("img/fighter.png");
  enemy = loadImage("img/enemy.png");
  bg2 = loadImage("img/bg2.png");
  enemy1 = loadImage("img/Moocs-element-enemy1.png");
  bomb = loadImage("img/Moocs-element-gainbomb.png");
  start1 = loadImage("img/start1.png");
  start2 = loadImage("img/start2.png");
  end1 = loadImage("img/end1.png");
  end2 = loadImage("img/end2.png");
  smooth();
  isPlaying = false;
  frameRate(120);
}

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
 
 void draw() {
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
     c=38;
     tmp2=false;
     changeStart=false;
     
     }
   }
   if (isPlaying) {//game start
     background(0);//bg0
     image(bg1,bg1x-640, 0);//initial bg1
     image(bg2,bg2x-640, 0);//initial bg2
      bg1x+=2;//bg1 Xspeed
      bg2x+=2;//bg2 Xspeed
      bg1x%=1280;// if bg1 to 1280,it will go back 0;
      bg2x%=1280;// like bg2;
      if(count%1200000==0){
        more+=1;
      }
      
      ex+=more;//enemy speed
      ex%= 640; //enemy location

     image(enemy,ex,ey);
     
     if(fy>ey){
       ey+=1; 
     }else{
       ey-=1;
     }
     
     
     
     if(ex==640){//enemy border
     updateEnemy();
            //changetmp++;
        if(changeEnemyPlace){
            ex=0;//intial x
            //ex=0;
            ey=floor(random(430));
            changeEnemyPlace = false;
            }
     }
     
     image(fighter, fx, fy);//fighter location
     stroke(250, 3, 3);//blood
     strokeWeight(18);
     line(58, 38, 58 + c, 38);//blood line
     image(hp, 50, 25);//initial hp
     image(treasure, t, s);//initial treasure
     pressSetting();
     border();  
     if (fx <= ex+50 && fx > ex-50) {
       if (fy <= ey + 50 && fy >= ey-50) {
            updateEnemy();
            if(changeEnemyPlace){
           // x=0;//intial x
            ex=0;
            ey=floor(random(430));
            changeEnemyPlace = false;
            }
             c-=38;
    
     }
     }

     if(t-50 <fx && fx <= t+45){
       if(s-50 < fy && fy<=s+50 ){
         updateTreasure();
         if(changeTreasurePlace){
           s=floor(random(430));
           t=floor(random(600));
           changeTreasurePlace=false;
         }
         c+=19;
       }
     }
     if (c <= 0) {
         c = 0;
        isPlaying =false;
        fx = 500;
        fy = 240;
        changeStart = true; 
     
   }
       
      if(c>=190){
        c=190;
      }
     }

   }
  
  
  void border(){
  if (fx >= 600) {//橫向範圍設定
       fx = 600;
     }
     if (fx <= 0) {
       fx = 0;
     }
     if (fy >= 440){//直向範圍設定
       fy = 440;
     }
     if (fy <= -0) {
       fy = 0;
     }if (fx >= 600) {//橫向範圍設定
       fx = 600;
     }
     if (fx <= 0) {
       fx = 0;
     }
     if (fy >= 440){//直向範圍設定
       fy = 440;
     }
     if (fy <= -0) {
       fy = 0;
     }
  }
  void  pressSetting(){
  if (upPressed) {//按件判別
       fy -= speed;
     }
     if (downPressed) {
       fy += speed;
     }
     if (leftPressed) {
       fx -= speed;
     }
     if (rightPressed) {
       fx += speed;
     }
  }
  void keyPressed() {
   // loop();
  // isPlaying = true;
   
   if (key == CODED) {
     switch (keyCode) {
     case UP:
       upPressed = true;
       break;
     case DOWN:
       downPressed = true;
       break;
     case LEFT:
       leftPressed = true;
       break;
     case RIGHT:
       rightPressed = true;
       break;
     }
   }
  }

  void keyReleased() {
    
   if (key == CODED) {
     switch (keyCode) {
     case UP:
       upPressed = false;
       break;
     case DOWN:
       downPressed = false;
       break;
     case LEFT:
       leftPressed = false;
       break;
     case RIGHT:
       rightPressed = false;
       break;
     }
   }
  }
  
  void updateTreasure(){
     changeTreasurePlace = true;
    
}
  
  void updateEnemy(){
    changeEnemyPlace = true;
  }
