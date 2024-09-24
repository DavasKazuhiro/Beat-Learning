/* Classes */

/*
  Aqui está uma implementação de Instrument que usamos para acionar Samplers a cada dezesseis notas.
  Note como conseguimos usar apenas uma instância desta classe para ter uma criação de batida infinita
  fazendo com que a classe agende a si mesma para ser tocada no final de seu método noteOff.
*/

class Tick implements Instrument {
  void noteOn(float dur) {
    for (int i = 0; i < instruments.length; i++) {
      if (instrumentRows[beat][i]) {
        instruments[i].trigger();
      }
    }
  }
  
  void noteOff() {
    beat = (beat+1)%16;           // próxima batida
    out.setTempo(bpm);            // define o novo tempo
    out.playNote(0, 0.25f, this); // toque isso novamente agora, com uma duração de dezesseis notas
  }
}

// Classe para o marcador de batida
class Rect 
{
  int x, y, s; // s representa o tamanho do lado do quadrado
  boolean[] steps;
  int stepId;
  int cornerRadius; // raio dos cantos
  
  public Rect(int _x, int _y, boolean[] _steps, int _id, int _cornerRadius) {
    x = _x;
    y = _y;
    s = 40; // tamanho do lado do quadrado
    steps = _steps;
    stepId = _id;
    cornerRadius = _cornerRadius;
  }
  
  public void draw() {
    if ( steps[stepId] ) {
      fill(instrumentColors[stepId][0], instrumentColors[stepId][1], instrumentColors[stepId][2]); // Cor única para o instrumento
    }
    else {
      fill(#CBCCCC);
    }
    rect(x, y, s, s, cornerRadius); // desenha um quadrado com cantos arredondados
  }
  
  public void mousePressed() {
    if (!(tutorialVisible)){ // não ativar o som enquanto o tutorial estiver aberto
      if ( mouseX >= x && mouseX <= x+s && mouseY >= y && mouseY <= y+s ) {
          steps[stepId] = !steps[stepId];
        }
    }
    if (resetButton.isMouseOver(mouseX, mouseY)) {
      for (int i = 0; i < instrumentRows.length; i++) {
        for (int j = 0; j < 7; j++) {
          instrumentRows[i][j] = false;
        }
      }
    }
  }
}

// Classe para os botões
class Button {
  int x, y, w, h, c;
  String label;
  
  Button(int x, int y, int w, int h, String label) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;
    c = 6;
  }
  
  void display() {
    stroke(255);
    fill(#FF8C00);
    rect(x, y, w, h, c);
    fill(255);
    textAlign(CENTER, CENTER);
    fill(0);
    textSize(36);
    text(label, x + w/2, y + h/2);
  }
  
  boolean isMouseOver(int mx, int my) {
    return (mx > x && mx < x + w && my > y && my < y + h);
  }
}
