class Nave {
  int x=300;//posicion x en la mitad de la pantalla
  int y=580;//posicion y en el borde -20 de la pantalla
  boolean derecha = false; // variable booleana derecha iniciada en flase
  boolean izquierda = false;// variable izq iniciada en false
  boolean arriba = false;// variable arriba iniciada en false
  boolean abajo = false;// variable abajo iniciada en false

  void dibujar() {
    image(FARAON,x,y);
    //imageMode(CENTER);
    //ellipse(x, y, 10, 10);//dibuja una elipse en la posicion xy
  }
  void avanzar () {
    // avance 
    if (derecha) {// si derecha es verdadero entonces
      x=x+3;// se altera en 3 la posicion de x
    }
    if (izquierda) {// si izquierda es verdadero entonces
      x=x-3;// se altera en -3 la posicion de x
    }
    if (arriba) {// si arriba es verdadero entonces
      y=y-3;// se altera en -3 la posicion de y
    }
    if (abajo) {// si abajo es verdadero entonces
      y=y+3;// se altera en 3 la posicion de y
    }
  }
  void teclaPulsada (int code) {// cambia el keyCode como code 
    if (code == 39) {//permite el movimiento hacia la derecha
      derecha = true;// inicia el movimiento a la derecha de la elipse
    }
    if (code == 37) {// permite el movimiento a la izquierda
      izquierda = true;//inicia el movimiento a la izquierda
    }
    if (code == 38) {// permite el movimiento para arriba 
      arriba = true;// inicia el movimiento para arriba
    }
    if (code == 40) {// permite el movimiento para abajo
      abajo = true;// inicia el movimiento para abajo
    }
    if (code == 32) {// permite reconocer la tecla espacio
     // disparar
     Bala aux = new Bala(x, y);// llama el array bala y crea nuevas balas
     balas.add(aux);// llama a balas como auxiliar
     }
  }

  void teclaSoltada (int code) {// permite reconocer cuando se deja de pulsar
    if (code == 39) {//detiene el movimiento hacia la derecha
      derecha = false;//detiene el movimiento a la derecha al volver el booleano como falso
    }
    if (code == 37) {//detiene el movimiento hacia la izq
      izquierda = false;// detiene el movimiento al cambiar el booleano a false
    }
    if (code == 38) {// detiene el movimiento hacia arriba
      arriba = false;// detiene el movimiento hacia arriba al cambiar el booleano como false
    }
    if (code == 40) {// detiene el movimiento hacia abajo
      abajo = false;// detiene el movimiento al cambiar el booleano a false
    }
  }
}
