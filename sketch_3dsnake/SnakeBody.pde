public class SnakeBody {
  ArrayList<SnakeBit> segments;
  float size;
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
    segments.remove(segments.size()-1);
    for (int i = 0; i < segments.size(); i++) {
      segments.get(i).move(distX * size, distY * size, distZ * size);
    }
    segments.add(new SnakeBit(segments.get(0).x + (distX + size), segments.get(0).y + (distY * size), segments.get(0).z + (distZ * size), size));
  }

  void display() {
    for (int i = 0; i < segments.size(); i++) {
      segments.get(i).display();
    }
  }
}