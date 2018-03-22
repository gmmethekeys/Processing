import pitaru.sonia_v2_9.*;

Sample ding;

void setup() {
  size(200,200);
  Sonia.start(this);
  ding = new Sample("Ping.aiff");
}

void draw() {
  background(0);
  noLoop();
}

void mousePressed() {
  ding.play();
}

public void stop() {
  Sonia.stop();
  super.stop();
}
