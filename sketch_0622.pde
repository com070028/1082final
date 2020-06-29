PImage backgroundImg, superEnemyImg, virusImg, tableImg, clockImg, chairImg, eyeProtectImg, maskProtectImg, dispenserImg, satisfyImg;
PImage foodA1, foodA2, foodA3, foodA4, foodB1, foodB2, foodB3, foodB4;
PImage playerFrontImg, playerBackImg, playerLeftImg, playerRightImg;
PImage playerFrontMaskImg, playerBackMaskImg, playerLeftMaskImg, playerRightMaskImg;
PImage playerFrontGoggleImg, playerBackGoggleImg, playerLeftGoggleImg, playerRightGoggleImg;
PImage barLeft, barRight, gameStart, gameWin, gameOver, gameOver2, startButton1, startButton2, overButton1, overButton2, winButton1, winButton2;
PImage page1, page2, page3, next1, next2, go1, go2;
PImage [] customerImg;
PImage redGradient;
PFont font;

import ddf.minim.*;
import ddf.minim.effects.*;

//position
final int GRID_COL_COUNT = 18;
final int GRID_ROW_COUNT = 12;
final int GRID = 80;
final int BUTTON_W = 270;
final int BUTTON_H = 90;

//skillstate

final int none = 0;
final int eyeProtect = 1;
final int maskProtect = 2;
final int sterilization = 3;
int currentSkillType ;
boolean bulletHit =false;

//switch
final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2, GAME_WIN = 3, GAME_OVER2 = 4;
final int PAGE_1 =5, PAGE_2 =6, PAGE_3 =7;
int gameState = 0; 

//clock    
float TIMER_POSITIONX=11.25*GRID;
float TIMER_POSITIONY=0.75*GRID;

final int GAME_INIT_TIMER=7200;
int gameTimer = GAME_INIT_TIMER;

//player
Player player;
float playerX, playerY;
int playerCol, playerRow;
final float PLAYER_INIT_X = 200;
final float PLAYER_INIT_Y = 200;


//move state
boolean leftState = false;
boolean rightState = false;
boolean downState = false;
boolean upState = false;


//enemy
final int ENEMY_NUMBER = 4;
final int SUPERENEMY_NUMBER = 2;
final int TOTALENEMY_NUMBER =6;
Enemy enemy[];
SuperEnemy superEnemy[];
float enemyX ;
float enemyY  ;
int hitEnemy;

// Food various
boolean food1 = false; //rice with egg
boolean food2 = false; // ramen
boolean food3 = false; // steak
boolean food4 = false; // Bao Zi


//health UI
Health healthUI;
float playerHealth;
final float PLAYER_MAX_HEALTH = 100;

// Costumer Satisfy
Satisfy satisfy;
float customerSatisfy =5;
final float CUSTOMER_MAX_SATISFY = 10;
final float ORIGIN_SATISFY = 5;

//A: table&chair
final int TABLE_COUNT=6;
final int CHAIR_COUNT=6;
float barX, barY;

Table table[];
Chair chair[];
Bar bar;



//skillUi
SkillUi skillUi;
int timer =301;
boolean timerOpen=true;

//infectsize
float size;


// Foods
Food foods[];
Want want[];
Table_Food table_food[];


//music


Minim minim; // object
AudioPlayer startMusic;
AudioPlayer backgroundMusic;
AudioPlayer buttonMusic;
AudioPlayer getFoodMusic;
AudioPlayer heartBeatMusic;
AudioPlayer hurtMusic;


AudioPlayer rightFoodMusic;
AudioPlayer wrongFoodMusic;

AudioPlayer loseMusic;
AudioPlayer winMusic;


