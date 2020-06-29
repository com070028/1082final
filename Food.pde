class Food{

  float x,y,w,h;
  float speed=10;
  boolean isAlive =true;
  boolean takeFood = false;
  boolean takeingFood = false;
  int foodNum;
  PImage [] images;
  final int FOODS_NUM =8;
  
  // Constructor
  Food(){
    this.x =x;
    this.y =y; // problem: thisX and Y are not the actually position of the array
    w = GRID;
    h = GRID;
    
    images = new PImage [FOODS_NUM];
    
    for(int i=0; i<images.length; i++){
      images[i] = loadImage("img/foodA" + i + ".png");
    }
    
    
  }
  
  void display(){

    if(isAlive == true){
      for(int i=0; i< 4; i++){
        image (images[i], GRID*i, GRID, w, h);
      }
      for(int i=4; i<8; i++){
        image (images[i], GRID*(i+10), GRID, w, h);
      }
    }
    
  }
    
  void move() {
    if (y>0) {
      if (upState) {
        y-=speed;
      }
    }//

    if (y<height-GRID) {
      if (downState) {
        y+=speed;
      }
    }//

    if (x<width-GRID) {
      if (rightState) {
        x+=speed;
      }
    }//

    if (x>0) {
      if (leftState) {
        x-=speed;
      }
    }//
  }//move  
    
  
  void beTaken(){

    if(takeFood == true){
    
     
      //// A1 & A5 ////
      if(food1 == true){
        food2 = false;
        food3 = false;
        food4 = false;
        foodNum=0;
        if(leftState){
          image (images[0], player.x-20, player.y, w, h);
        }else if(rightState){
          image (images[0], player.x+20, player.y, w, h);
        }else if(upState){
          image (images[0], player.x, player.y-40, w, h);
        }else{
          image (images[0], player.x, player.y, w, h);
        }
      }


      //// A2 & A6 ////
      if(food2 == true){
        food1 = false;
        food3 = false;
        food4 = false;
        foodNum=1;
        if(leftState){
          image (images[1], player.x-20, player.y, w, h);
        }else if(rightState){
          image (images[1], player.x+20, player.y, w, h);
        }else if(upState){
          image (images[1], player.x, player.y-40, w, h);
        }else{
          image (images[1], player.x, player.y, w, h);
        }
      }


      //// A3 & A7 ////
      if(food3 == true){
        food1 = false;
        food2 = false;
        food4 = false;
        foodNum=2;
        if(leftState){
          image (images[2], player.x-20, player.y, w, h);
        }else if(rightState){
          image (images[2], player.x+20, player.y, w, h);
        }else if(upState){
          image (images[2], player.x, player.y-40, w, h);
        }else{
          image (images[2], player.x, player.y, w, h);
        }
      }

      //// A4 & A8////
      if(food4 == true){
        food1 = false;
        food2 = false;
        food3 = false;
        foodNum=3;
        if(leftState){
          image (images[3], player.x-20, player.y, w, h);
        }else if(rightState){
          image (images[3], player.x+20, player.y, w, h);
        }else if(upState){
          image (images[3], player.x, player.y-40, w, h);
        }else{
          image (images[3], player.x, player.y, w, h);
        }
      }
    }
    
  }// beTaken  }
  
  
  
}
