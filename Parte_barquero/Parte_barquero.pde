obstaculo[] cala = new obstaculo[5];//total de moleculas
PImage calavera;

import processing.sound.*;
PFont font;
SoundFile musica;
 Nave nve = new Nave();
ArrayList<Bomba> bombas = new ArrayList <Bomba> ();//crea un array de balas enemigas
ArrayList<Enemigo> enemigos = new ArrayList <Enemigo> ();// crea un array de enemigos
ArrayList<Boss> boss = new ArrayList <Boss>();
ArrayList<Bala> balas = new ArrayList <Bala> ();//crea un array de balas
int maxImages=6;
PImage [] images = new PImage [maxImages];
String [] filenames = {"OFRENDA1.png","OFRENDA2.png","OFRENDA3.png"};
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
long tiempo=0;
int maxpuntaje = 0;
int maxvidas=0;
int maxLifeBoss=0;
int savedTime;
int totalTime = 15000;
boolean introScreen = true;
boolean winScreen=true;
boolean segundaScreen=true;
boolean luchaScreen=false;
boolean anubisScreen=false;
boolean piramideScreen=false;
boolean gameOverScreen=true;
boolean instruccionScreen = true;
int nextLevel;
int puntajeLevel = 30;
zombie[] bolas = new zombie[numeroBolas]; 

void setup() {      
  size(600, 600);
  
  
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
  for( int i =0; i < filenames.length; i++){
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
  for (int i=0; i<1;i++){
  Boss nvoBoss = new Boss(i*20+10);
  boss.add(nvoBoss);
  
  }
  for(int i=0; i<cala.length; i++) {
    cala[i] = new obstaculo(random(300,500),random(300,500),50);  
  }
}

void draw() {
  background(fondo);
  //nve.avanzar();//llama la clase avanzar
  //nve.dibujar();//llama la clase dibujar
  if (keyPressed) {
    if (key == '2') {
      segundaScreen = false;
    }
  }
  if (segundaScreen == true) {
    image(instrucciones,0,0);
    if(key=='q'){
    instruccionScreen = false;
    }
    if(instruccionScreen == false){
    image(pelea, 0, 0);
    fill(#EDEDED);
    textSize(30);
    text("Ofrendas max : " +maxpuntaje, 200, 400);
  }
    }else {

    for (int i = 0; i < bolas.length; i++) {
      bolas[i].caida();
      bolas[i].colision();
      bolas[i].puntaje();
    }
      for(int i=0; i<cala.length; i++) { // llamados oxigeno
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
    text("[3] para avanzar",360,565);
  } else {
    for (int i = 0; i < bolas.length; i++) {
      bolas[i].levelDos();
    }
  }
  if (piramideScreen==true) {
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
  if(gameOverScreen==false){
  image(gameOver,0,0);
  fill(#FFFFFF);
  textSize(20);
  text("[esc] para salir",300,565);
  }
  if(winScreen==false){
  image(win,0,0);
  fill(#FFFFFF);
  textSize(20);
  text("[esc] para salir", 300,565);
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
   image(images[imageIndex],x,y);
  
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
  void vidas (){
  fill(#FFFBFA);
  text("Amuletos: " + vidas, 355,30);
  }
  void lifeBoss(){
  fill(#FFFBFA);
  text("Anubis: " +lifeBoss, 30,30);
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
      if(key=='3'){
      piramideScreen=true;
      }
  }
  
  void levelCuatro(){
    if(numeroEnemigos<=0){
     exit();
    }
  }
}