void setup() {
  frameRate(60);

  //music
  minim = new Minim(this);  //minim= a kind of Minim 
  startMusic = minim.loadFile("start.mp3", 2048);
  buttonMusic = minim.loadFile("button.mp3", 2048);
  getFoodMusic = minim.loadFile("getfood.mp3", 2048);
  heartBeatMusic = minim.loadFile("heartbeat.wav", 2048);
  hurtMusic = minim.loadFile("sneezing.mp3", 2048);
  //gamestatemusic
  backgroundMusic = minim.loadFile("background.wav", 2048);
  loseMusic = minim.loadFile("losemusic.mp3", 2048);
  winMusic = minim.loadFile("winmusic.mp3", 2048);

  rightFoodMusic= minim.loadFile("rightfood.mp3", 2048);;
  wrongFoodMusic= minim.loadFile("wrongfood.mp3", 2048);;

  //gain set
  startMusic.setGain(3000);
  backgroundMusic.setGain(-10);

  //bcakgroound
  backgroundImg=loadImage("img/background.png");
  redGradient=loadImage("img/redgradient.png");

  //customer
  customerImg = new PImage[TOTALENEMY_NUMBER];

  for (int i=0; i<TOTALENEMY_NUMBER; i++) {
    customerImg[i]=loadImage("img/customer0" + i + ".png");
  }

  virusImg=loadImage("img/virus.png");
  tableImg=loadImage("img/table.png");
  chairImg=loadImage("img/chair.png");
  satisfyImg = loadImage("img/satisfy.png");

  //player 
  playerFrontImg=loadImage("img/playerFront.png");
  playerBackImg=loadImage("img/playerBack.png");
  playerLeftImg=loadImage("img/playerLeft.png");
  playerRightImg=loadImage("img/playerRight.png");

  //playerMask
  playerFrontMaskImg=loadImage("img/playerFrontMask.png");
  playerBackMaskImg=loadImage("img/playerBackMask.png");
  playerLeftMaskImg=loadImage("img/playerLeftMask.png");
  playerRightMaskImg=loadImage("img/playerRightMask.png");

  //playerGOOGLE
  playerFrontGoggleImg=loadImage("img/playerFrontGoggle.png");
  playerBackGoggleImg=loadImage("img/playerBackGoggle.png");
  playerLeftGoggleImg=loadImage("img/playerLeftGoggle.png");
  playerRightGoggleImg=loadImage("img/playerRightGoggle.png");

  eyeProtectImg=loadImage("img/GOGGLE.png");
  maskProtectImg=loadImage("img/MASK.png");
  dispenserImg=loadImage("img/ALCOHOL.png");
  clockImg=loadImage("img/clock.png");
  foodA1 = loadImage("img/foodA0.png");
  foodA2 = loadImage("img/foodA1.png");
  foodA3 = loadImage("img/foodA2.png");
  foodA4 = loadImage("img/foodA3.png");
  foodB1 = loadImage("img/foodA4.png");
  foodB2 = loadImage("img/foodA5.png");
  foodB3 = loadImage("img/foodA6.png");
  foodB4 = loadImage("img/foodA7.png");

  barLeft = loadImage("img/barLeft.png");
  barRight = loadImage("img/barRight.png");

  // GameState page and buttons
  gameStart = loadImage("img/gameStart.png");
  gameWin = loadImage("img/gameWin.png");
  gameOver = loadImage("img/gameOver.png");
  gameOver2 = loadImage("img/gameOver2.png");
  startButton1 = loadImage("img/startButton.png");
  startButton2 = loadImage("img/startButton2.png");
  overButton1 = loadImage("img/overButton.png");
  overButton2 = loadImage("img/overButton2.png");
  winButton1 = loadImage("img/winButton.png");
  winButton2 = loadImage("img/winButton2.png");

  //rules
  page1 = loadImage("img/p1.png");
  page2 = loadImage("img/p2.png");
  page3 = loadImage("img/p3.png");
  next1 = loadImage("img/next.png");
  next2 = loadImage("img/next2.png");
  go1 = loadImage("img/start.png");
  go2 = loadImage("img/start2.png");



  size(1440, 960);

  font = createFont("font/font.ttf", 56);
  textFont(font);

  initGame();
}//setup



