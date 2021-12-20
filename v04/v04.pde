void setup() {

  p = new Pissarra(50, 280, 700,700, 100, width-100);


  img1 = loadImage("sobreNosotros1.jpg");
  img2 = loadImage("sobreNosotros2.jpg");
  img3 = loadImage("sobreNosotros3.jpg");

  //b1 = new Button("a", width/2 - wButton/2, height/2, wButton, hButton, true);
  goToMiEquipo      =  new Button("", 150 + 1*(width- 120)/6, hBanner/5, 150 + 2*(width- 120)/6, hButton, false);
  goToPizarra       =  new Button("", 150 + 2*(width- 120)/6, hBanner/5, 150 + 3*(width- 120)/6, hButton, false);
  goToResultados    =  new Button("", 150 + 3*(width- 120)/6, hBanner/5, 150 + 4*(width- 120)/6, hButton, false);
  goToGuardados     =  new Button("", 150 + 4*(width- 120)/6, hBanner/5, 150 + 5*(width- 120)/6, hButton, false);
  goToSobreNosotros =  new Button("", 150 + 5*(width- 120)/6, hBanner/5, 150 + 6*(width- 120)/6, hButton, false);

  
  b1 = new Button("NEXT", 25 + tableW/2 + wButton/1.5, height - hButton - 20, wButton, hButton, true);
  b2 = new Button("PREV", 25 + tableW/2 - wButton/1.5, height - hButton - 20, wButton, hButton, true);

  save           =  new Button("S", width - 45,  10 + hBanner, 40 ,40, true );

  entrenamiento  =  new Select("Modo entrenamiento",50, 70 ,  true,   20);
  competicion    =  new Select("Modo competición",  50, 100 , false,  20);
  mediaPista     =  new Select("Media pista",       50, 150 , false,  20);
  pistaEntera    =  new Select("Pista entera",      50, 180 , true,   20);

  guardado1      =  new Guardado(img1, "k1", 17, 04, 2021, 125, 100);
  //guardado2      =  new Guardado(img2, "rece en k2", 16, 12, 2021, 125+ 2*300+20, 100);
  subeFotogramas();

  // Creació de la taula
  t = new Table(files, columnes);
  t.setHeaders(headers);
  t.setData(info);
  t.setColumnWidths(colWidths);

  /*
  //tabla liberos
  lib = new Table(5, 3);
  lib.setHeaders(liberos);
  lib.setData(libTable);
  lib.setColumnWidths(colWidthsLibs);
*/
  //creació jugador
  p1   = new Player("Pere Joan", "Gomila" , "home", "Libero", "Col", 10, 999999999, 2001, 16, 2, "perej@mail.com");
  p2   = new Player("Pere Joan", "Gomila" , "home", "Central", "Punta", 10, 999999999, 2001, 16, 2, "perej@mail.com");
  p3   = new Player("Pere Joan", "Gomila" , "home", "Opuesto", "Central", 10, 999999999, 2001, 16, 2, "perej@mail.com");

  guardar  = new PopUp("GUARDAR", "elige un título:", (width- popW)/2, (height-popH- hBanner)/2, popW, popH);
  


  cono = loadImage("cono.png");

  fuente1 = createFont("HKGrotesk-Bold.otf", 40);
  fuente2 = createFont("Coco-Sharp-Extrabold-trial.ttf", 40);
  fuente3 = createFont("Coco-Sharp-Heavy-Italic-trial.ttf", 40);

  nSaved = new TextField(550, 400, 200, 35);
  dSaved = new TextField(800, 450, 50, 35);
  mSaved = new TextField(870, 450, 50, 35);
  ySaved = new TextField(940, 450, 50, 35);

  //size(1200, 780);
  size(1300,900);
  noStroke();
  textAlign(CENTER);
  textSize(18);


}


void draw() {

  if(frameCount<75){
  //if(true){
  //if(false){
    inicio();
  
  } else if(frameCount<125){
    fill(226,226, 240, i);
    rect(0,0,width, height);
    i++;
  } else{
    template(j);

    pushMatrix();
      translate(marginW, hBanner+marginH);
      pantallas(j);
    popMatrix();

    //println(pantalla);
    mousePointer();
    calibrateBlackboardModes();
    updateCursor();

    if(j<255){
      j+=25;
    }
    
  }

}



