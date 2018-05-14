int gamestate = 1;
int score = 0;
int lastscore = 0;
int x = -200, y, vy = 0, wx[] = new int[2], wy[] = new int[2];

PImage wall, icon, background;

void setup() {
  //--------- BACKGROUND IMAGES ---------
  //background = loadImage("metal.png");
  //background = loadImage("lava.jpg");
  //background = loadImage("grass.jpg");
  //background = loadImage("ice.jpg");
  //background = loadImage("water.jpg");
  
  // -------- ICON IMAGES ----------- 
  //icon = loadImage("Casey-Reas.png");
  //icon = loadImage("yoko-ono.png");
  //icon = loadImage("marcell-duchamp.png");
  //icon = loadImage("charlotte-moorman.png");
  //icon = loadImage("john-cage.png");

  // ---------- WALL COLOR ---------
  //wall =loadImage("purple.png");
  //wall =loadImage("red.png");
  //wall =loadImage("black.png");
  wall =loadImage("teal.png");
  //wall =loadImage("canary.png");
  
  size(600,800);
  fill(255);
  textSize(40);  
}
void draw() {
  if(gamestate == 0) {
    
    // ------- BACKGROUND COLOR ----------
    //background(255, 255, 255); // white
    //background(66, 244, 69);   // green
    //background(244, 134, 66);  // Orange
    background(244, 66, 212);   // pink
    
    // Make image redraw after 1800 
    //imageMode(CORNER);
    //image(background, x, 0);
    //image(background, x + background.width, 0);
    x -= 6; 
    if(x == -1800) {
      x = 0;
    }
    
    
    vy += 1;  //Gravity
    y += vy; 
    
    for(int i = 0 ; i < 2; i++) {  // Spawn new walls at different places
      imageMode(CENTER);
      image(wall, wx[i], wy[i] - (wall.height/2+100));
      image(wall, wx[i], wy[i] + (wall.height/2+100));
      if(wx[i] < 0) {
        wy[i] = (int)random(200,height-200);
        wx[i] = width;
      }
      if(wx[i] == width/2) {
        score++;
      }

      if( (abs(width / 2 - wx[i]) < 25 && abs(y - wy[i]) > 100) || y > height || y < 0 ) {  // Collision Detector
        gamestate=1;
        fill(0);
        text("GAME OVER!", 200, height/2.2);  // Game Over / Death
        text("Last Score: " + lastscore, 10, 50);
        lastscore = score;
      }
      
      wx[i] -= 6; // Difficulty / Speed of Obstacles
      
    }
    ellipse(width/2, y, 25, 25);
    //image(icon, width/2, y);
    text("" + score, 10, 795);   // Score
  }
  else {
    fill(0);
    delay(800);
    text("PRESS SPACE TO START!", 70, height/2);
  }
}


void keyPressed() {
 if(keyPressed) {
  if(key == ' ') {
    vy = -17;  // Hhop
    if(gamestate==1) {  // Start of game initializer
      wx[0] = 600;
      wy[0] = y = height/2;
      wx[1] = 900;
      wy[1] = 600;
      x = 0;
      gamestate = 0;
      score = 0;
    }
    
   }
  }
}