void initGame() {



  // Initialize gameTimer
  gameTimer = GAME_INIT_TIMER;

  // Initialize player


  initPlayer();

  // Initialize table
  table= new Table[TABLE_COUNT];
  chair= new Chair[CHAIR_COUNT];
  table_food=new Table_Food[TABLE_COUNT];
  initTables();

  // Initialize enemies and their position
  enemyX=0;
  enemyY=0;
  enemy= new Enemy[ENEMY_NUMBER];
  superEnemy= new SuperEnemy[SUPERENEMY_NUMBER];
  initEnemies();

  // Initialize bar
  bar = new Bar(barX, barY);
  initBar();

  // Initialize food and their position
  foods = new Food[1];
  want = new Want[6];
  initFood();

  // clocks
  initClocks();


  //skillui
  skillUi =new SkillUi();

  //healthUI
  healthUI=new Health();  

  //satisfy
  satisfy = new Satisfy();
} //init game



void initPlayer() {
  playerX = PLAYER_INIT_X;
  playerY = PLAYER_INIT_Y;
  player = new Player(playerX, playerY);

  playerHealth = 0;
}//initPlayer()


void initTables() {

  for (int i=0; i<table.length; i++) {
    float tableX;
    float tableY;
    if (i%2==0) {
      tableY=8*GRID;
      tableX=(i+1)*2*GRID+2*GRID;
    } else {
      tableY=4*GRID;
      tableX=i*2*GRID+2*GRID;
    }

    table[i]= new Table(tableX, tableY);
    table_food[i] = new Table_Food(tableX, tableY);
  }//for


  for (int i=0; i<chair.length; i++) {
    float chairX;
    float chairY;
    if (i%2==0) {
      chairY=7*GRID;
      chairX=(i+1)*2*GRID+2*GRID;
    } else {
      chairY=3*GRID;
      chairX=i*2*GRID+2*GRID;
    }
    chair[i]= new Chair(chairX, chairY);
  }//for
}//initTables()


void initBar() {
  barX = 0;
  barY = GRID;
}

void initEnemies() {  
  //float enemySpawnChance=0.5;

  for (int i=0; i<ENEMY_NUMBER; i++) {

    if (i<3) {
      enemyX = random(10, 17*GRID);
      enemyY = random(2*GRID, 6*GRID);
    } else {
      enemyX = random(0, 10*GRID);
      enemyY = random(6*GRID, 10*GRID);
    }

    enemy[i]=new Enemy(enemyX, enemyY);
    enemy[i].img=customerImg[i];
  }//for


  for (int i=0; i<SUPERENEMY_NUMBER; i++) {
    enemyX = random(0, 17*GRID);

    superEnemy[i]=new SuperEnemy(enemyX, enemyY);
    superEnemy[i].img=customerImg[i+3];
  }//for
}//initEnemies()


void initFood() {
  for (int i=0; i<foods.length; i++) {
    foods[i] = new Food();
    foods[i].beTaken();
  }
  //want
  for (int i=0; i<want.length; i++) {
    float wantX;
    float wantY;
    if (i%2==0) {
      wantY=6*GRID;
      wantX=(i+1)*2*GRID+2*GRID;
    } else {
      wantY=2*GRID;
      wantX=i*2*GRID+2*GRID;
    }
    want[i]= new Want(wantX, wantY);
  }
}//initFood()

void initClocks() {
}//initClocks()






