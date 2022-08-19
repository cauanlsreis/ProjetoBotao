
import processing.serial.*; //Importa a biblioteca para abrir uma comunicação Serial
Serial myPort; //Instância a biblioteca para a comuniação Serial

//Cria uma instância para cada imagem da interface
PImage fundo; //Background
PImage ledOff; //LED desligado
PImage ledOn; //LED VERDE ligado
PImage ledVermelhoOn; //LED VERMELHO ligado
PImage botaoOn; //Botão Ligado
PImage botaoOff; //Botão Desligado
//=======================

int valor_recebido; //Cria uma variável para armazenas o valor recebido pela serial
int valor_botao; //Cria uma variável para armazenar o valor do botão

boolean habilita_botao02 = false; //Cria uma variável para habilitar o botão 01 da interface
boolean habilita_botao03 = false; //Cria uma variável para habilitar o botão 02 da interface
boolean habilita_botao04 = false; //Cria uma variável para habilitar o botão 03 da interface
boolean habilita_botao05 = false; //Cria uma variável para habilitar o botão 04 da interface
boolean habilita_botao06 = false; //Cria uma variável para habilitar o botão 03 da interface
boolean habilita_botao07 = false; //Cria uma variável para habilitar o botão 04 da interface

boolean estadoLEDvermelho01 = false; //Cria uma variável para armazenar o estado do LED Vermelho
boolean estadoLEDvermelho02 = false; 
boolean estadoLEDvermelho03 = false; 
boolean estadoLEDvermelho04 = false; 
boolean estadoLEDvermelho05 = false; 


int ajuste_y=14; //Variável para ajusta o eixo x na tela (Centralizar)
                 //Se não precisar de ajuste deixe com valor 0

void setup()
{
    
  String portName = Serial.list()[0]; //Lista as portas COM (Serial) encontradas
                                      //Pega a primeira porta (Posição 0 em "Serial.list()[0]" e
                                      //armazena na variável portName
                                      //Se você tiver mais de uma porta COM, identifique qual a do Garagino
  
  myPort = new Serial(this, portName, 9600); //Abre uma comunicação Serial com baud rate de 9600
  
  size(800, 600); //Define o tamanho da tela
  
  //Carrega as imagens e armazena elas em suas respectivas instâncias
  fundo = loadImage("fundo.png");
  ledOn = loadImage("ledOn.png");
  ledOff = loadImage("ledOff.png");
  botaoOn = loadImage("botaoOn.png");
  botaoOff = loadImage("botaoOff.png");
  ledVermelhoOn = loadImage("ledVermelhoOn.png");
  //================================================================
  
}

