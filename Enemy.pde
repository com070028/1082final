class Enemy {
  float x, y=80;
  float xSpeed, ySpeed;
  PImage img;
  InfectArea ellipse;
  float speedTimer=240;

  Enemy (float x, float y) {
    this.x = x;
    this.y = y;
    xSpeed = random(5, 8)*random(-1,1);
    ySpeed = random(5, 8)*random(-1,1);

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
    if (x>(width-GRID)) {
      RandomSpeedPick();
      xSpeed*=random(0,2);
    }

    if (y>(height-GRID)) {
      RandomSpeedPick();
      ySpeed*=random(0,2);
    }

    if (x<0) {
      xSpeed*=-1;
    }
    if (y<GRID) {
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
        ySpeed=random(2, 5)*-1;
      }
      if (table[i].CollisionTestRight(x, y) == true)
      {


        this.x=table[i].x+2*GRID;
        ySpeed=random(2, 5)*-1;
      }
      if (table[i].CollisionTestUp(x, y) == true)
      {


        this.y=table[i].y-2*GRID-5;
        xSpeed=random(2, 5)*-1;
      }
      if (table[i].CollisionTestDown(x, y) == true)
      {


        this.y=table[i].y+10;
        xSpeed=random(2, 5)*-1;
      }
    }
  }


  void RandomSpeedPick() {
    xSpeed=random(2, 5)*-1;
    ySpeed=random(2, 5)*-1;
  }




  void display() {
    pushMatrix();
    translate(x, y);
    if (ellipse!=null) {

      for (int i=0; i<ENEMY_NUMBER; i++) {
        ellipse.moveTo(0, 0);
        ellipse.ShowOntheFeet(size);
      }//for
    }
    image(img, 0, 0, 80, 80);
    popMatrix();
  }
}
