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
float r;
float len = 300;
boolean isSpining = true;
int directionn = 1;
int colr1 = (int)(Math.random()*150) + 100;
void setup(){
 size(800, 600);
 r = 0;
}

void draw(){ 
  background(0);
  translate(width/2, height/2);
  rotate(radians(r));
  fill(255, 0, 0);
  //rect(0, 0, 50, 50);
  fractal(len/2, 0, len);
  fractal(0.0, len/2, len);
  fractal(-len/2, 0, len);
  fractal(0.0, -len/2, len);
  if (isSpining){
   r += 3 * directionn; 
  }
  System.out.println(len);
  if(len >= 1625){
   len = 800; 
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

public void keyPressed()
{
  if (key=='w')
  {
    len -= 25;
  }
  if (key=='s')
  {
    len += 25;
  }
  if(key == ' '){
   if(isSpining){
    isSpining = false;
   } else {
    isSpining = true;
   }
  }
  if (key == 'r'){
   directionn *= -1;
  }
  if(key == 'c'){
   colr1 = (int)(Math.random()*150) + 100;
  }
}
