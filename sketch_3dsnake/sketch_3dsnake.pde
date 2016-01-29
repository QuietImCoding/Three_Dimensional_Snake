SnakeBody s;
Apple a;
float dx, dy, dz;

void setup() {
  size(500, 500, P3D);
  background(0);
  s = new SnakeBody((int)(width/40)*20, (int)(height/40)*20, 0, 20);
  a = new Apple((int)random(width/20)*20, (int)random(height/20)*20, 0, 20); 
  dx = 1;
  dy = 0;
  dz = 0;
  frameRate(5);
}

void draw() {
  //rotateX(PI/6);
  background(0);
  checkKeys();
  s.move(dx, dy, dz);
  s.display();
  a.display();
}

void checkKeys() {
  if (keyPressed) {
    if (key == 'w') {
      dx = 0;
      dy = -1;
      dz = 0;
    }
    if (key == 'a') {
      dx = -1;
      dy = 0;
      dz = 0;
    }
    if (key == 's') {
      dx = 0;
      dy = 1;
      dz = 0;
    }
    if (key == 'd') {
      dx = 1;
      dy = 0;
      dz = 0;
    }
    if (key == 'e') {
      dx = 0;
      dy = 0;
      dz = 1;
    }
    if (key == 'f') {
      dx = 0;
      dy = 0;
      dz = -1;
    }
    if (key == ' ') {
      dx = 0;
      dy = 0;
      dz = 0;
    }
  }
}