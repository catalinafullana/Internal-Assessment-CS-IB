color c3;
color c4;

void template(int j) {
  background(platinum);

  //banner
  fill(blackCoral, j);
  noStroke();
  rect(marginW, marginH, width-2*marginW, hBanner);

  //logo
  /*
  fill(prussianBlue);
  rect(marginW+10, marginH+10, logoW, hBanner-20);
  */
  c3 = color(251, 54, 64, j);
  c4 = color(10, 36, 99, j);

  if(pantalla!=0){
    logoDrawing(160, 44, 30, "keep the ball flying", c3, c4);
  }

  fill(255,255,255, j);
  
  text("Mi equipo", 250 +(width- 200)/6, hBanner/2);
  text("Pizarra", 250 +2*(width- 200)/6, hBanner/2);
  text("Resultados", 250 +3*(width- 200)/6, hBanner/2);
  text("Guardados", 250 +4*(width- 200)/6, hBanner/2);
  text("Sobre nosotros", 250 +5*(width- 200)/6, hBanner/2);
  
  pushStyle();
  
  rectMode(LEFT);

  goToMiEquipo.display();
  goToPizarra.display();
  goToResultados.display();
  goToGuardados.display();
  goToSobreNosotros.display();
  popStyle();



  //zona libre

  fill(200, 200, 200,j);
  rect(marginW, hBanner+marginH, width-2*marginW, height - 2*marginH - hBanner);
}


void logoDrawing(float x, float y, int z, String texto, color c1, color c2){
  pushStyle();
    pushMatrix();
    
        textAlign(CENTER);
        textFont(fuente2);
        textSize(z);
        fill(c1);
        
        if(pantalla!=0){
          text(texto,x, y);
          fill(255);
          text(texto,x+1,y+1);
          fill(c2);
          text(texto,x+2,y+2);
        } else{
          text(texto,x, y);
          fill(255,j);
          text(texto,x+0.02*z,y+0.03*z);
          fill(c2);
          text(texto,x+2*0.02*z,y+2*0.02*z);
        }
    popMatrix();
  popStyle();
}
