class painting{
  //global variables
  float x, y, sizeX, sizeY, oldSizeX, oldSizeY;
  int random_aantal;
  int[] c;
  //contstructor 
  painting(int _x, int _y, int[] _colours){
    x = _x;
    y = _y;
    c = _colours;
  }
  
  void build(){
    // voer alle functies uit
    display();
  }
  
  void display(){
    colorMode(HSB);
    noStroke();
    
    fill(c[0], c[1], c[2]);
    rect(x, y, 600, 600);
    
    random_aantal = int(random(4));
    
    fill(c[3], c[4], c[5]);
    sizeX = random(400, 550);
    sizeY = random(400, 550);
    x += 300 - sizeX/2;
    y += 300 -  sizeY/2;
    rect(x + random(-30,30),y + random(-30,30), sizeX, sizeY);
    if(random_aantal > 2){
      fill(c[6], c[7], c[8]);
      oldSizeX = sizeX;
      oldSizeY = sizeY;
      sizeX = random(200, 350);
      sizeY = random(200, 350);
      x += oldSizeX/2 - sizeX/2;
      y += oldSizeY/2 -  sizeY/2;
      rect(x + random(-20,20),y + random(-20,20), sizeX, sizeY);
      
      if(random_aantal == 3){
        fill(c[9], c[10], c[11]);
        oldSizeX = sizeX;
        oldSizeY = sizeY;
        sizeX = random(20, 150);
        sizeY = random(20, 150);
        x += oldSizeX/2 - sizeX/2;
        y += oldSizeY/2 -  sizeY/2;
        rect(x + random(-10,10),y + random(-10,10), sizeX, sizeY);
      }
    }
  }
}
