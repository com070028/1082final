class Satisfy {
  float x;
  float y;
  String satisfyString;
  PImage img;


  Satisfy () {
    x=2.4*GRID;
    y=0.75*GRID;
    img= satisfyImg;
  }

  void display() {
    pushStyle();
    image(img, GRID, 0, GRID, GRID); 

    textSize(50);
    colorMode(RGB);
    float colorNumber=getHealthColor(playerHealth);
    fill(255,colorNumber,colorNumber);

    String satisfyString =floor(customerSatisfy)+"/"+floor(CUSTOMER_MAX_SATISFY);
    text(satisfyString, x, y );
    popStyle();
  }


  float getHealthColor(float number) {   
    
    float colorNumber = map(number,0,100,255,0);
    return colorNumber;
  }
  
  
}//class
