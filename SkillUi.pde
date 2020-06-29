class SkillUi {
  float x1;
  float x2;
  float x3;
  float y;
  float timer;
  //boolean usage1 = true;
  //boolean usage2 = true;
  //boolean usage3 = true;

  
  SkillUi (){
    y=0;
   x1= 14*GRID;
   x2= 15*GRID;
   x3= 16*GRID;
   timer=0;
  }

   
   
   
  void display() {
  if(currentSkillType==0){
  image(maskProtectImg,x1,0,GRID,GRID); 
  image(eyeProtectImg,x2,0,GRID,GRID); 
  image(dispenserImg,x3,0,GRID,GRID); 
  }
  
    if(currentSkillType==1){
  image(eyeProtectImg,x2,0,GRID,GRID); 
  image(dispenserImg,x3,0,GRID,GRID);
  pushStyle();
  tint(255,50);
  image(maskProtectImg,x1,0,GRID,GRID); 
  popStyle();
  //usage1 = false;
  }
  
  
  if(currentSkillType==2){ 
  image(maskProtectImg,x1,0,GRID,GRID);
  image(dispenserImg,x3,0,GRID,GRID);
  pushStyle();
  tint(255,50);
  image(eyeProtectImg,x2,0,GRID,GRID); 
  popStyle(); 
  //usage2 = false;
  }

  if(currentSkillType==3){
  image(eyeProtectImg,x2,0,GRID,GRID); 
  image(maskProtectImg,x1,0,GRID,GRID);
  pushStyle();
  tint(255,50);
  image(dispenserImg,x3,0,GRID,GRID); 
  popStyle();
  //usage3 = false;
  } 

  }
  

}
