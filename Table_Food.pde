class Table_Food {
  float x, y;
  PImage img;
  int foodNum;
  boolean isAlive;
  int timer;
  
  Table_Food (float x, float y){
    this.x = x;
    this.y = y;
    foodNum=8;
    img =loadImage("img/foodA"+foodNum+".png");
    isAlive=false;
  }

 
  void display() {
    image(img, x, y, GRID, GRID);
    img =loadImage("img/foodA"+foodNum+".png");
    for(int i=0;i<6;i++){
      if (table_food[i].isAlive==true){
        table_food[i].timer++;
        println(table_food[i].timer,i);
        if (table_food[i].timer>360){
          table_food[i].timer=0;
          table_food[i].isAlive=false;
          table_food[i].foodNum=8;
          println("yessss");
          
        }
      }
    }
  }
  

}
