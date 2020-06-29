class Player {
  float x, y;
  float speed=10;
  PImage img;
  int currentSkillType = none ;
  InfectArea ellipse;
  int skillTimer;
  float currentPlayerHealth;


  Player (float x, float y) {
    this.x = x;
    this.y = y;
    img =playerFrontImg;
    skillTimer=0;
  }//player constructor
  
  
  void move() {

      if(x>=0){
        
       if(currentSkillType==0){
       img=playerFrontImg;
       }else if(currentSkillType==1){
       img=playerFrontMaskImg;
       }else if(currentSkillType==2){
       img=playerFrontGoggleImg;
       }
        
        
      if (upState) {
        
        if(y>GRID){
        img=playerBackImg;
        y-=speed;
        
        if(currentSkillType==1){
        img=playerBackMaskImg;
        
        }else if(currentSkillType==2){
        img=playerBackGoggleImg;
        }//else if 
        }
      }else if (rightState) {
        if (x<width-GRID) {
        img=playerRightImg;
        x+=speed;
                if(currentSkillType==1){
        img=playerRightMaskImg;
        
        }else if(currentSkillType==2){
        img=playerRightGoggleImg;
        }//else if 
      }
    }else if (leftState) {
            if (x>0) {
        img=playerLeftImg;
        x-=speed;
        
                if(currentSkillType==1){
        img=playerLeftMaskImg;
        
        }else if(currentSkillType==2){
        img=playerLeftGoggleImg;
        }//else if 
      }
    }else if (downState) {
           if (y<height-GRID) {
        img=playerFrontImg;
        y+=speed;
                if(currentSkillType==1){
        img=playerFrontMaskImg;
        
        }else if(currentSkillType==2){
        img=playerFrontGoggleImg;
        }//else if 
        
          }
        }//
    
      }

    
  }//move
  
  

  void detectCollision(Enemy[] enemy) {
    for (int i = 0; i < ENEMY_NUMBER; i++)
    {
      // detect AABB collision for each object.

      if (enemy[i].CollisionTest(x, y) == true)
      {
        enemy[i].OnCollision();
      }
    }
  }//detectCollision
  
      void detectSuperEnemyCollision(SuperEnemy[] superEnemy) {
    for (int i = 0; i < SUPERENEMY_NUMBER; i++)
    {
      // detect AABB collision for each object.

      if (superEnemy[i].CollisionTest(x, y) == true)
      {
        superEnemy[i].OnCollision();
      }
    }
  }//detectCollision
  
  void detectCollision(Table[] table) {
    for (int i = 0; i < TABLE_COUNT; i++)
    {
      // detect AABB collision for each object.

      if (table[i].CollisionTestLeft(x, y) == true)
      {
        rightState=false;//problem:jump to first table
        //println("leftwall");
        this.x=table[i].x-GRID; //player position
        if (foods[0].takeFood == true && table_food[i].isAlive==false && want[i].isAlive == true){
          table_food[i].foodNum = foods[0].foodNum;
          table_food[i].isAlive = true;
          foods[0].takeFood = false;
          food1 = false;
          food2=false;
          food3=false;
          food4=false;
          want[i].isAlive=false;
          if (want[i].wantNum == table_food[i].foodNum){
            customerSatisfy ++;
            rightFoodMusic.play();
            rightFoodMusic.rewind();
            
          }else{
            customerSatisfy --;
            wrongFoodMusic.play();
            wrongFoodMusic.rewind();
          }
          println(customerSatisfy);
          println(want[i].wantNum);
          println(table_food[i].foodNum);
        }
      }
      if (table[i].CollisionTestRight(x, y) == true)
      {
        leftState=false;//problem:jump to first table
        //println("rightwall");
        this.x=table[i].x+2*GRID;
        if (foods[0].takeFood == true&&table_food[i].isAlive==false&& want[i].isAlive == true){
          table_food[i].foodNum=foods[0].foodNum;
          table_food[i].isAlive = true;
          foods[0].takeFood = false;
          food1 = false;
          food2=false;
          food3=false;
          food4=false;
          want[i].isAlive=false;
          if (want[i].wantNum == table_food[i].foodNum){
            customerSatisfy ++;
            rightFoodMusic.play();
            rightFoodMusic.rewind();
          }else{
            customerSatisfy --;
            wrongFoodMusic.play();
            wrongFoodMusic.rewind();
          }
        }        
      }
      if (table[i].CollisionTestUp(x, y) == true)
      {
        upState=false;//problem:jump to first table
        //println("upwall");
        this.y=table[i].y-2*GRID-5;        
      }
      if (table[i].CollisionTestDown(x, y) == true)
      {
        downState=false;//problem:jump to first table
        //println("downwall");
        this.y=table[i].y+10;
        if (foods[0].takeFood == true&&table_food[i].isAlive==false&& want[i].isAlive == true){
          table_food[i].foodNum=foods[0].foodNum;
          table_food[i].isAlive = true;
          foods[0].takeFood = false;
          food1 = false;
          food2=false;
          food3=false;
          food4=false;
          want[i].isAlive=false;
          if (want[i].wantNum == table_food[i].foodNum){
            customerSatisfy ++;
            rightFoodMusic.play();
            rightFoodMusic.rewind();
          }else{
            customerSatisfy --;
            wrongFoodMusic.play();
            wrongFoodMusic.rewind();
          }
        }        
      }
    }
  }



  void display() {
    pushMatrix();
    translate(x, y);

    image(img, 0, 0,GRID,GRID);
    popMatrix();
  }//display


  void skill() {
    switch(currentSkillType) {
    case none:
        size=GRID*6/4;
      break;

    case eyeProtect:    
      skillTimer--;
      if (skillTimer>0) {
        //do the effect
          size=GRID*2/4;

      } else {
        currentSkillType=none;
      }

      break;

    case maskProtect:   
      skillTimer--;

      if (skillTimer>0) {
        //do the effect


          size=GRID*0;  

      } else {
        currentSkillType=none;
      }

      break;

    case sterilization:   
    
       
       if (playerHealth>1) {
          playerHealth--;
         
        if(playerHealth==currentPlayerHealth-10){
        currentSkillType=none;
        }
      } 

      break;
    }//switch
  }



  void setSkillType(int type) {
    currentSkillType = type;

    if (type==1) {
      skillTimer=180;
    } else if (type==2) {
      skillTimer=90;
    } else if (type==3) {
      currentPlayerHealth=playerHealth;
    }
  }
  
  
}//player class
