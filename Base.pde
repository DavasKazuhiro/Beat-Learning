/* Funções Básicas do Beatmaker */

void defineInstrumentColors() {
  instrumentColors[0] = new int[]{180, 207, 250};   
  instrumentColors[1] = new int[]{102, 198, 28};   
  instrumentColors[2] = new int[]{172, 114, 247};   
  instrumentColors[3] = new int[]{235, 92, 82}; 
  instrumentColors[4] = new int[]{254, 255, 90}; 
  instrumentColors[5] = new int[]{239, 172, 70}; 
  instrumentColors[6] = new int[]{236, 91, 136}; 
}

void defineInstrumentSamples() {
  /*
    Carregua todas as nossas amostras, usando 4 vezes para cada uma.
    Isso ajudará a garantir que tenhamos vezes suficientes para lidar até com tempos muito rápidos.
  */
  instruments[0] = new Sampler( "BD.wav", 4, minim );  // Bass Drum
  instruments[1] = new Sampler( "SD.wav", 4, minim );  // Snare Drum
  instruments[2] = new Sampler( "CHH.wav", 4, minim ); // Closed Hi-hat
  instruments[3] = new Sampler( "OH.wav", 4, minim );  // Open Hi-hat
  instruments[4] = new Sampler( "CP.wav", 4, minim );  // Clap
  instruments[5] = new Sampler( "CR.wav", 4, minim );  // Crash
  instruments[6] = new Sampler( "KD.wav", 4, minim );  // Ride/Bassline
}

// Função para desenhar todos os nomes dos instrumentos na interface
void drawInstruments() {
  for(int i = 0; i < buttons.size(); ++i) {
    buttons.get(i).draw();
    drawInstrumentName(i);
  }
}

// Função para desenhar os nomes dos instrumentos
void drawInstrumentName(int index) {
  if (index >= 0 && index < instrumentNames.length) { // Verifica se o índice é válido
    fill(instrumentColors[index][0], instrumentColors[index][1], instrumentColors[index][2]);
    rect(830, 150 + index * 100, 160, 40,6);
    textAlign(CENTER, CENTER);
    textSize(24);
    fill(#000000);
    text(instrumentNames[index], 910, 150 + index * 100 + 20);
  }
}

// Função para conectar as amostras com a saída de audio
void connectInstrumentsToAudioOutput() {
  for (Sampler instrument : instruments) {
    instrument.patch(out);
  }
}

// Função para inicializar os passos para os instrumentos
void initializeStepsForInstruments() {
  for (int i = 0; i < instrumentRows.length; i++) {
    for (int j = 0; j < instrumentRows[i].length; j++) {
      instrumentRows[i][j] = false;
    }
  }
}

// Função para desenhar todos os botões dos instrumentos
void drawButtonsForInstruments() {
  for (int i = 0; i < 16; i++) {
    for (int j = 0; j < instruments.length; j++) {
      // alterado para cantos arredondados com raio 3
      buttons.add(new Rect(30 + i * 48, 150 + j * 100, instrumentRows[i], j, 6));
    }
  }
}

// Função que define a cor do marcador de batida
void beatColor() {
  if (beat % 4 == 0) {
    fill(#ffd700);
  }
  else {
    fill(#FF8C00);
  }
}

// Função que desenha o campo BPM
void drawBpmField() {
  fill(#555859);
  rect(30, 30, 120, 40);
  fill(255);
  textSize(24);
  textAlign(LEFT, TOP);
  text("BPM: " + bpm, 45, 42);
}

// Função que controla o Batimento Por Minuto pela roda do mouse
void bpmControl(MouseEvent event) {
  int e = event.getCount();
  if (e > 0) {
    bpm -= 1; // diminui BPM
  } else if (e < 0) {
    bpm += 1; // aumenta BPM
  }
  
  // Limita o BPM a um valor mínimo de 60 e máximo de 240
  bpm = constrain(bpm, 60, 240);
  
  // Define o novo tempo
  out.setTempo(bpm);
}

// Funções para controle de eventos de click
void captureClickedButtons() {
  for(int i = 0; i < buttons.size(); ++i) {
    buttons.get(i).mousePressed();
  }
}

void clickPlay() {
  if (playButton.isMouseOver(mouseX, mouseY)) {
    out.unmute(); // Resumindo a reprodução
  }
}

void clickPause() {
  if (pauseButton.isMouseOver(mouseX, mouseY)) {
    out.mute(); // Pausando a reprodução
  }
}
