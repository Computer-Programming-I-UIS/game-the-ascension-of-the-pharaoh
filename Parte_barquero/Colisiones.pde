void colisionBalaEnemigo() {
  ArrayList<Bala> balasElim = new ArrayList <Bala>();
  ArrayList<Enemigo> enemigosElim = new ArrayList <Enemigo>();
  for (Bala b : balas) {
    for (Enemigo e : enemigos) {
      float dist= sqrt(pow(b.x-e.x, 2)+pow(b.y-e.y, 2));
      if (dist < 20) {
        balasElim.add(b);
        enemigosElim.add(e);
      }
    }
  }
  balas.removeAll(balasElim);
  enemigos.removeAll(enemigosElim);
}
void colisionBalaBomba() {
  ArrayList<Bala> balasElim = new ArrayList <Bala>();
  ArrayList<Bomba> bombasElim = new ArrayList <Bomba>();
  for (Bala ba : balas) {
    for (Bomba bo : bombas) {
      float dist= sqrt(pow(bo.x-ba.x, 2)+pow(bo.y-ba.y, 2));
      if (dist < 15) {
        balasElim.add(ba);
        bombasElim.add(bo);
      }
    }
  }
  balas.removeAll(balasElim);
  bombas.removeAll(bombasElim);
}
void colisionBombaNave() {
  for (Bomba b : bombas) {
    float dist= sqrt(pow(b.x-nve.x, 2)+pow(b.y-nve.y, 2));
    if (dist <20) {
      println("Has quedado maldito");
      b.x = -800;
      b.y = -800;
      vidas --;
      maxvidas=max(vidas, maxvidas);
    }
    if (vidas<=0) {
      gameOverScreen=false;
    }
  }
}
void colisionEnemigoNave() {
  for (Enemigo e : enemigos) {
    float dist= sqrt(pow(e.x-nve.x, 2)+pow(e.y-nve.y, 2));
    if (dist < 13) {
      for (Enemigo x : enemigos) {//crea los enemigos
        x.avanzar();
        x.dibujar();
      }
      e.x = -100;
      e.y = -100;
      vidas --;
      maxvidas=max(vidas, maxvidas);
    }
    if (vidas<=0) {
      gameOverScreen=false;
    }
  }
}
void colisionBossNave() {
  for (Boss b : boss) {
    float dist= sqrt(pow(b.x-nve.x, 2)+pow(b.y-nve.y, 2));
    if (dist < 100) {
      for (Boss o : boss) {//crea los enemigos
        o.avanzar();
        o.dibujar();
      }
      b.x = -200;
      b.y = -200;
      vidas --;
      maxvidas=max(vidas, maxvidas);
    }
    if (vidas<=0) {
      gameOverScreen=false;
    }
  }
}
void colisionBalaBoss() {
  ArrayList<Bala> balasElim = new ArrayList <Bala>();
  ArrayList<Boss> bossElim = new ArrayList <Boss>();
  for (Bala i : balas) {
    for (Boss u : boss) {
      float dist= sqrt(pow(i.x-u.x, 2)+pow(i.y-u.y, 2));
      if (dist < 100) {
        balasElim.add(i);
        bossElim.add(u);
        lifeBoss--;
        maxLifeBoss=max(lifeBoss, maxLifeBoss);
      }
      if (lifeBoss==50) {
        for (int p=0; p < 15; p++) {// crea un total de 25 enemigos
          Enemigo nvoEnemigo= new Enemigo(p * 20 +10);
          enemigos.add(nvoEnemigo);
          lifeBoss=49; 
        }
      }
      if (lifeBoss<=0) {
        winScreen=false;
      }
    }
  }
  balas.removeAll(balasElim);
}
