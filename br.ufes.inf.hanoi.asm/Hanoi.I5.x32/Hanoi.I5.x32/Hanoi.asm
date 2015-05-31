INCLUDE C:/Irvine/Irvine32.inc
.data
  welcome1 byte "Torre de Hanoi",0
  welcome2 byte "Entre com o número de discos: ",0
  numOfDiscs byte 0
  tempDisc byte ?
  currentDisc db ?
  leftstack byte 10 dup(0)
  middlestack byte 10 dup(0)
  rightstack byte 10 dup(0)
.code 
  main proc
    call WelcomeToGame
    exit
  main endp
  take proc ; Retira o disco usando eax
    .if currentDisc != 0 ; Não permitido
      ret
    .endif    
    .if eax == 0 ; Pega o disco do topo
      mov edi, offset leftstack
      call myPop
    .elseif eax == 1 ; Move o disco para o meio
      mov edi, offset middlestack
      call myPop
    .elseif eax == 2 ; Move o disco para a direita
      mov edi, offset rightstack
      call myPop
    .endif
    ret
  take endp
  place proc ; Empilha o disco usando eax
    .if currentDisc == 0 ; Não permitido
      ret
    .endif
    .if eax == 0 ; Move para a esquerda
      mov edi, offset leftstack
      call myPush
    .elseif eax == 1 ; Move para o meio
      mov edi, offset middlestack
      call myPush
    .elseif eax == 2 ; Move para a direita
      mov edi, offset rightstack
      call myPush
    .endif
    ret
  place endp
  myPop proc uses edi ; seleciona o primeiro não zero a direita
    mov ecx, 9
    L1:
      mov bl, [edi + ecx]
      movzx eax, bl
      cmp eax, 0
      jnz L2
    loop L1
      mov bl, [edi]
      movzx eax, bl
      call WriteInt
      call CRLF    
    L2:
      add edi, ecx
      mov bl, 0
      mov [edi], bl
      mov currentDisc, al
    ret
  myPop endp
  myPush proc uses edi ; coloca o valor no ultimo zero a direita
    mov ecx, 9
    L1:
      mov bl, [edi + ecx]
      movzx eax, bl
      cmp eax, 0
      jnz L2
    loop L1
    L2:
      add edi, ecx
      inc edi
      movzx edx, currentDisc
      mov [edi], edx
      mov currentDisc, 00
    ret
  myPush endp 
  myPeek proc uses edi ; coloca o primeiro não zero no vetor
    mov ecx, 9
    L1:
      mov bl, [edi + ecx]
      movzx eax, bl
      cmp eax, 0
      jnz L2
    loop L1
    L2:
      mov tempDisc, al
    ret
  myPeek endp  
  WelcomeToGame proc ; Tela inicial
    mov edx,offset welcome1
    call writestring
    call crlf
    mov edx,offset welcome2
    call writestring
    call readint
    mov numOfDiscs,al
    mov ecx, 0  
    mov esi, 0
    mov cl, numOfDiscs
    mov esi, offset leftstack
    Looper:
      mov [esi], cl
      dec bl
      inc esi
    Loop Looper
    ret
  WelcomeToGame endp
end main
