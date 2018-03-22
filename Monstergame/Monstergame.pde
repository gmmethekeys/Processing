StickGuy[] people;
Building building1;
Building building2;
Monster monster;
int peopleCount = 10;
int ground;

void setup()
{
  background(255);
  size(400, 400, P2D);

  ground = height - 25;

  people = new StickGuy[peopleCount];
  for(int i = 0; i < peopleCount; i++)
  {
    // start at doors 150 and 325
    people[i] = new StickGuy(random(0 , width), ground);
  }

  building1 = new Building(150, ground, 120, 75);
  building2 = new Building(325, ground, 220, 90);
  monster = new Monster();
}

void draw()
{
  background(255);

  building1.render();
  building2.render();

  // draw people
  for(int i = 0; i < peopleCount; i++)
  {
    if(people[i].render() == true)
    {
      // start at doors 150 and 325
      people[i] = new StickGuy(random(-1 ,1) > 0 ? 150 : 325, ground);
    }
  } 

  monster.render();

  // draw ground
  stroke(0);
  line(0, ground, width, ground);
}

void mousePressed()
{
  stroke(0);
  monster.shoot(mouseX, ground);

  for(int i = 0; i < peopleCount; i++)
  {
    StickGuy guy = people[i];
    if(guy.hitTest(mouseX, mouseY) == true)
    {
      guy.kill();
    }
  } 
}

void keyPressed()
{
  if(keyCode == 'S')
  {
    saveFrame("monster.png");
  }
}





