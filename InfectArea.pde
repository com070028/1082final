class InfectArea {
  float x, y;


  InfectArea () {
    x=0;
    y=0;
  }//constructor

  void moveTo(float x, float y) {
    this.x = x+GRID/2;
    this.y = y+GRID;
  } //moveto



  void ShowOntheFeet(float area) {
    
    pushStyle();
    noStroke();
    fill(255,255,255,30);
    ellipse(x, y, area, area);//size
    popStyle();
    
  }//ShowOntheFeet
}