void draw()
{
  
  if (myPort.available() > 0) //Se algo for recebido pela serial
  {
    valor_recebido = myPort.read(); //Armazena o que foi lido dentro da variável valor recebido
    
  }

  background(fundo); //Atualiza a imagem de fundo (backgroud) da interface

  translate(width/2, height/2+ajuste_y); //Posiciona o ponto 0 da interface no centro da tela
                                         //Com ajuste de 14 pixels em y (height)


  //***************************************
  //***************************************
  //Descomente "borda_mouse();" para visualizar as bordas das imagens clicáveis
  //E a visualização do centro da tela
            borda_mouse();
  //***************************************
  //***************************************
  
  //**********************BOTÕES E LEDS********************
    
    // ------Botão e LED 02------
  if(habilita_botao02 == false) //Se O BOTÃO 02 estiver desligado
  {
    image(botaoOff, -385, 125); //Coloca a imagem do botão em OFF / na posição -400 em x / e na posição 125 em y (height)
    
    image(ledOff, -335, 50); // imagem de LED OFF        
  }
  
  else //Se O BOTÃO 02 estiver ligado
  {
    image(botaoOn, -385, 125); //Coloca a imagem do botão em OFF / na posição -400 em x / e na posição 125 em y (height)
    
    image(ledOn, -335, 50); // imagem de LED OFF
  }
  
  // ------Botão e LED 03------
  if(habilita_botao03 == false) //Se O BOTÃO 03 estiver desligado
  {
    image(botaoOff, -265, 125); 
    
    image(ledOff, -215, 50);       
  }
  
  else //Se O BOTÃO 03 estiver ligado
  {
    image(botaoOn, -265, 125);
    
    image(ledOn, -215, 50); 
  }
  
  // ------Botão e LED 04------
  if(habilita_botao04 == false) //Se O BOTÃO 04 estiver desligado
  {
    image(botaoOff, -145, 125); 
    
    image(ledOff, -95, 50);       
  }
  
  else //Se O BOTÃO 04 estiver ligado
  {
    image(botaoOn, -145, 125);
    
    image(ledOn, -95, 50); 
  }
  
  
  // ------Botão e LED 05------
  if(habilita_botao05 == false) //Se O BOTÃO 05 estiver desligado
  {
    image(botaoOff, -25, 125); 
    
    image(ledOff, 25, 50);       
  }
  
  else //Se O BOTÃO 05 estiver ligado
  {
    image(botaoOn, -25, 125);
    
    image(ledOn, 25, 50); 
  }
  
  // ------Botão e LED 06------
  if(habilita_botao06 == false) //Se O BOTÃO 06 estiver desligado
  {
    image(botaoOff, 95, 125); 
    
    image(ledOff, 145, 50);       
  }
  
  else //Se O BOTÃO 06 estiver ligado
  {
    image(botaoOn, 95, 125);
    
    image(ledOn, 145, 50); 
  }
  
  // ------Botão e LED 07------
  if(habilita_botao07 == false) //Se O BOTÃO 07 estiver desligado
  {
    image(botaoOff, 215, 125); 
    
    image(ledOff, 265, 50);       
  }
  
  else //Se O BOTÃO 07 estiver ligado
  {
    image(botaoOn, 215, 125);
    
    image(ledOn, 265, 50); 
  }
  
  //------LED 
  
  //OBS: "botaoOff.width" equivale ao tamanho da imagem em width,
  //nesse caso a imagem possui 65x100(width x height),
  //logo, botaoOff.width = 65
  //=======================================================
  
  
  //=======================LEDs Vermelhos ===================
  
  //-----------LED VERMELHO 01--------------
   if(estadoLEDvermelho01 == false) 
  {
    image(ledOff, -335, -125); // imagem de LED OFF        
  }
  
  else
  {
    image(ledVermelhoOn, -335, -125); 
  }
  
  //-----------LED VERMELHO 02--------------
  if(estadoLEDvermelho02 == false) 
  {
    image(ledOff, -215, -125); // imagem de LED OFF        
  }
  
  else
  {
    image(ledVermelhoOn, -215, -125); 
  }
  
  //-----------LED VERMELHO 03--------------
  if(estadoLEDvermelho03 == false) 
  {
    image(ledOff, -95, -125); // imagem de LED OFF        
  }
  
  else
  {
    image(ledVermelhoOn, -95, -125); 
  }
  
  //-----------LED VERMELHO 04--------------
  if(estadoLEDvermelho04 == false) 
  {
    image(ledOff, 25, -125); // imagem de LED OFF        
  }
  
  else
  {
    image(ledVermelhoOn, 25, -125); 
  }
  
  //-----------LED VERMELHO 05--------------
  if(estadoLEDvermelho05 == false) 
  {
    image(ledOff, 145, -125); // imagem de LED OFF        
  }
  
  else
  {
    image(ledVermelhoOn, 145, -125); 
  }
  
  //=======================================================
  
}

