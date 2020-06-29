class Want{
  float x,y;
  float timer;
  float timerDisappear;
  PImage foodImg0,foodImg1,foodImg2,foodImg3;
  boolean isAlive=false;
  boolean disappearing=false;
  int wantNum;
  
  Want(float x,float y){
    this.x=x;
    this.y=y;
    this.timer=120;
    this.timerDisappear=480;
    wantNum=0;
    foodImg0=loadImage ("img/want1.png");
    foodImg1=loadImage ("img/want2.png");
    foodImg2=loadImage ("img/want3.png");
    foodImg3=loadImage ("img/want4.png");

  }
  void timer(){
    timer++;
    //println(timer);
    if (timer>180){
      int pick=floor(random(30));
      timer=0;
      for(int i=0;i<6;i++){
        //println(pick);
        if (i==pick && want[i].isAlive == false&&table_food[i].isAlive==false){  //problem:table_food&want show both
          wantNum=floor(random(0,4));
          want[i].isAlive = true;
          want[i].disappearing = true;
          
          //continue;
        }  
      }
    }
  }
  void display(){
      if (wantNum==0){
        image(foodImg0,x,y,GRID,GRID);
      }
      if (wantNum==1){
        image(foodImg1,x,y,GRID,GRID);
      }
      if (wantNum==2){
        image(foodImg2,x,y,GRID,GRID);
      }
      if (wantNum==3){
        image(foodImg3,x,y,GRID,GRID);
      }
      
  }
}
