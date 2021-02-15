class obstaculo{
  float ox;
  float oy;
  float od;
  float oxvel;
  float oyvel;// variables obstaculo
  
  obstaculo(float oposX, float oposY, float odiametro){
    ox = oposX;
    oy = oposY;
    od = odiametro;
    
    oxvel = 8;
    oyvel = 3;// variables velocidad de movimiento
  }
  
  void ovelocidad(){//velocidad de movimiento
      ox += oxvel;
      oy += oyvel; 
    }
  void ocolision() {
      
      if ((ox<0) || (ox>width-od)){//rebotes en x
        oxvel = -oxvel;
      } 
       
      if((oy<10) || (oy>height-od)) {// rebotes en y
        oyvel = -oyvel; 
      }
       
    }
    
    void odisplay() { //imagen de oxigeno
    image(calavera, ox, oy);
    }
    
  void odestruir() { // si toca un oxigeno, devuelve a la pantalla de inicio
     if (mousePressed) { 
      float odistancia = dist(mouseX, mouseY, ox, oy);
      if (odistancia<od) {
        
     
segundaScreen=true;
luchaScreen=false;
anubisScreen=false;
piramideScreen=false;


        for(int i=0; i<cala.length; i++) {
         cala[i] = new obstaculo(random(300,500),random(300,500),50); 
        
           } 
         
         puntaje=0;
        }  
    }
}
}