void mouseClicked()
{
  //Se o mouse for clicado em cima da imagem do botão 02
  if (mouseX>= ((width/2)-363) && mouseX<= (width/2-257) && mouseY>=(height/2+172+ajuste_y) && mouseY<=(height/2+258+ajuste_y) )
  {
    habilita_botao02 = !habilita_botao02; //Inverte o estado do botão
    myPort.write(302); //Envia o valor 302 para o Arduino
  }
  
  //Se o mouse for clicado em cima da imagem do botão 03
  if (mouseX>= ((width/2)-242) && mouseX<= (width/2-137) && mouseY>=(height/2+172+ajuste_y) && mouseY<=(height/2+258+ajuste_y) )
  {
    habilita_botao03 = !habilita_botao03; 
    myPort.write(303); 
  }
  
  //Se o mouse for clicado em cima da imagem do botão 04
  if (mouseX>= ((width/2)-122) && mouseX<= (width/2-17) && mouseY>=(height/2+172+ajuste_y) && mouseY<=(height/2+258+ajuste_y) )
  {
    habilita_botao04 = !habilita_botao04; 
    myPort.write(304); 
  }
  
  //Se o mouse for clicado em cima da imagem do botão 05
  if (mouseX>= ((width/2)-2) && mouseX<= (width/2+103) && mouseY>=(height/2+172+ajuste_y) && mouseY<=(height/2+258+ajuste_y) )
  {
    habilita_botao05 = !habilita_botao05; 
    myPort.write(305); 
  }
  
  //Se o mouse for clicado em cima da imagem do botão 06
  if (mouseX>= ((width/2)+118) && mouseX<= (width/2+223) && mouseY>=(height/2+172+ajuste_y) && mouseY<=(height/2+258+ajuste_y) )
  {
    habilita_botao06 = !habilita_botao06; 
    myPort.write(306); 
  }
  
  //Se o mouse for clicado em cima da imagem do botão 07
  if (mouseX>= ((width/2)+238) && mouseX<= (width/2+344) && mouseY>=(height/2+172+ajuste_y) && mouseY<=(height/2+258+ajuste_y) )
  {
    habilita_botao07 = !habilita_botao07; 
    myPort.write(307); 
  }
  
} 


void borda_mouse()
{
  
  //Localizador de Posição do Mouse
  textSize(18); //Define o tamanho da letra
  fill(0, 0, 255); //Define a cor Azul (R, G, B)
  text("MouseX = " + (mouseX-width/2), -400, -300); //Escreve MouseX + o valor da posição do mouse na tela
  text("MouseY = " + (mouseY-height/2), -400, -280); //Escreve MouseY + o valor da posição do mouse na tela
  fill(255, 255, 255); //Define a cor Branca (R, G, B)
  
  //Cria Linha Horizontal Central
  line(-width/2, 0, width/2, 0);
  //==
  
  //Cria Linha Vertical Central
  //line(0, -height/2, 0, height/2);
  //==
  
  //Legenda dos Botões
  
  //---botão 01-----
  textSize(18);
  fill(0, 0, 0); //Define a cor preto (R, G, B)
  text("02", -335, 260);
  
  //---botão 02-----
  textSize(18);
  fill(0, 0, 0); 
  text("03", -200, 260);
  
  //---botão 03-----
  textSize(18);
  fill(0, 0, 0); 
  text("04", -80, 260);
  
  //---botão 04-----
  textSize(18);
  fill(0, 0, 0); 
  text("05", 40, 260);
  
  //---botão 05-----
  textSize(18);
  fill(0, 0, 0); 
  text("06", 160, 260);
  
  //---botão 06-----
  textSize(18);
  fill(0, 0, 0); 
  text("07", 280, 260);
  
  
  //Legenda dos LEDs Vermelhos
  
  //---led 08-----
  textSize(18);
  fill(0, 0, 0); 
  text("08", -330, -120);
  
  //---botão 09-----
  textSize(18);
  fill(0, 0, 0); 
  text("09", -200, -120);
  
  //---botão 10-----
  textSize(18);
  fill(0, 0, 0); 
  text("10", -80, -120);
  
  //---botão 11-----
  textSize(18);
  fill(0, 0, 0); 
  text("11", 40, -120);
  
  //---botão 12-----
  textSize(18);
  fill(0, 0, 0);
  text("12", 160, -120);
}
