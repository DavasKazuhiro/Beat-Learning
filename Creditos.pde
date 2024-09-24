/* Funcionalidade de Créditos */

float xr = 500;
float yr = 1600;
float tamanhoTexto = 30;
float distance = 75;
PImage photoAnaJ, photoDavi, photoEdu, photoFer, photoJafte, photoRenato;
boolean creditVisible = false; // Controla a visibilidade dos Créditos


// Função para carregar as imagens
void loadCreditImages() {
  photoAnaJ = loadImage("Ana.jpg");
  photoDavi = loadImage("Davi.jpg");
  photoEdu = loadImage("Edu.jpg");
  photoFer = loadImage("Fernanda.jpg");
  photoJafte = loadImage("Jafte.jpg");
  photoRenato = loadImage("Renato.jpg");
}

// Função para executar os créditos na interface do aplicativo
void invokeCredits(){
  background(0);
  drawCredits(30, 500);
  creditButton.display();
}

// Função para desenhar os créditos 
void drawCredits(float tamanhoTexto, float distance){
  float fim = tamanhoTexto*6+distance*5+400;
  fill(255);
  textSize(tamanhoTexto);
  textAlign(CENTER);
  imageMode(CENTER);
  text("ESTE APLICATIVO FOI DESENVOLVIDO POR:", xr, yr - 500);
  image(photoAnaJ, xr, yr-220);
  text("Ana Jully da Silva Ávila",xr, yr);
  image(photoDavi, xr, yr+distance - 220);
  text("Davi Kazuhiro Natume",xr, yr+distance);
  image(photoEdu, xr, yr+distance*2 - 220);
  text("Eduardo Teodoro Moreira de Souza",xr, yr+distance*2);
  image(photoFer, xr, yr+distance*3-220);
  text("Fernanda Costa Moraes",xr, yr+distance*3);
  image(photoJafte, xr,yr+distance*4-220);
  text("Jafte Carneiro Fagundes da Silva",xr, yr+distance*4);
  image(photoRenato, xr, yr+distance*5-220);
  text("Renato Pestana de Gouveia",xr, yr+distance*5);
  text("PROJETO II - EXPERIÊNCIA CRIATIVA", xr, yr+distance*5+300);
  text("CIÊNCIA DA COMPUTAÇÃO - PUCPR", xr, yr+distance*5+350);
  if(yr > -fim){yr -= 3;}
  else yr = 1600;
}

// Função para controlar o evento de click
void clickCredits() {
  if (creditButton.isMouseOver(mouseX, mouseY)) {
    creditVisible = !creditVisible;
  } 
}
