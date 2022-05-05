class Planet //extends Button

{
  float radius;// the size of planet
  float angle;// the start position of planet
  float distance;// the distance from the planet to the sun
  float orbitspeed;// the orbit speed of planet
  Planet[] planets;// prepareing for the space to store all planets
  PVector v;// a pvector that use to locte how planets rotate
  
  PShape globe;// use to build up sphere object

  //create a planet
  Planet(float r, float d, float orb, PImage img){
    v = new PVector(1,0,0);
    radius = r;
    distance = d;
    v.mult(distance);
    angle =random(TWO_PI);//random start position
    orbitspeed = orb; 
    
    noStroke();
    noFill();
    globe = createShape(SPHERE, radius);// create a sphere with r radius
    globe.setTexture(img);// set texture for planets
  }
  
  
   
  //set orbit speed
  //"go" is 0 or 1, to achieve pause and play
  //"accel" is acceleration index
  void orbit(int go,int accel){
   angle = angle + (orbitspeed*go*accel);
    if(planets != null){
    for(int i = 0; i < planets.length; i++){ 
      planets[i].orbit(go,accel);
    }
  }
  }
  
  
  //Create moons around the sun
  //"go" is 0 or 1, to achieve pause and play
  //"accel" is acceleration index
  void spawnMoons(int total,int go,int accel){
    planets = new Planet[total];
    
    for(int i = 0; i < planets.length; i++){
      switch(i)
      {
        case 0://mercury
        float q0=20;
        float r0=250;
        planets[0] = new Planet(q0, r0, 0.114*go*accel , textures[0]);
        break;
        
        case 1://venus
        planets[1] = new Planet(30, 500, 0.044*go*accel , textures[1]);
        break;
        
        case 2://earth
        float q2 =40;
        float r2=750;
        planets[2] = new Planet(q2, r2, 0.027*go*accel, textures[2]);//.spawnMoons;
        break;
        
        case 3://mars
        planets[3] = new Planet(40, 1000, 0.014*go*accel , textures[3]);
        break;
        
        case 4://jupiter
        planets[4] = new Planet(120, 1250, 0.0023*go*accel , textures[4]);
        break;
        
        case 5://saturn
        planets[5] = new Planet(80, 1500, 0.000923*go*accel , textures[5]);
        break;
        
        case 6://uranus
        planets[6] = new Planet(60, 1750, 0.000324*go *accel, textures[6]);
        break;
        
        case 7://neptune
        planets[7] = new Planet(60, 2000, 0.000165 *go*accel, textures[7]);
        break;
        
        default:break;
      }
 
      }
 
    }
  
  
  void show(){
    pushMatrix();// save and clean the accelerate of translate
    rotateX(PI/2);
    stroke(100,0,0);
    strokeWeight(1);
    noFill();
    ellipse(0, 0, (distance+250)*2, (distance+250)*2);// draw rotation lines
    
    popMatrix();
    
    noStroke();
    pushMatrix();
    PVector v2 = new PVector(1,0,1);// set a random vector from shpere center of sun
    PVector p = v.cross(v2);// set a new vector that cross the v2 vector
    rotate(angle, p.x, p.y, p.z); // set p as the axis that all planets rotate around
    stroke(255);
    
    line(0,0,0,v.x,v.y,v.z); // draw connection lines from sun to planets
    translate(v.x, v.y, v.z);// then all planets could rotate on the same plat
    noStroke();
    fill(255);
    shape(globe);
    
    if(planets != null){// show all planets through recursion
    for(int i = 0; i < planets.length; i++){ 
      planets[i].show();
 
    }
  }
  popMatrix();
}
}
