class Star{
  float x;
  float y;
  float z;
  
  Star(){ // create random stars at given cordinate
    x = random(-10000,10000);
    y = random(-10000,10000);
    z = random(-10000,10000);
  }
  
  void show(){
    stroke(255,200);
    point(x,y,z);
  }
}
