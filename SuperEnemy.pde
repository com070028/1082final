class SuperEnemy {
  float x, y=80;
  float xSpeed,ySpeed;
  PImage img;
  InfectArea ellipse;

  SuperEnemy (float x, float y) {
    this.x = x;
    this.y = y;
    xSpeed = random(10, 12);
    ySpeed = random(10, 12);

    ellipse=new InfectArea();
  }


  boolean CollisionTest(float x, float y) {

    return dist(x, y, this.x, this.y) <= size ? true : false;
  }//isHit



  void OnCollision() {
    
    playerHealth+=0.3;
    hurtMusic();
    
  }
  
  
  void hurtMusic(){
    if(hurtMusic.isPlaying()==false){
    hurtMusic.play();
    hurtMusic.rewind();
    }
    
  }



  void move() {
      x+=xSpeed;
      y+=ySpeed;  
            
         //boundary detection  
      if (x>(width-GRID)||y>(height-GRID)) {
      RandomSpeedPick();
    }
    
    if(x<0||y<GRID){
        xSpeed*=-1;
        ySpeed*=-1;
    }

 
  }
  
  
void detectCollision(Table[] table) {
    for (int i = 0; i < TABLE_COUNT; i++)
    {
      // detect AABB collision for each object.

      if (table[i].CollisionTestLeft(x, y) == true)
      {
        
      
        this.x=table[i].x-GRID;

      }
      if (table[i].CollisionTestRight(x, y) == true)
      {
       
    
        this.x=table[i].x+2*GRID;
      }
      if (table[i].CollisionTestUp(x, y) == true)
      {
        
      
        this.y=table[i].y-2*GRID-5;
      }
      if (table[i].CollisionTestDown(x, y) == true)
      {
       
    
        this.y=table[i].y+10;
      }
    }
  }


void RandomSpeedPick() {
  xSpeed=random(2,5)*-1;
  ySpeed=random(2,5)*-1;
  }

  
  
  
  void display() {
    pushMatrix();
    translate(x, y);
    if (ellipse!=null) {

      for (int i=0; i<ENEMY_NUMBER; i++) {
        ellipse.moveTo(0, 0);
        ellipse.ShowOntheFeet(size*2);
      }//for
    }
    image(img, 0, 0, 80, 80);
    popMatrix();
  }
}
