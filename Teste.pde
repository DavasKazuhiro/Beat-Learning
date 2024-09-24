/* Funcionalidade para Avaliação */

// Função para avaliar o conhecimento do aluno sobre a teoria musical
void teste(){
  stroke(255);
  fill(#FF8C00);
  rect(30, 850, 160, 80, 6);
  
  if (instrumentRows[0][6] == true && instrumentRows[2][2] == true &&
      instrumentRows[4][1] == true && instrumentRows[6][2] == true &&
      instrumentRows[8][0] == true && instrumentRows[10][3] == true &&
      instrumentRows[12][4] == true && instrumentRows[14][3] == true &&
      instrumentRows[15][0] == true) {
    fill(#ffd700);
    rect(30, 850, 160, 80, 6); 
  } else {
    fill(#FF8C00);
  }
 
  fill(255);
  textAlign(CENTER, CENTER);
  fill(0);
  textSize(36);
  text("TESTE",110, 890);
}

// Função para controlar o evento de click
void clickTeste() {
  if (mouseX >= 30 && mouseX<= 190 && mouseY >= 850 && mouseY <= 930) {
    somTeste.play();
  }
  if (somTeste.position() == somTeste.length()) {
    somTeste.rewind();
  }
}