void draw() {
  switch(gameState) {

  case GAME_START:

    //music
    winMusic.pause();

    if (startMusic.isPlaying()==false) {
      startMusic.loop();
    }

    imageMode(CORNER);
    image(gameStart, 0, 0, width, height);
    if ((width/2 - BUTTON_W/2) + BUTTON_W > mouseX
      && (width/2 - BUTTON_W/2) < mouseX
      && (height-2*GRID - BUTTON_H/2) + BUTTON_H > mouseY
      && (height-2*GRID - BUTTON_H/2) < mouseY) {

      imageMode(CENTER);
      image(startButton2, width/2, height-2*GRID, BUTTON_W, BUTTON_H);
      if (mousePressed) {

        buttonMusic.play();

        gameState = PAGE_1;
        mousePressed = false;
      }
    } else {
      imageMode(CENTER);
      image(startButton1, width/2, height-2*GRID, BUTTON_W, BUTTON_H);
    }

    break;

    ////// rules page  //////
  case PAGE_1:

    imageMode(CORNER);
    image(page1, 0, 0, width, height);
    if ((width/2 - BUTTON_W/2) + BUTTON_W > mouseX
      && (width/2 - BUTTON_W/2) < mouseX
      && (height-2*GRID - BUTTON_H/2) + BUTTON_H > mouseY
      && (height-2*GRID - BUTTON_H/2) < mouseY) {

      imageMode(CENTER);
      image(next2, width/2, height-2*GRID, BUTTON_W, BUTTON_H);
      if (mousePressed) {
        gameState = PAGE_2;

        buttonMusic.rewind();

        mousePressed = false;
      }
    } else {
      imageMode(CENTER);
      image(next1, width/2, height-2*GRID, BUTTON_W, BUTTON_H);
    }

    break;

  case PAGE_2:

    imageMode(CORNER);
    image(page2, 0, 0, width, height);
    if ((width/2 - BUTTON_W/2) + BUTTON_W > mouseX
      && (width/2 - BUTTON_W/2) < mouseX
      && (height-2*GRID - BUTTON_H/2) + BUTTON_H > mouseY
      && (height-2*GRID - BUTTON_H/2) < mouseY) {

      imageMode(CENTER);
      image(next2, width/2, height-2*GRID, BUTTON_W, BUTTON_H);
      if (mousePressed) {
        gameState = PAGE_3;

        buttonMusic.rewind();

        mousePressed = false;
      }
    } else {
      imageMode(CENTER);
      image(next1, width/2, height-2*GRID, BUTTON_W, BUTTON_H);
    }

    break;

  case PAGE_3:

    imageMode(CORNER);
    image(page3, 0, 0, width, height);
    if ((width/2 - BUTTON_W/2) + BUTTON_W > mouseX
      && (width/2 - BUTTON_W/2) < mouseX
      && (height-2*GRID - BUTTON_H/2) + BUTTON_H > mouseY
      && (height-2*GRID - BUTTON_H/2) < mouseY) {

      imageMode(CENTER);
      image(go2, width/2, height-2*GRID, BUTTON_W, BUTTON_H);
      if (mousePressed) {
        gameState = GAME_RUN;
        mousePressed = false;
      }
    } else {
      imageMode(CENTER);
      image(go1, width/2, height-2*GRID, BUTTON_W, BUTTON_H);
    }

    break;
    ////// rules page  //////


  case GAME_RUN:
    //music
    startMusic.pause();
    loseMusic.pause();

    if (backgroundMusic.isPlaying()==false) {

      backgroundMusic.play();
      backgroundMusic.rewind();
    }



    imageMode(CORNER);

    image(backgroundImg, 0, 0, 1440, 960);
    pushStyle();
    colorMode(RGB);
    noStroke();
    fill(51, 60, 68); 
    rect(0, 0, width, GRID);
    popStyle();



    //table

    for (int i=0; i<table.length; i++) {
      table[i].display();
      table_food[i].display();
    }//for

    //chair
    for (int i=0; i<chair.length; i++) {
      chair[i].display();
    }//for



    //Bar
    bar.display();

    
    // food display on the bar
    for (int i=0; i<foods.length; i++) {
      foods[i].display();
    }

    //enemy
    for (int i=0; i<enemy.length; i++) {

      enemy[i].display();
      enemy[i].detectCollision(table);
      enemy[i].move();
    }//for

    //super
    for (int i=0; i<superEnemy.length; i++) {

      superEnemy[i].display();
      superEnemy[i].detectCollision(table);
      superEnemy[i].move();
    }//for
    

    //player
    player.display();
    player.move();
    // collision detection
    player.detectCollision(enemy);
    player.detectSuperEnemyCollision(superEnemy);
    player.detectCollision(table);
    player.skill();

    //food be taken in front of the player
    for (int i=0; i<foods.length; i++) {
      foods[i].beTaken();
      foods[i].move();
    }


    
    //want
    for (int i=0; i<want.length; i++) {
      want[i].timer();
      if (want[i].isAlive) {
        want[i].display();
      }
      if (want[i].disappearing==true) {
        want[i].timerDisappear--;
        if (want[i].timerDisappear==0) {
          want[i].isAlive=false;
          if(table_food[i].isAlive==false){
            customerSatisfy --;
          }
        }
      }
      //require:if(food hit table[i]){want[i].isAlive=false;}
      // if (want[i].display = foodToTable[i]) {satisfy ++;}
      // if(want[i].display != foodToTable[i]) {satisfy --;}
    }

    // Timer
    gameTimer --;
    if (gameTimer <= 0) gameState = GAME_OVER2;

    // Time UI 
    drawTimerUI(); 

    // Health UI
    healthUI.display();
    //skill UI
    skillUi.display();
    if (timerOpen==true){
      timer++;
    }
    if (timer>300){
      currentSkillType=0;
    }

    //satisfy
    if (customerSatisfy <= 0) {
      gameState = GAME_OVER2;
      customerSatisfy = ORIGIN_SATISFY;
    }
    if (customerSatisfy >= 10) {
      gameState = GAME_WIN;
      customerSatisfy = ORIGIN_SATISFY;
    }
    if (playerHealth >=100) {
      gameState = GAME_OVER;
      customerSatisfy = ORIGIN_SATISFY;
    }
    satisfy.display();

    //music
    Emergency();

    break;




  case GAME_OVER:

    //music
    heartBeatMusic.pause();
    backgroundMusic.pause();
    if (loseMusic.isPlaying()==false) {
      loseMusic.loop();
    }


    imageMode(CORNER);
    image(gameOver, 0, 0, width, height);
    initGame();

    if ((width/2 - BUTTON_W/2) + BUTTON_W > mouseX
      && (width/2 - BUTTON_W/2) < mouseX
      && (height-2*GRID - BUTTON_H/2) + BUTTON_H > mouseY
      && (height-2*GRID - BUTTON_H/2) < mouseY) {

      imageMode(CENTER);
      image(overButton2, width/2, height-2*GRID, BUTTON_W, BUTTON_H);
      if (mousePressed) {
        gameState = GAME_RUN;
        mousePressed = false;
      }
    } else {
      imageMode(CENTER);
      image(overButton1, width/2, height-2*GRID, BUTTON_W, BUTTON_H);
    }
    break;

  case GAME_WIN:
    //music
    heartBeatMusic.pause();
    backgroundMusic.pause();

    if (winMusic.isPlaying()==false) {

      winMusic.play();
      winMusic.rewind();
    }

    imageMode(CORNER);
    image(gameWin, 0, 0, width, height);
    initGame();

    if ((width/2 - BUTTON_W/2) + BUTTON_W > mouseX
      && (width/2 - BUTTON_W/2) < mouseX
      && (height-2*GRID - BUTTON_H/2) + BUTTON_H > mouseY
      && (height-2*GRID - BUTTON_H/2) < mouseY) {

      imageMode(CENTER);
      image(winButton2, width/2, height-2*GRID, BUTTON_W, BUTTON_H);
      if (mousePressed) {
        gameState = GAME_START;
        mousePressed = false;
      }
    } else {
      imageMode(CENTER);
      image(winButton1, width/2, height-2*GRID, BUTTON_W, BUTTON_H);
    }
    break;

  case GAME_OVER2:
    //music
    heartBeatMusic.pause();
    backgroundMusic.pause();
    if (loseMusic.isPlaying()==false) {
      loseMusic.loop();
    }

    imageMode(CORNER);
    image(gameOver2, 0, 0, width, height);
    initGame();

    if ((width/2 - BUTTON_W/2) + BUTTON_W > mouseX
      && (width/2 - BUTTON_W/2) < mouseX
      && (height-2*GRID - BUTTON_H/2) + BUTTON_H > mouseY
      && (height-2*GRID - BUTTON_H/2) < mouseY) {

      imageMode(CENTER);
      image(overButton2, width/2, height-2*GRID, BUTTON_W, BUTTON_H);
      if (mousePressed) {
        gameState = GAME_RUN;
        mousePressed = false;
      }
    } else {
      imageMode(CENTER);
      image(overButton1, width/2, height-2*GRID, BUTTON_W, BUTTON_H);
    }
    break;
  }//switch
}// void draw


