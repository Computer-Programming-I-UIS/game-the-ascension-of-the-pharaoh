import ddf.minim.*;
Minim minim;
Minim minim2;
Minim minim3;
Minim minim4;
Minim minim5;
AudioPlayer player2;
AudioPlayer player;
AudioPlayer player3;
AudioPlayer player4;
AudioPlayer player5;
Nave nve = new Nave();
ArrayList<Bomba> bombas = new ArrayList <Bomba> ();//crea un array de balas enemigas
ArrayList<Enemigo> enemigos = new ArrayList <Enemigo> ();// crea un array de enemigos
ArrayList<Boss> boss = new ArrayList <Boss>();
ArrayList<Bala> balas = new ArrayList <Bala> ();//crea un array de balas
int maxImages=6;
PImage [] images = new PImage [maxImages];
String [] filenames = {"OFRENDA1.png", "OFRENDA2.png", "OFRENDA3.png"};
obstaculo[] cala = new obstaculo[5];//total de moleculas
PImage calavera;
int imageIndex=0;
int numeroEnemigos=25;
int numeroBolas = 10;
int puntaje = 0;
int vidas = 3;
int lifeBoss=100;
PImage inicio;
PImage win;
PImage fondo;
PImage instrucciones;
PImage pelea;
PImage jefe;
PImage anubis;
PImage FARAON;
PImage enemigo;
PImage piramide;
PImage Papiros;
PImage FIREBALL;
PImage gameOver;
PImage OFRENDA1;
PImage OFRENDA2;
PImage OFRENDA3;
PImage OFRENDA4;
PImage OFRENDA5;
PImage OFRENDA6;
PImage credits;
long tiempo=0;
int maxpuntaje = 0;
int maxvidas=0;
int maxLifeBoss=0;
int savedTime;
int totalTime = 20000;
boolean introScreen = true;
boolean winScreen=true;
boolean segundaScreen=true;
boolean luchaScreen=false;
boolean anubisScreen=false;
boolean piramideScreen=false;
boolean gameOverScreen=true;
boolean instruccionScreen = true;
boolean creditosScreen=true;
int nextLevel;
int puntajeLevel = 30;
zombie[] bolas = new zombie[numeroBolas]; 

void setup() {      
  size(600, 600);
  minim = new Minim (this);
  player = minim.loadFile("thFloor.mp3");
  minim2 = new Minim (this);
  player2 = minim.loadFile("Awful.mp3");
  minim3 = new Minim (this);
  player3 = minim.loadFile("Tak.mp3");
  minim4 = new Minim (this);
  player4 = minim.loadFile("Anubis.mp3");
  player4.setGain(-10);// ajustamos el volumen inicial a uno tolerable
  minim5 = new Minim (this);
  player5 = minim.loadFile("Muerte.mp3");
  player5.setGain(-15);// ajustamos el volumen inicial a uno tolerable
  credits = loadImage("credits.jpg");
  calavera = loadImage("calavera.png");
  inicio = loadImage("inicio.jpg");
  win = loadImage("win.jpg");
  fondo = loadImage("fondo.jpg");
  instrucciones = loadImage("Instrucciones.jpg");
  pelea = loadImage("pelea.jpg");
  anubis = loadImage("anubis.jpg");
  FARAON= loadImage("FARAON.png");
  enemigo= loadImage("enemigo.png");
  FIREBALL=loadImage("FIREBALL.png");
  Papiros = loadImage("Papiros.png");
  gameOver= loadImage("gameOver.jpg");
  jefe = loadImage("boss.png");  
  piramide = loadImage("piramides.jpg");
  for ( int i =0; i < filenames.length; i++) {
    images[i] = loadImage(filenames[i]);
  }
  textSize(20);
  savedTime = millis();

  for (int i = 0; i < bolas.length; i++) {
    bolas[i] = new zombie();
  }
  for (int i=0; i < 15; i++) {// crea un total de 25 enemigos
    Enemigo nvoEnemigo= new Enemigo(i * 20 +10);
    enemigos.add(nvoEnemigo);
  }
  for (int i=0; i<1; i++) {
    Boss nvoBoss = new Boss(i*20+10);
    boss.add(nvoBoss);
  }
  for (int i=0; i<cala.length; i++) {
    cala[i] = new obstaculo(random(300, 500), random(300, 500), 50);
  }
  player.play();
}

