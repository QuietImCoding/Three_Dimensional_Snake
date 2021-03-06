public class SnakeBody {
  ArrayList<SnakeBit> segments;
  float size;
  boolean isDead;
  SnakeBit head;

  SnakeBody(float x, float y, float z, float size) {
    this.size = size;
    head = new SnakeBit(x, y, z, size);
    segments = new ArrayList<SnakeBit>();
    segments.add(head);
    for (int i = 0; i < 4; i++) {
      segments.add(new SnakeBit(x - ((i + 1) * (size + 1)), y, z, size));
    }
  }

  void move(float distX, float distY, float distZ) {
    segments.add(0, new SnakeBit(segments.get(0).x + (distX * size), segments.get(0).y + (distY * size), segments.get(0).z + (distZ * size), size));
    //segments.get(0).move(distX * size, distY * size, distZ * size);
    segments.remove(segments.size()-1);
  }

  void display() {
    for (int i = 0; i < segments.size(); i++) {
      segments.get(i).display();
    }
    if (segments.size() == 1) {
      isDead = true;
    }
  }
  
  void grow() {
    segments.add(0, new SnakeBit(segments.get(0).x, segments.get(0).y, segments.get(0).z, size));
  }
  
  float[] getPosition() {
    float[] positions = new float[3];
    positions[0] = segments.get(0).x;
    positions[1] = segments.get(0).y;
    positions[2] = segments.get(0).z;
    return positions;
  }
  
  boolean ate(Apple a) {
    return a.x == segments.get(0).x && a.y == segments.get(0).y && a.z == segments.get(0).z;
  }
}