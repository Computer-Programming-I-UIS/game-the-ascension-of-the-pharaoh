class Enemigo {// crea una clase llamada Enemigo
  int x=0;// valor de x en 0
  int y=0;// valor de y en 0
  int oldy=0;
  boolean derecha = true;// se inicializa la variable en true
  boolean atqPicada=false;
  Enemigo(int py) {// enemigo recibe valores py
    y= py;// se define a y en relacion a py
    x= int(random(10, 490));//da valores de poscion x aleatoria entre 10 y 490
    int coin = int(random(0, 10));// variable coin con valores aleatorios entre 0 y 10
    if (coin <5) {// si coin es menor a 5
      derecha = true;// derecha se vuelve verdadero
    } else {// sino
      derecha =false;// derecha se vuelve falso
    }
  }
  void dibujar() {// dibuja los enemigos
    //ellipse (x, y, 15, 15);// crea elipses como enemigos
    image(enemigo,x,y);
    
  }
  void avanzar() {// permite el movimiento de los enemigos
    if (atqPicada) {
      y=y+3;
      //perseguir al personaje
      if (nve.x>x) {
        x=x+2;
      } else {
        x=x-2;
      }
      //---------
      if (y>600) {
        y=5;
      }
      if (y<oldy+3 && y> oldy -2) {
        atqPicada= false;
      }

      //-------
    } else {
      if (derecha) {// si derecha es verdadero 
        x=x+2;// el valor de x se altera en 2
      } else {// si no 
        x=x-2;// el valor de x se altera en -2
      }
      if (x > 590) {// si x es mayor a 590
        derecha=false;// derecha pasa a ser falso
      }
      if (x<10) {// si x es menor a 10
        derecha=true;// derecha vuelve a ser verdadero
      }
    }
    //------
    int moneda = int (random (0, 200));
    if (moneda==5) {
      Bomba nvaBomba=new Bomba (x, y);
      bombas.add(nvaBomba);
    }
    //---------
    int coin = int (random(0, 700));
    if (coin==5) {
      oldy=y;
      atqPicada=true;
    }

    //-------
  }
}
