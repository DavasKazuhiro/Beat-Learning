import processing.opengl.*;
import ddf.minim.*;
import ddf.minim.ugens.*;
import g4p_controls.*;


// Declaração de objetos
Minim minim;
AudioOutput out;
Button playButton, pauseButton, tutorialButton, previousButton, nextButton, resetButton, lastNextButton, testButton, creditButton;
AudioPlayer somTeste;

// Declaração de variáveis
Sampler[] instruments = new Sampler[7];                                                                     // Array para os instrumentos
int[][] instrumentColors = new int[7][3];                                                                   // Matriz para armazenar as cores únicas para cada instrumento
String[] instrumentNames = {"BUMBO", "CAIXA", "CHIMBAL F.", "CHIMBAL A.", "PALMAS", "ATAQUE", "GROOVE :)"}; // Nomes dos instrumentos
boolean[][] instrumentRows = new boolean[16][7];                                                            // Array bidimensional para os passos de cada instrumento
ArrayList<Rect> buttons = new ArrayList<Rect>();                                                            // Array dos botões dos instrumentos
int bpm = 120;                                                                                              // Valor inicial
int beat;                                                                                                   // Identifica em qual batida estamos
int lastMouseY;                                                                                             // Para rastrear a posição do mouse anterior

/* Funções Principais */
void setup() {
  size(1020, 960);
  minim = new Minim(this);
  out   = minim.getLineOut();
  loadCreditImages();                     // Carrega as imagens dos créditos
  somTeste = minim.loadFile("Teste.mp3"); // Carrega o som do teste
  defineInstrumentColors();               // Definição das cores únicas para cada instrumento
  defineInstrumentSamples();              // Definição das amostras de sons dos instrumentos
  connectInstrumentsToAudioOutput();      // Conecta as amostras à saída
  initializeStepsForInstruments();        // Inicialização dos passos de cada instrumento
  drawButtonsForInstruments();            // Criação dos botões para cada instrumento
  
  beat = 0; // Valor inicial da batida
  
  // Inicia o sequenciador
  out.setTempo(bpm);
  out.playNote(0, 0.25f, new Tick());
  
  // Posicionamento dos botões na interface do aplicativo
  playButton = new Button(230, 850, 160, 80, "PLAY");
  pauseButton = new Button(430, 850, 160, 80, "PAUSE");
  tutorialButton = new Button(630, 850, 160, 80, "TUTORIAL");
  resetButton = new Button(830, 850, 160, 80, "RESET");
  previousButton = new Button(120, 740, 200, 50, "ANTERIOR");
  nextButton = new Button(680, 740, 200, 50, "PRÓXIMO");
  lastNextButton = new Button(680, 740, 200, 50, "FECHAR");
  creditButton = new Button(830, 30, 160, 40, "CRÉDITOS");
}


void draw() {
  background(120);                   // Alteração da cor de fundo para #555859
  textSize(60);
  textAlign(CENTER, CENTER);
  fill(#FF8C00);
  text("BEAT LEARNING", 510, 40);
  fill(255);
  
  drawInstruments();                 // Desenha todos os nomes dos instrumentos na interface
  stroke(128);
  beatColor();                       // Define a cor do marcador de batida  
  rect(30+beat*48, 120, 40, 15, 6);  // Marcador de batida
  drawBpmField();                    // Desenha o campo BPM
  
  // Desenha os botões da interface
  playButton.display();
  pauseButton.display();
  tutorialButton.display();
  resetButton.display();
  creditButton.display();
  teste();
  
  // Desenhar a janela do tutorial se estiver visível
  if (tutorialVisible) {
    drawTutorial();
    out.mute();
  }
  
  // Desenhar os créditos se estiver visível
  if (creditVisible) {
    invokeCredits();
    out.mute();
  }
}

void mousePressed() {
  captureClickedButtons();     // Captura os botões clicados na interface
  clickPlay();                 // Resume a reprodução musical
  clickPause();                // Pausa a reprodução musical
  clickTutorial();             // Alternar a visibilidade do tutorial
  controlNavigationTutorial(); // Controle da navegação no tutorial
  clickCredits();              // Alternar a visibilidade dos créditos
  clickTeste();                // Inicia a avaliação
}

void mouseWheel(MouseEvent event) {
  bpmControl(event);
}
