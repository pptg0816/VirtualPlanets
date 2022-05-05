class Button
{
  PVector Pos=new PVector(0,0);
  float Width=0;
  float Height=0;
  color Colour;
  String Text;
  boolean on ;
  //Boolean Pressed=false;
  //Boolean Clicked=false;
  
  // Construcot to create a button
  Button(int x,int y, int w,int h, String t,int r, int g, int b)
  {
    Pos.x=x;
    Pos.y=y;
    Width=w;
    Height=h;
    Colour= color(r,g,b);
    Text=t;
    
    

  }
     boolean isClicked(){
            
    return (mouseX > Pos.x && mouseY >Pos.y && mouseX < Pos.x +Width &&
    mouseY < Pos.y + Height);
  }

  
  void toggleOnOff(){
    
    this.on = !this.on;
    
  }
  
  
 
  void render() //must be placed in void draw() to render the button to screen
  {
    fill(Colour);
    rect(Pos.x,Pos.y,Width,Height);
    fill(0);
    textAlign(CENTER,CENTER);
    text(Text,Pos.x+(Width/2),Pos.y+(Height/2));
  }

}
