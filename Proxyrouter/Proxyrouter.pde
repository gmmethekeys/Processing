String[] lines;
PFont f;
int count = 0;

void setup() {
 size(600,100);
 f = loadFont("Arial Bold.ttf");
 // Loading: http://www.yahoo.com
 lines = loadStrings("http://your_webserver/proxy.php?url=http://www.yahoo.com");
 println(lines);
}

void draw() {
 background(0);
 frameRate(2);
 fill(255);
 textFont(f,12);
 text(lines[count],10,58);
 count = (count + 1) % lines.length;
}

