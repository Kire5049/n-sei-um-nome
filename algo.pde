int x, y;
int deltaH = 5;
int deltaV = 5;
int gameScoreP1 = 0;
int gameScoreP2 = 0;

//numero de bolas
int num = 500;
//declaracoes
float mx[] = new float[num];
float my[] = new float[num];

int p1, p2;

//cores
color roxo = #9B0CF4;
color vermelho = #E81414;
color branc = #FFFFFF;

//tamanhos
void setup(){
  size(640, 480);
  x = 10;
  y = 10;
  p1 = 10;
  p2 = 10;
}

void draw(){
  background(0);
  fill(branc);
  //pontuacao
  text("SCORE P1:" + gameScoreP1 + "00", width - 430, height - 400);
  text("SCORE P2:" + gameScoreP2 + "00", width - 200, height - 400);
  ellipse(x, y, 20, 20);
  fill(vermelho);
  //jogador 2
  rect(630, p2, 10, 80);
  fill (roxo);
  //jogador 1
  rect(0, p1, 10, 80);
  x = x + deltaH;
  y = y + deltaV;
  if (y < 0 | y > 480)
  {
    deltaV = -deltaV;
  }
  if (x < 1)
  {
    //condicao fim de jogo
    if (y > p1 && y < p1 + 80)
    {
      deltaH = -deltaH;
      gameScoreP1++;
    }
    fimJogo();
  }
  if (x > 629)
  {
    //condicao fim de jogo
    if (y > p2 && y < p2 + 80)
    {
      deltaH = -deltaH;
      gameScoreP2++;
    }
    fimJogo();
  }
  
  int which = frameCount % num;
  mx[which] = x;
  my[which] = y;
  
  for (int i = 0; i < num; i++){
    int index = (which + 1 + i) % num;
    ellipse(mx[index], my[index], 20, 20);
  }
  
  //controle por teclado
  if (keyPressed == true){
    if (key == 'w' || key =='W'){
      p1 = p1 - 10;
    } else if (key == 's' || key == 'S'){
      p1 = p1 + 10;
    }
    if (key == 'i' || key =='I'){
      p2 = p2 - 10;
    } else if (key == 'k' || key == 'K'){
      p2 = p2 + 10;
    }
    if(p1 > 480){
      p1 = 480;
    } else if (p1 < 0){
      p1 = 0;
    }else if (p2 > 480){
      p2 = 480;
    } else if(p2 < 0){
      p2 = 0;
    }
  }
}

//funcao fim de jogo
void fimJogo() {
  if(gameScoreP1 > gameScoreP2){
  text("Jogador 2 ganhou :p. Pressione qualquer tecla para sair", 200, 240);
  if (keyPressed == true){
    exit();
  }
  } else if(gameScoreP1 < gameScoreP2){
  text("Jogador 1 ganhou :p. Pressione qualquer tecla para sair", 200, 240);
  if (keyPressed == true){
    exit();
  }
  }
}
