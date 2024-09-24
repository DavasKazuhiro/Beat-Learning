/* Funcionalidade sobre Teoria Musical */

int currentPage = 0; // Variável contadora para monitorar a página atual do tutorial
boolean tutorialVisible = false; // Controla visibilidade da janela do tutorial
String[] tutorialPages = {
  "Teoria Musical\n\nO que é música?\n\nÉ a arte de combinar os sons simultâneos e sucessivamente, com ordem,\nequilíbrio e proporção, dentro do tempo.\n\n“É a arte de manifestar os diversos afetos de nossa alma mediante o som.”\n\nA música é constituída em 4 partes:\n\nMELODIA – É a combinação dos SONS SUCESSIVOS (dados uns após outros).\nÉ a concepção horizontal da Música.\n\nHARMONIA – É a combinação dos SONS SIMULT NEOS (dados de uma só vez).\nÉ a concepção vertical da Música.\n\nCONTRAPONTO – É o conjunto de melodias dispostas em ordem simultânea.\nÉ a concepção ao mesmo tempo horizontal e vertical da Música.\n\nRÍTMO – É a combinação dos valores tempo.",
  "Notas musicais e Sistema de Notação\n\nAs NOTAS MUSICAIS são o coração da música e ela é composta por 7 notas:\nDó, Ré, Mi, Fá, Sol, Lá e Si. Elas são como letras do alfabeto musical e são usadas \npara criar todas as músicas que ouvimos. Cada uma dessas notas tem um som \núnico e é representada por uma letra.\n\nPara escrever uma música é desenhado sobre 5 linhas e 4 espaços horizontais \nparalelos e equidistantes. A estas linhas e espaços são chamadas de PAUTA \nMUSICAL ou PENTAGRAMA.\n\nLINHAS SUPLEMENTARES são linhas adicionais a PAUTA MUSICAL que expandem \nos horizontes musicais e permitem que qualquer nota seja escrita e executada.\n\nPARTITURA é uma representação gráfica completa de uma obra musical, incluindo \na melodia, ritmo, harmonia e outros elementos musicais. A pauta é uma parte da \npartitura.",
  "Claves Musicais\n\nUma CLAVE MUSICAL é um símbolo colocado no início da pauta musical que \ndefine a altura (grave ou aguda) das notas em relação às linhas e espaços da \npauta. É como uma chave que decifra o significado das posições na pauta.\nExistem quatro claves principais usadas na música:\n\nClave do Sol\nClave de Fá\nClave de Dó\nClave Neutra",
  "Ritmo e Notação Rítmica\n\nRITMO é o “batimento cardíaco” da música. É a organização dos sons no tempo. \nAssim como nós temos um batimento cardíaco regular, a música tem uma \npulsação constante chamada de “tempo”.\n\nO tempo é a unidade de medida do ritmo, e ele é dividido em pulsações regulares \nsemelhante a um relógio. A velocidade do tempo é medida em batimentos por \nminuto (BPM).\n\nFIGURAS RÍTMICAS são representações gráficas de durações das notas. As figuras \nmais comuns são semibreve, mínima, semínima, colcheia e a semicolcheia. Cada \numa delas dura a metade do tempo da anterior.\n\nPAUSAS RÍTMICAS são momentos de silêncio que têm a mesma duração das \nfiguras rítmicas correspondentes. Elas são tão importantes quanto as notas, pois \ndão a música sua articulação.",
  "Ritmo e Notação Rítmica (cont.)\n\nCOMPASSO é o esqueleto da música. Determina a maneira pelo qual o ritmo é \norganizado em grupos regulares de batidas. Os compassos podem ser simples, \ncom um único grupo de batidas, ou compostos, com dois ou mais grupos de \nbatidas.\n\nCompassos simples têm batidas divisíveis por 2, como 2/4.\nCompassos compostos têm batidas divisíveis por 3, como 6/8.\n\nASSINATURA DE TEMPO indica quantas batidas existem em cada compasso e \nqual figura rítmica representa uma batida.",
  "Composição e Arranjo Básico\n\nCOMPOSIÇÃO MUSICAL é o ato de criar uma música original. Pode envolver a \ncriação de melodias, harmonias, ritmos, e estruturas musicais. Cada compositor \ntem seu próprio processo criativo.\n\nMELODIA é a linha principal de uma música, a sequência de notas que é cantada \nou tocada. A HARMONIA é a combinação de acordes que acompanham a melodia. \nCompor envolve a interação entre a melodia e a harmonia.\n\nRITMO é o padrão rítmico que sustenta a composição musical. A ESTRUTURA \ndefine como a música é organizada, incluindo a divisão de versos, refrões e pontes.",
  "Composição e Arranjo Básico (cont.)\n\nARRANJO MUSICAL é a arte de adaptar uma composição por um grupo de músicos \nou instrumentos específicos. Isto envolve a escolha de vozes, instrumentos e a \ncriação de partes individuais para cada músico.\n\nExistem várias FERRAMENTAS DE COMPOSIÇÃO disponíveis, desde o tradicional,\npapel pautado até softwares de notação musical e programas de produção musical.",
  "Estes são os fundamentos da Teoria Musical.\n\nAgora é com você! Componha uma música usando o nosso BEATMAKER!"
};

// Função para desenhar a janela de Tutorial sobre Teoria Musical
void drawTutorial() {
  // Janela do tutorial
  fill(255);
  stroke(0);
  rect(60, 60, 900, 760);
  
  // Conteúdo do tutorial
  fill(0);
  textAlign(LEFT, TOP);
  textSize(24);
  text(tutorialPages[currentPage], 120, 120, 120);
  
  // Botões
  previousButton.display();
  if (currentPage < tutorialPages.length -1) {
    nextButton.display();
  } else {
    lastNextButton.display();
  }
}

// Função para controlar o evento de click
void clickTutorial() {
  if (tutorialButton.isMouseOver(mouseX, mouseY)) {
    tutorialVisible = !tutorialVisible; 
    currentPage = 0;
  }
}

// Função para controlar a navegação no tutorial
void controlNavigationTutorial() {
  if (tutorialVisible) {
    if (previousButton.isMouseOver(mouseX, mouseY)) {
      if (currentPage > 0) {
        currentPage--; // Retrocede uma página
      }
    } else if (nextButton.isMouseOver(mouseX, mouseY)) {
      if (currentPage < tutorialPages.length - 1) {
        currentPage++; // Avança uma página
      } else if (currentPage == tutorialPages.length - 1) {
        tutorialVisible = !tutorialVisible; 
        currentPage = 0;
      }
    }
  }
}
