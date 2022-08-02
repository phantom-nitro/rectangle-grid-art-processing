PImage img;
float bg_bright = 50;

int cell = 10; //15
float cols = floor(1080/ cell);
float rows = floor(1080 / cell);
float numCells = cols * rows;

color[] c = new color[int(numCells)];

float anglepl = 0.0;

int f = 0;

void setup() {
  size(1080, 1080);
  noStroke();
  background(255);
  rectMode(CENTER);
  frameRate(30);



  img = loadImage("star.jpg");
  img.resize(int(rows), int(cols));
  //image(img, 0, 0);


  int num = 0;

  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      c[num] = img.get(i, j);

      num++;
    }
  }
}

void draw() {
  background(bg_bright);

  for (int i = 0; i < numCells; i++) {
    float col = i%cols;
    float row = floor(i / cols);
    float y = col * cell;
    float x = row * cell;

    float bright = brightness(c[i]);
    float angle = map(bright, 0, 255, 0, TWO_PI);
    float size = map(bright, 0, 255, 0.5, 3);

    pushMatrix();

    translate(x + 5, y + 5);
    rotate(angle + anglepl);


    //color
    //if (bright < bg_bright) bright = bright + bg_bright + 40;
    //fill(bright);
    //fill(250);

    fill(c[i]);




    //draw rectangle
    rect(0, 0, 6 * size, 2 * size); //25 10
    popMatrix();
  }
  anglepl += 0.06;

  if (f++ < 300) {
    saveFrame("line-######.png");
    println(f);
  }
}
