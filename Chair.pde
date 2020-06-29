class Chair {
  float x, y;
  PImage img;
  
  Chair (float x, float y){
    this.x = x;
    this.y = y;
    img = loadImage("img/chairs"+floor(random(6))+".png");
  }

 
  void display() {
    image(img, x, y, 2*GRID, GRID);

  }
  

}
