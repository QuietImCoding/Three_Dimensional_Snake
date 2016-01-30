SnakeBody s;
Apple a;
float dx, dy, dz;
int mode;
float maxPlaneX, minPlaneX, maxPlaneY, minPlaneY;
Button b;

void setup() {
  size(500, 500, P3D);
  background(0);
  s = new SnakeBody((int)(width/40)*20, (int)(height/40)*20, 0, 20);
  a = new Apple(((int)random((width/20)-1))*20+20, ((int)random((height/20)-1))*20+20, 0, 20); 
  dx = 1;
  dy = 0;
  dz = 0;
  b = new Button("PLAY", width/4, height/4, width/2, height/2);
  mode = 1;
  //frameRate(10);
}

void draw() {
  if (mode == 1) {
    background(0);
    b.display();
    if (b.isClicked()) {
      mode = 2;
    }
  }
  if (mode == 2) {
    lights();
    checkKeys();
    if (frameCount%6==0) {
      textSize(15);
      text(s.segments.size(), 15, 15);
      //rotateX(PI/6);
      background(0);
      s.move(dx, dy, dz);
      s.display();
      if (s.ate(a)) {
        a.move(((int)random((width/20)-1))*20+20, ((int)random((height/20)-1))*20+20, 0); 
        s.grow();
      }
      a.display();
    }
    if (!inBounds()) {
      mode = 3;
    }
    if (s.isDead) {
      mode = 3;
    }
  }
  if (mode == 3) {
    //background(0);
    fill(255, 0, 0);
    textSize(width/8);
    textAlign(CENTER, CENTER);
    text("YOU LOSE", width/2, height/3);
    textSize(25);
    text("Score: " + (s.segments.size()-5), width/2, height/2);
    b = new Button("Play Again", width/4, 3 * height/4, width/2, height/8);
    b.display();
    if (b.isClicked()) {
      s = new SnakeBody((int)(width/40)*20, (int)(height/40)*20, 0, 20);
      a = new Apple(((int)random((width/20)-1))*20+20, ((int)random((height/20)-1))*20+20, 0, 20); 
      dx = 1;
      dy = 0;
      dz = 0;
      mode = 2;
    }
  }
}

boolean inBounds() {
  return s.getPosition()[0] - 20 >= 0 && s.getPosition()[0] + 20<= width && s.getPosition()[1] -20 >= 0 && s.getPosition()[1] +20 <= height;
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