////music
void Emergency() {

  if (gameTimer<1800||playerHealth>70) {
    backgroundMusic.setGain(-20);
    heartBeatMusic.setGain(300);
    heartBeatMusic.play();
    pushStyle();
    tint(255, 255, 255, 40);
    image(redGradient, 0, 0);
    popStyle();
  } else {
    backgroundMusic.setGain(10);
    heartBeatMusic.pause();
    
  }
}

///////////////////////////////clock
void drawTimerUI() {
  pushMatrix();
  String timeString =convertFramesToTimeString(gameTimer);
  textSize(50);
  // Actual Time Text
  image( clockImg, 10*GRID, 0, GRID, GRID);
  color timeTextColor =getTimeTextColor(gameTimer);    
  fill(timeTextColor);
  text(timeString, TIMER_POSITIONX, TIMER_POSITIONY);
  popMatrix();
}


String convertFramesToTimeString(int frames) {  
  frames=floor(frames/60);
  int mm=2;
  int ss=0;
  if (frames>=240) {
    ss=frames-240;
    mm=4;
  } else if (frames>=180) {
    ss=frames-180;
    mm=3;
  } else if (frames>=120) {
    ss=frames-120;
    mm=2;
  } else if (frames>=60) {
    ss=frames-60;
    mm=1;
  } else if (frames<60) {
    ss=frames;
    mm=0;
  }

  String MM = nf(mm, 2);
  String SS = nf(ss, 2);
  return (MM+":"+SS);
}

