class Table {
  float x, y;
  PImage img;
  
  Table (float x, float y){
    this.x = x;
    this.y = y;
    img =tableImg;
  }

 
  void display() {
    
    image(img, x, y,2*GRID,GRID);

  }
  boolean CollisionTestLeft(float x, float y){ //first detect,go player
  
    return x+GRID>this.x&&x<this.x+2*GRID-10&&y>this.y-2*GRID+10&&y<this.y ? true : false;
    //return x<this.x+2*GRID&&x+GRID>this.x&&y<this.y+GRID&&y+GRID>this.y ? true : false;
    
  }
  boolean CollisionTestRight(float x, float y){ //first detect,go player
  
    return x+GRID>this.x+1&&x<this.x+2*GRID&&y>this.y-2*GRID+10&&y<this.y ? true : false;
    //return x<this.x+2*GRID&&x+GRID>this.x&&y<this.y+GRID&&y+GRID>this.y ? true : false;
    
  } 
  boolean CollisionTestUp(float x, float y){ //first detect,go player
  
    return x+GRID>this.x&&x<this.x+2*GRID&&y>this.y-2*GRID-10&&y<this.y ? true : false;
    //return x<this.x+2*GRID&&x+GRID>this.x&&y<this.y+GRID&&y+GRID>this.y ? true : false;
    
  }
  boolean CollisionTestDown(float x, float y){ //first detect,go player
  
    return x+GRID>this.x&&x<this.x+2*GRID&&y>this.y-2*GRID+10&&y<this.y+10 ? true : false;
    //return x<this.x+2*GRID&&x+GRID>this.x&&y<this.y+GRID&&y+GRID>this.y ? true : false;
    
  }


}
