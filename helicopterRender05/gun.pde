class Gunshot {
  float x;
  float y;
  boolean live;

  Gunshot( float newx, float newy ) {
    x = newx + 20;
    y = newy + 10;
    live = true;
  }

  void checkforhit() {
    for (int d = 0; d < enemies.length; d++) {
      Enemy e = enemies[d];
      if(y > (e.y - (e.r/2)) && (y < (e.y + (e.r/2)))) {
        if (x < e.x) {
          if ((x + 60) >= e.x) { 
         //   println("HIT");
            live = false;
            e.live = false;
            score = score + 1;
            return;
          }
        }
      }
    } 
  }

  void render() {
    fill(255);
    stroke(0);
    strokeWeight(1.0);
    ellipse(x,y,5,5);
    x += 60.0;
    if (x > 800) {
     // println("gun live = false");
      live = false;
    }
  }
}


