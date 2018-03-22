class Building
{
  int h;
  int w;
  int x;
  int y;
  BWSmoke smoke1;
  BWSmoke smoke2;

  Building(int x, int y, int h, int w)
  {
    this.x = x;
    this.y = y;
    this.h = h;
    this.w = w;
    smoke1 = new BWSmoke(x - w / 3, y - h - 2, 8, 28);
    smoke2 = new BWSmoke(x + w / 8, y - h - 8, 7, 20);
  }

  void render()
  {
    stroke(0);
    // sides
    line(x - w / 2, y, x - w / 2, y - h);
    line(x + w / 2, y, x + w / 2, y - h);
    // roof
    line(x - w / 2, y - h, x - w / 4, y - h + 7);
    line(x - w / 4, y - h + 7, x, y - h - 12);
    line(x, y - h - 12, x + w / 8, y - h);
    line(x + w / 8, y - h, x + w / 4, y - h - 20);
    line(x + w / 4, y - h - 20, x + w * 3 / 8, y - h + 5);
    line(x + w * 3 / 8, y - h + 5, x + w / 2, y - h);

    // draw windows
    fill(255);
    for(int i = y - h + 25; i < y - 30; i += 25)
    {
      for(int j = -1; j < 2; j++)
      {
        rect(x - 5 + ((w / 3) * j), i, 8, 12);
      } 
    }

    // door
    fill(255);
    rect(x - w / 16, y - 20, w / 8, 20);

    smoke1.render();
    smoke2.render();
  }
}