void pantallas (int j){
  //println(pantalla);

    if (pantalla==0) { //entrada
      p0(j);
      
    }
    if (pantalla==1) { //mi equipo
      p1();
    }
    if (pantalla==2) {
      p2();
    }
    if (pantalla==3) {
      p3();
    }
    if (pantalla==4) {
      resultados();
    }
    if (pantalla==5) {
      sobreNosotros();
    }
}

void keyPressed() {
  if ( key=='d' || key =='D') {
    pantalla++;
  }
  if ( key=='a' || key =='A') {
    pantalla--;
  }
  if (key=='t'){
    mediaPista.setSelected(!mediaPista.getSelected());
    pistaEntera.setSelected(!mediaPista.getSelected());
  }
  if (key=='c'){
    competicion.setSelected(!competicion.getSelected());
    entrenamiento.setSelected(!competicion.getSelected());
  }
  if(key =='R'|| key=='r'){
    p.resetPinPositions();
  }
  nSaved.keyPressed(key, (int)keyCode);
  dSaved.keyPressed(key, (int)keyCode);
  mSaved.keyPressed(key, (int)keyCode);
  ySaved.keyPressed(key, (int)keyCode);
}

void mousePointer(){
  if(mousePressed){  
    println("mouse X: "+ mouseX);
    println("mouse Y: "+ mouseY);
  }
}

void updateCursor(){
  
  if((goToMiEquipo.mouseOverButton() && goToMiEquipo.enabled)||
     (goToGuardados.mouseOverButton() && goToGuardados.enabled)||
     (goToPizarra.mouseOverButton() && goToPizarra.enabled) ||
     mouseOverObject(0,0,0,0) || save.mouseOverButton() || 
     (b1.mouseOverButton() && b1.enabled)||
     (b2.mouseOverButton() && b2.enabled)){
      cursor(HAND);
  } else {
     cursor(ARROW);
  }
}

void mousePressed(){
  if(goToMiEquipo.mouseOverButton() && mousePressed){
    pantalla =1;
  }
  if(goToPizarra.mouseOverButton()  && mousePressed){
    pantalla = 2;  
  }
  if(goToGuardados.mouseOverButton() && mousePressed){
    pantalla =3;
  }
  if(goToSobreNosotros.mouseOverButton() && mousePressed){
    pantalla = 4;
  }
  if(mouseOverLogo()&& mousePressed){
    pantalla = 0;
  }
  if(goToResultados.mouseOverButton() && mousePressed){
    pantalla =4;
  }
  if(b1.mouseOverButton() && b1.enabled){
    t.nextPage();
  }
  else if(b2.mouseOverButton() && b2.enabled){
    t.prevPage();
  }
  if(guardar.bAceptar.mouseOverButton()){
    guardar.setVisible(true);
  }
  else {
    guardar.setVisible(false);
  }
  if(save.mouseOverButton()&&mousePressed){
    guardar.setVisible(true);
  }
  if(false){
    mSaved.isPressed();
    nSaved.isPressed();
    ySaved.isPressed();
    dSaved.isPressed();
  }
}

void calibrateBlackboardModes(){
  /*
  if(entrenamiento.getSelected()){
    competicion.setSelected(false);
  }else{
    competicion.setSelected(false);
  }
  competicion.setSelected(!entrenamiento.getSelected());
  mediaPista.setSelected(!pistaEntera.getSelected());
  */
}

boolean mouseOverLogo(){
  boolean a = (mouseX >= marginW+10) && 
          (mouseX<=303) && 
          (mouseY>= 19) && 
          (mouseY<= 50);
  if(a){
    cursor(HAND);
  }else{cursor(ARROW);}
  return a ;
}

void subeFotogramas(){

  img = new PImage [nFotogramas] ;

  for (int i=1; i<img.length; i++) {
    img[i] = loadImage("f"+i+".jpg");
  }

}

