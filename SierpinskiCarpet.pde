int len;
int limit;

public void setup()
{
  background(0);
  size(500, 500);
  len = 500;
  limit = 15;
  sierpinskiCarpet(0, 0, len, limit);
}
public void draw()
{
  background(0);
  sierpinskiCarpet(0, 0, len, limit);
}

public void sierpinskiCarpet(int x, int y, int len, int limit) {
  if (len >= limit) {
    len /= 3;
    for (int i = 0; i < 9; i += 1) {
      if (i == 4) {
        if (x < width + 250) {
          rect(x + len, y + len, len, len);
        }
      } else {
        sierpinskiCarpet(x + (i % 3) * len, y + (i / 3) * len, len, limit);
      }
    }
  }
}

public void keyPressed()
{
  if (key == 'w')
  {
    if (len > 100) {
      len -= 100;
    }
  }
  if (key == 's')
  {
    len += 100;
  }
  if (key == 'e')
  {
    if (limit <= 180) {
      limit += 15;
    }
  }
  if (key == 'r')
  {
    if (limit > 15) {
      limit -= 15;
    }
  }
  if (key == ' ')
  {
    len = 500;
    limit = 15;
  }
}
