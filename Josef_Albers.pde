import processing.pdf.*;

// variables
painting[] paintings = new painting[9];

// positie x, y, kleur 1, 2, 3
int x = 25;
int y = 25;
int[] colours = new int[12];

void setup() {

  colorMode(HSB, 360, 100, 100);
  size(1900, 1900, PDF, "josef_albers.pdf");
  background(0,0,100);
  x = 25;
  y = 25;

  for (int i=0; i<paintings.length; i++) {
    // HBS waardes
    for (int j = 0; j < colours.length; j++) {
      
      // maak beginkleur aan
      
      colours[0] = int(random(0, 360));
      
      // zorg dat er minder zwart en desaturatie is
      int random_p = int(random(100));
      int kans;
      if(random_p > 66){
        kans = 66;
      }else{
        kans = 33;
      }
      colours[1] = int(random(kans, 100));
      colours[2] = int(random(kans, 100)); 
      
      // maak random functie aan om te kiezen tussen: tegenstrijdig, harmonieus of monochroom
      int keuze = int(random(3));
    
      // maak een counter aan om kleuren mee te regelen
      int colourCounter = colours[0];
    
      if(keuze == 0){
        // tegenstrijdig
         if(colourCounter < 180){
           colours[3] = colours[0] + 180;        
         }else{
           int over = 360 - colourCounter;
           colours[3] = over + 180;
         }
         colours[4] = colours[1];
         colours[5] = colours[2];
         
         colourCounter = colours[3];
         if(colourCounter < 270){
           colours[6] = colours[3] + 270;
         }else{
           int over = 360 - colourCounter;
           colours[6] = over + 270; 
         }
         colours[7] = colours[1];
         colours[8] = colours[2];
         
         colourCounter = colours[6];
         if(colourCounter < 90){
           colours[9] = colours[3] + 90;
         }else{
           int over = 360 - colourCounter;
           colours[9] = over + 90; 
         }
           colours[10] = colours[1];
           colours[11] = colours[2]; 
      }else if(keuze == 1){
        // harmonieus
         
         if(colourCounter < 330){
           colours[3] = colours[0] +30;
         }else{
           int over = 360 - colourCounter;
           colours[3] = over +30; 
         }
         colours[4] = colours[1];
         colours[5] = colours[2];
         
         colourCounter = colours[3];
         if(colourCounter < 330){
           colours[6] = colours[3] +30;
         }else{
           int over = 360 - colourCounter;
           colours[6] = over +30; 
         }
         colours[7] = colours[1];
         colours[8] = colours[2];
         
         colourCounter = colours[6];
         if(colourCounter < 330){
           colours[9] = colours[4] +30;
         }else{
           int over = 360 - colourCounter;
           colours[9] = over +30; 
         }
         colours[10] = colours[1];
         colours[11] = colours[2];
        
      }else if(keuze == 2){
        // monochroom
         // zet 1e kleur hetzelfde
         colours[3] = colours[0];
         colours[6] = colours[0];
         colours[9] = colours[0];
         // zet saturatie hetzelfde
         colours[4] = colours[1];
         colours[7] = colours[1];
         colours[10] = colours[1];
         // maak switch tussen licht en donker, ligt aan startkleur
         if(colours[0] > 130){
           colours[5] = int(random(0,180));
           colours[8] = int(random(0,180));
           colours[11] = int(random(0,180));
         }else{
           colours[5] = int(random(180,360));
           colours[8] = int(random(180,360));
           colours[11] = int(random(180,360));
         }
      }
    }
    
    // render de schilderijen, gebruik na 3 een 'nieuwe regel'.
    if (i == 2 || i == 5 || i == 8) {
      paintings[i] = new painting(x, y, colours);
      paintings[i].build();
      y+= 625;
      x = 25;
    } else {
      paintings[i] = new painting(x, y, colours);
      paintings[i].build();
      x += 625;
    }
  }
  exit();
}