void draw() {
  background(fondo);
  
  //nve.avanzar();//llama la clase avanzar
  //nve.dibujar();//llama la clase dibujar
  if (keyPressed) {
    if (key == '2') {
      segundaScreen = false;
      player2.play();
    }
  }
  if (segundaScreen == true) {
    image(instrucciones, 0, 0);
    if (key=='q') {
      instruccionScreen = false;
      player.pause();
      
    }
    if (instruccionScreen == false) {
      
      image(pelea, 0, 0);
      fill(#EDEDED);
      textSize(30);
      text("Ofrendas max : " +maxpuntaje, 200, 400);
    }
  } else {

    for (int i = 0; i < bolas.length; i++) {
      bolas[i].caida();
      bolas[i].colision();
      bolas[i].puntaje();
    }
    for (int i=0; i<cala.length; i++) { // llamados oxigeno
      cala[i].ovelocidad();
      cala[i].ocolision();
      cala[i].odisplay(); 
      cala[i].odestruir();
    }
  }

  if (keyPressed) {
    if (key == '1' ) {
      introScreen=false;
    }
  }
  if (introScreen == true) {
    image (inicio, 0, 0);
  } else {
    for (int i = 0; i < bolas.length; i++) {
      bolas[i].GAMEOVER();
    }
  }
  if (luchaScreen==true) {
    
    image (anubis, 0, 0);
    textSize(25);
    fill(#FFFBFA);
    text("[3] para avanzar", 360, 565);
  } else {
    
    for (int i = 0; i < bolas.length; i++) {
      bolas[i].levelDos();
    }
  }
  if (piramideScreen==true) {
    player.pause();
    image(piramide, 0, 0);
    nve.avanzar();//llama la clase avanzar
    nve.dibujar();//llama la clase dibujar  
    for (Enemigo x : enemigos) {//crea los enemigos
      x.avanzar();
      x.dibujar();
    }
    for (Bala x : balas) {//crea balas
      x.avanzar();
      x.dibujar();
    }
    for (Bomba x : bombas) {//crea bombas
      x.avanzar();
      x.dibujar();
    }
    colisionEnemigoNave();
    colisionBalaEnemigo();
    colisionBalaBomba();
    colisionBombaNave();
    colisionBossNave();
    colisionBalaBoss();
    for (int i = 0; i < bolas.length; i++) {
      bolas[i].vidas();
      bolas[i].lifeBoss();
    }
    for (Boss a : boss) {//crea los enemigos
      a.avanzar();
      a.dibujar();
    }
  } else {
    for (int i = 0; i < bolas.length; i++) {
      bolas[i].levelTres();
    }
  }
  if (gameOverScreen==false) {
    image(gameOver, 0, 0);
    player5.play();
    player4.pause();
    player3.pause();
    player2.pause();
    
    fill(#FFFFFF);
    textSize(20);
    text("[esc] para salir", 300, 565);
  }

  if (winScreen==false) {
    image(win, 0, 0);
    player3.play();
    player2.pause();
    player5.pause();
    fill(#151212);
    textSize(20);
    text("Press [0] Creditos", 250, 565);
  }
  if (key=='0') {
    winScreen=true;
    creditosScreen=false;
    player4.play();
    player3.pause();
    player2.pause();
  }
  if (creditosScreen==false) {
    image(credits, 0, 0);
    fill(#080808);
    textSize(20);
    text("Press [esc] para salir", 250, 500);
  }
}



void keyPressed () {//permite controlar la elipse
  //println("" + keyCode);
  nve.teclaPulsada(keyCode);
}

void keyReleased() {// permite leer teclas al soltarlas
  nve.teclaSoltada(keyCode);
}

class zombie {
  float d = 50;
  float x = random(600);
  float y = random(height);

  void caida() {
    y = y +3 ;   //VELOCIDAD
    //fill(0,10,200,60);
    //ellipse(x, y, d, d);
    image(images[imageIndex], x, y);

    if (y>height) {
      x = random(600);
      y = random(-100);
    }
  }


  void colision () {
    float distancia = dist(mouseX, mouseY, x, y);
    if (mousePressed) {
      if (distancia < d) {
        //println("hola");
        x = -1000;
        puntaje++;
        maxpuntaje = max(puntaje, maxpuntaje);
        imageIndex = int(random(filenames.length));
      }
    }
  } 

  void puntaje () {
    fill(#DDFA0D);
    text("Ofrendas = " +puntaje, 380, 25);
  }
  void vidas () {
    fill(#FFFBFA);
    text("Amuletos: " + vidas, 355, 30);
  }
  void lifeBoss() {
    fill(#FFFBFA);
    text("Anubis: " +lifeBoss, 30, 30);
  }

  void GAMEOVER() {

    int passedTime = millis() - savedTime;  //resta de tiempo
    if (passedTime > totalTime) {
      segundaScreen = true;
      puntaje = 0;
      savedTime= millis();
      //for (int i = 0; i < bolas.length; i++) {
      //  bolas[i] = new zombie();
      //}
    }
  }
  void levelDos() {
    int puntajeMaximo = maxpuntaje - nextLevel;
    if (puntajeMaximo > puntajeLevel) {
      luchaScreen=true;
      nextLevel= 5;
    }
  }

  void levelTres() {
    if (key=='3') {
      piramideScreen=true;
    }
  }
  void creditos() {
    if (key=='c') {
      creditosScreen=false;
    }
  }

  void levelCuatro() {
    if (numeroEnemigos<=0) {
      exit();
    }
  }
}
