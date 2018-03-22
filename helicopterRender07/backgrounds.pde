class Background {
  PImage background1;
  
  Background () {
    background1 = loadImage("helicopterbackground1.jpg");
    
  }
  
  void render() {
    image(background1,0,0);
  }
}
