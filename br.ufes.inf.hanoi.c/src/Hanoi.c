/*
 ===========================================================================
 Nome        : hanoi.c
 Autor       : Beatriz Franco Martins Souza
 Versão      : 1.0
 Copyright   : Código aberto
 Descrição   : Hanoi Tower recursivo
 ===========================================================================
 */

/** Incluindo as bibliotecas necessárias */
#include <stdio.h>
#include <stdlib.h>

/**
 * Núcleo da resolução com impressão da sequência ótima de movimentos
 * para transferir os discos da orgigem para o destino.
 *
 * Lista de parâmetros da função:
 * @param qtd_discos Quantidade de discos a movimentar.
 * @param origem     Número da torre origem.
 * @param destino    Número da torre destino.
 * @param temp       Número da torre temporária.
*/
void resolve(int qtdDiscos, int origem, int destino, int temp)
{
  /** Número de ordem de cada movimento na sequência de resolução. */
  static int rank = 0;

  if (qtdDiscos > 0)
  {
    resolve(qtdDiscos-1, origem, temp, destino);
    /** Impressão na tela de cada movimento */
    printf("%4d ) %c --> %c\n", ++rank, '@' + origem, '@' + destino);
    resolve(qtdDiscos-1, temp, destino, origem);
  }
}

/**
 * Função principal que invoca o núcleo da resolução com o parâmetro
 * fornecido na linha de comando e constantes que caracterizam o problema.
 *
 * @param Quantidade de discos a movimentar entre as 3 pilhas.
*/
int main(void)
{
  int numDiscos = 0;
  scanf("%d", &numDiscos);
  resolve(numDiscos, 1, 3, 2);
  return 0;
}
