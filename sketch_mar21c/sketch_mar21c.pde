void setup() {
 size(400,400);
 smooth(); 
}  

void draw () {
  rectMode(CORNER);
  rect(200,200,20,11);                      //fuesalage
  rect(220,200,15,4);                       //tail
  line(205,211,205,215);                    //part A of landing gear
  line(212,211,212,215);                    //part B of landing gear
  line(200,215,218,215);                    //part C of landing gear
  line(209,200,209,195);                    //part A of Main Rotor
  
  line(190,195,209,195);
  line(209,195,228,195);                      //Need to make these flash as if flying

  line(232,200,238,208);
  line(232,208,238,200);
}
