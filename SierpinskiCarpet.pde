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
float angle2;
float dia = 300;
boolean isSpining = true;
int directionn = 1;
int colr1 = (int)(Math.random()*150) + 100;
void setup() {
  size(800, 600);
}

void draw() {
  background(0);
  stroke(1);
  translate(width/2, height/2);
  fill(255, 0, 0);
  pushMatrix();
  rotate(radians(angle));
  fractal(dia/2, 0, dia);
  fractal(0.0, dia/2, dia);
  fractal(-dia/2, 0, dia);
  fractal(0.0, -dia/2, dia);
  popMatrix();

  pushMatrix();
  rotate(radians(-angle));
  fill(#FFE967);
  star(0, 0, 30, 70, 5);
  popMatrix();
  
  noStroke();
  fill(255);
  float x = width;
  float len2 = 25;
  int number = 50;
  illusion(x, number, len2, radians(angle2));
  
  if (isSpining) {
    angle += 3 * directionn;
    angle2 -= 0.1;
  }
  if (dia >= 1625) {
    dia = 800;
  }
}


public void fractal(float x, float y, float siz) {
  fill(colr1, colr1, colr1);
  ellipse(x, y, siz, siz);
  if (siz > 100) {
    fractal(x - siz/4, y, siz/2);
    fractal(x, y + siz/4, siz/2);
    fractal(x + siz/4, y, siz/2);
    fractal(x, y - siz/4, siz/2);
  }
}

//STAR CODE FROM PROCESSING WEBSITE NOT MY WORK
public void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}


public void illusion(float x, int num, float len2, float rotate){
  if (num > 0){
   pushMatrix();
   rotate(rotate);
   ellipse(x, 0, len2, len2);
   popMatrix();
   
   illusion(x * 0.95, num - 1, len2, rotate + radians(angle2));
  
  }
}


public void keyPressed()
{
  if (key=='w')
  {
    dia -= 25;
  }
  if (key=='s')
  {
    dia += 25;
  }
  if (key == ' ') {
    if (isSpining) {
      isSpining = false;
    } else {
      isSpining = true;
    }
  }
  if (key == 'r') {
    directionn *= -1;
  }
  if (key == 'c') {
    colr1 = (int)(Math.random()*150) + 100;
  }
}
