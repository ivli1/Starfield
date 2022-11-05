Particle[] pop;

void setup(){
  size(500,500);
  //noStroke();
  //frameRate(10);
  pop = new Particle[1000];
  for(int i = 1; i < pop.length; i++){
    pop[i] = new Particle();
  }
  pop[0] = new Oddball();
}

void draw(){
  background(0);
  for(int i = 0; i < pop.length; i++){
    pop[i].show();
    pop[i].move();
  }
  
}

class Particle{
  double myX, myY, col, ang, spd, siz;
  Particle(){
    myX = width/2;
    myY = height/2;
    col = color(#cccccc);
    ang = (double)(Math.random()*(2*Math.PI));
    spd = (double)(Math.random()*5)+1;
    siz = spd*2;
  }
  void move(){
    myX += Math.cos(ang)*spd;
    myY += Math.sin(ang)*spd;
    if(myX >= width || myX <= 0 || myY >= height || myY <= 0){
      if(ang <= PI/2 && ang >= 0){
        myX = width/2 + (int)(Math.random()*10);
        myY = height/2 + (int)(Math.random()*10);
      }else if(ang >= PI/2 && ang <= PI){
        myX = width/2 - (int)(Math.random()*10);
        myY = height/2 + (int)(Math.random()*10);
      }else if(ang >= PI && ang <= (3*PI)/2){
        myX = width/2 - (int)(Math.random()*10);
        myY = height/2 - (int)(Math.random()*10);
      }else if(ang >= (3*PI)/2 && ang <= 2*PI){
        myX = width/2 + (int)(Math.random()*10);
        myY = height/2 - (int)(Math.random()*10);
      }
    }
  }
  void show(){
    fill((int)col);
    strokeWeight(3);
    stroke(#ffffff);
    line((float)myX, (float)myY, (float)(myX+Math.cos(ang)/siz*20),(float)(myY +Math.sin(ang)/siz*20));
  }
}

class Oddball extends Particle{
  Oddball(){
    myX = width/2;
    myY = height/2;
    col = color(#cccccc);
    ang = (double)(Math.random()*(2*Math.PI));
    spd = (double)(Math.random()*5)+1;
    siz = spd*2;
  }
  void show(){
    fill((int)col);
    stroke(#cccccc);
    ellipse((float)myX, (float)myY, 30,30);
  }
  void move(){
    if(myX >= width || myX <= 0 || myY >= height || myY <= 0){
      myX = width/2;
      myY = height/2;
    }
    if(myX == width/2 && myY == height/2){
      myX += (double)(Math.random()*3-1);
      myY += (double)(Math.random()*3-1);
    }else if(myX > width/2 && myY > height/2){
      myX += (double)(Math.random()*10-3);
      myY += (double)(Math.random()*10-3);
    }else if(myX > width/2 && myY < height/2){
      myX += (double)(Math.random()*10-3);
      myY -= (double)(Math.random()*10-3);
    }else if(myX < width/2 && myY > height/2){
      myX -= (double)(Math.random()*10-3);
      myY += (double)(Math.random()*10-3);
    }else if(myX < width/2 && myY < height/2){
      myX -= (double)(Math.random()*10-3);
      myY -= (double)(Math.random()*10-3);
    }
  }
}
