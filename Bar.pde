class Bar {
  float x, y, w, h;
  PImage img1;
  PImage img2;
  
  Bar(float x, float y){
    this.x = x;
    this.y = y;
    w = 4*GRID;
    h = GRID;
    img1 = barLeft;
    img2 = barRight;
  }
  
  void display(){
    image(img1 ,0, GRID,w ,h);
    image(img2 , 14*GRID, GRID, w, h);
  }

}
