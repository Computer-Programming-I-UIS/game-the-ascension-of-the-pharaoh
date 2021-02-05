class Bala {// se crea una clase llamada Bala
  int x=0;// valor de x en 0
  int y=0;// valor de y en =
  Bala (int px, int py) {// bala recibe valores px y py
    x= px;// se define a x en relacion a px
    y= py;// se define a y en relacion a py
  }
  void dibujar() {// permite dibujar las balas
  image(Papiros,x,y);
    //ellipse(x, y, 5, 5);// crea elipses que seran las balas
  }
  void avanzar() {// permite el movimiento de la bala
    y= y-4;// altera la posicion de las balas en -4
  }
}
class Bomba {// se crea una clase llamada Bomba
  int x=0;// valor de x en 0
  int y=0;// valor de y en 0
  Bomba (int px, int py) {// bomba recibe valores px y py
    x= px;// se define a x en relacion a px
    y= py;// se define a y en relacion a py
  }
  void dibujar() {// permite dibujar las bombas enemigas
  image(FIREBALL,x,y);
    //ellipse(x, y, 5, 5);// crea elipses que seran las bombas enemigas
  }
  void avanzar() {// permite el movimiento de la bomba enemiga
    y= y+3;// altera la posicion de las bombas en 3
  }
}
