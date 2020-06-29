class Health {
  float x;
  float y;
  String healthString;
  PImage img;

  Health () {
    x=6.4*GRID;
    y=0.75*GRID;
    img= virusImg;
  }

  void display() {
    pushStyle();
    image(img, 5*GRID, 0, GRID, GRID); 

    textSize(50);
    colorMode(RGB);
     float colorNumber=getHealthColor(playerHealth);
    fill(255,colorNumber,colorNumber);

    String healthString =floor(playerHealth)+"/"+floor(PLAYER_MAX_HEALTH);
    text(healthString, x,y );
    popStyle();
  }


  float getHealthColor(float number) {   
    
    float colorNumber = map(number,0,100,255,0);


    return colorNumber;
  }
}//class
