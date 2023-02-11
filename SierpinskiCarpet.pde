/*int len;
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
*/
float angle;
void setup() {
  size(800, 600);
  noStroke();
  fill(0, 15, 30);
}

void draw() {
  background(255);
  float x = width;
  float dia = 25;
  int num = 50;

  translate(width/2, height/2);

  // call recursive function to draw spirals
  pushMatrix();
  drawSpiral(x, dia, num, radians(angle));
  angle += 0.1;
  popMatrix();
}

// recursive function to draw spirals
void drawSpiral(float x, float dia, int num, float rotation) {
  if (num <= 0) {
    return;
  }

  // apply rotation and draw current circle
  pushMatrix();
  rotate(rotation);
  ellipse(x, 0, dia, dia);
  popMatrix();

  // recurse with updated parameters
  drawSpiral(x * 0.95, dia, num - 1, rotation + radians(angle));

  // apply scaling
}
