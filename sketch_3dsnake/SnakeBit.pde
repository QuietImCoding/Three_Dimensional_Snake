public class SnakeBit {
  float x, y, z;
  float bitSize;

  SnakeBit(float x, float y, float z, float bitSize) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.bitSize = bitSize;
  }

  void move(float dx, float dy, float dz) {
    this.x += dx;
    this.y += dy;
    this.z += dz;
  }

  void display() {
    fill(0, 245, 0);
    pushMatrix();
    translate(x, y, z);
    box(bitSize);
    popMatrix();
  }
}