color getTimeTextColor(int frames) {   
  frames=floor(frames/60);

  int colorNumber=#00ffff;

  if (frames>=120) {
    colorNumber= #00ffff;
  } else if ( frames<120 && frames>=60) {
    colorNumber= #ffffff;
  } else if (frames<60 && frames>=30) {
    colorNumber= #ffcc00;
  } else if (frames<30 && frames>=10) {
    colorNumber= #ff6600;
  } else if (frames<10) {
    colorNumber= #ff0000;
  }

  return colorNumber;
}
//////////////////////////////clock



void keyPressed() {
  if (key==CODED) {
    switch(keyCode) {
    case LEFT:
      leftState = true;
      break;
    case RIGHT:
      rightState = true;
      break;
    case DOWN:
      downState = true;
      break;
    case UP:
      upState = true;
    }//coded
  }//if

  switch(key) {
  
  case'0':
  
    
  case '1':
    println(timer);
    if (timer>300){
      player.setSkillType(1);
      currentSkillType=1;
      if (getFoodMusic.isPlaying()==false) {
        getFoodMusic.play();
        getFoodMusic.rewind();
      }
      timer=0;
      timerOpen=true;      
    }
    break;
  case '2':
    player.setSkillType(2);
    currentSkillType=2;
    if (getFoodMusic.isPlaying()==false) {
      getFoodMusic.play();
      getFoodMusic.rewind();
    }
    break;
  case '3':
    player.setSkillType(3);
    if (getFoodMusic.isPlaying()==false) {
      getFoodMusic.play();
      getFoodMusic.rewind();
    }
    break;
  }//key


  // Food take
  if (player.y >= 1*GRID && player.y <= 2.1*GRID) {

    //// A1 & A5 ////
    if ( food2 == false && food3 == false && food4 == false) {
      if ( player.x >= 0 && player.x < 0.6*GRID ) {
        if (key == ' ') {    
          for (int i=0; i<foods.length; i++) {
            //music
            getFoodMusic.play();
            getFoodMusic.rewind();
            
            foods[i].takeFood = !foods[i].takeFood;
            food1 = !food1;
          }
        }
      } else if ( player.x >=13.5*GRID && player.x <14.5*GRID) {
        if (key == ' ') {    
          for (int i=0; i<foods.length; i++) {  
            //music
            getFoodMusic.play();
            getFoodMusic.rewind();
            
            foods[i].takeFood = !foods[i].takeFood;
            food1 = !food1;
          }
        }
      }
    }
    //// A1 & A5 ////

    //// A2 & A6 ////
    if ( food1 == false && food3 == false && food4 == false ) {
      if (player.x >= 0.6*GRID && player.x < 1.6*GRID) {
        if (key == ' ') {    
          for (int i=0; i<foods.length; i++) {  
            //music
            getFoodMusic.play();
            getFoodMusic.rewind();
            
            foods[i].takeFood = !foods[i].takeFood;
            food2 = !food2;
          }
        }
      } else if (player.x >= 14.5*GRID && player.x < 15.5*GRID) {
        if (key == ' ') {    
          for (int i=0; i<foods.length; i++) {  
            //music
            getFoodMusic.play();
            getFoodMusic.rewind();
            
            foods[i].takeFood = !foods[i].takeFood;
            food2 = !food2;
          }
        }
      }
    }
    //// A2 & A6////

    //// A3 & A7 ////
    if ( food1 == false && food2 == false && food4 == false ) {
      if (player.x >= 1.6*GRID && player.x < 2.4*GRID) {
        if (key == ' ') {    
          for (int i=0; i<foods.length; i++) {  
            //music
            getFoodMusic.play();
            getFoodMusic.rewind();
            
            foods[i].takeFood = !foods[i].takeFood;
            food3 = !food3;
          }
        }
      } else if (player.x >= 15.5*GRID && player.x <16.6*GRID) {
        if (key == ' ') {    
          for (int i=0; i<foods.length; i++) {  
            //music
            getFoodMusic.play();
            getFoodMusic.rewind();
            
            foods[i].takeFood = !foods[i].takeFood;
            food3 = !food3;
          }
        }
      }
    }
    //// A3 & A7 ////

    //// A4 & A8 ////
    if ( food1 == false && food2 == false && food3 == false ) {
      if (player.x >= 2.4*GRID && player.x < 3.5*GRID) {
        if (key == ' ') {    
          for (int i=0; i<foods.length; i++) {  
            //music
            getFoodMusic.play();
            getFoodMusic.rewind();
            
            foods[i].takeFood = !foods[i].takeFood;
            food4 = !food4;
          }
        }
      } else if (player.x >=16.6*GRID && player.x <width) {
        if (key == ' ') {    
          for (int i=0; i<foods.length; i++) {  
            //music
            getFoodMusic.play();
            getFoodMusic.rewind();
            
            foods[i].takeFood = !foods[i].takeFood;
            food4 = !food4;
          }
        }
      }
    }
    //// A4 & A8 ////
  }


  //// Give food to customers
  //for(int i=0; i< foods.length; i++){
  //  for(int j=0; j< table.length; j++){

  //    if(foods[i].takeFood == true){
  //      if(player.x >= table[j].x - GRID/2 && player.x <= table[j].x + 3*GRID/2.0){
  //        if(player.y >= table[j].y && player.y <= table[j].y + 1*GRID){
  //          if(key == ' '){
  //            foods[i].takeFood = false;
  //            food1 = false;
  //            food2 = false;
  //            food3 = false;
  //            food4 = false;
  //          }
  //        }
  //      }
  //    }

  //  }
  //}
}

void keyReleased() {
  if (key==CODED) {
    switch(keyCode) {
    case LEFT:
      leftState = false;
      break;
    case RIGHT:
      rightState = false;
      break;
    case DOWN:
      downState = false;
      break;
    case UP:
      upState = false;
    }
  }
}


void mousePressed() { 
  for (int i=0; i<ENEMY_NUMBER; i++) {
    float D =dist(mouseX, mouseY, enemyX, enemyY);
    if (D<GRID/2) {

      currentSkillType=3;

      println("YEAH");
    }
  }
}
