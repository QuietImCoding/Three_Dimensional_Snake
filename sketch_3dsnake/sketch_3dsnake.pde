SnakeBody s;
float dx, dy, dz;

void setup() {
  size(500, 500, P3D);
  background(0);
  s = new SnakeBody(width/2, height/2, 0, 20);
  dx = 1;
  dy = 0;
  dz = 0;
  frameRate(10);
}

void draw() {
  background(0);
  s.move(dx, dy, dz);
  s.display();
}

void keyPressed() {
  if (key == 'w') {
    dx = 0;
    dy = 1;
  }
  if (key == 'a') {
    dx = -1;
    dy = 0;
  }
  if (key == 's') {
    dx = 0;
    dy = -1;
  }
  if (key == 'd') {
    dx = 1;
    dy = 0;
  }
  if (key == ' ') {
    dx = 0;
    dy = 0;
  }
}