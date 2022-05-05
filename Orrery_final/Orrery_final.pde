import peasy.*;// use peasyCam to set start view point and achieve zoom function.

Planet sun;
PeasyCam cam;
Star[] stars = new Star[3000]; // set arraies to save star points as background
PImage sunTexture; //Texture for sun 
PImage[] textures = new PImage[8]; // Texture for other planets


Button playbutton;// Function button for play and pause
Button accelbutton;// Function buttton for slowdown and acceleration

String state="running";
int red=0;
int green=150;
int blue=150;
int go=1;
int accel=1;


void setup(){
  size(1000,1000, P3D);
  

playbutton = new Button(100, 100, 100, 50,state, red,green,blue);
accelbutton=new Button( 250,100,100,50,state,red,green,blue);

  
  // set texture for all planets
  sunTexture = loadImage("sun.jpg");
  textures[0] = loadImage("mercury.jpg");
  textures[1] = loadImage("venus.jpg");
  textures[2] = loadImage("earth.jpg");
  textures[3] = loadImage("mars.jpg");
  textures[4] = loadImage("jupiter.jpg");
  textures[5] = loadImage("saturn.jpg");
  textures[6] = loadImage("uranus.jpg");
  textures[7] = loadImage("neptune.jpg");
  
  cam = new PeasyCam(this,3000);//set start view point
  cam.setMinimumDistance(500);
  cam.setMaximumDistance(5000);

  
  sun = new Planet(180,0,0,sunTexture); // build up sun
  sun.spawnMoons(8,go,accel);// build up other planets through recursion and connect them with sun
                             // "go" is used for pause button and accel is used for accelerate button
  
  for(int i = 0; i<stars.length; i++){
    stars[i] = new Star(); // set stars in background
  }
}

// check is the button clicked
void mousePressed()
{
   if (playbutton.isClicked()==true)
    {
      playbutton.toggleOnOff();
    }
    if (accelbutton.isClicked()==true)
    {
      accelbutton.toggleOnOff();
    }
  }
  
void draw(){
  background(0);
   
  cam.beginHUD(); // make sure the button would not move when using zoom function in peasyCam

if (playbutton.on==true){
   playbutton.Text="Pause";
   red=0;
   green=150;
   blue=150;
   go=1;// After clicked the button, the solar system would start moving. 
        // And the text on button would be changed into "pause" to tell users next click means stop rotation
}
else if(playbutton.on==false)
{
  playbutton.Text="Play";
  red=0;
  green=150;
  blue=0;
   go=0;// After clicked the button, the solar system would stop moving. 
        // And the text on button would be changed into "play" to tell users next click means start rotation
   }

      playbutton.render();


cam.endHUD();
 cam.beginHUD(); 
  if (accelbutton.on==true){
   accelbutton.Text="Slow";
   red=0;
   green=150;
   blue=150;
   accel=5;// After clicked the button, the rotation would accelerate. 
           // And the text on button would be changed into "slow" to tell users next click means come back to normal speed
}
else if(accelbutton.on==false)
{
  accelbutton.Text="Fast";
  red=0;
  green=150;
  blue=0;
  accel=1;// After clicked the button, the rotation speed would come back to normal speed. 
          // And the text on button would be changed into "fast" to tell users next click means acceleration
   }
     accelbutton.render();
cam.endHUD();

  //draw stars in background
  for(int i = 0; i<stars.length; i++){
    stars[i].show();
  }
  
  //draw sun and planets and set their orbit speed (all planets are build up through recursion when build up sun object)
  noStroke();
  smooth();
  lights();
  sun.show();
  sun.orbit(go,accel);
  
}
