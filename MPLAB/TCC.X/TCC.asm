;*******************************************************************************
;                                                                              *
;    Microchip licenses this software to you solely for use with Microchip     *
;    products. The software is owned by Microchip and/or its licensors, and is *
;    protected under applicable copyright laws.  All rights reserved.          *
;                                                                              *
;    This software and any accompanying information is for suggestion only.    *
;    It shall not be deemed to modify Microchip?s standard warranty for its    *
;    products.  It is your responsibility to ensure that this software meets   *
;    your requirements.                                                        *
;                                                                              *
;    SOFTWARE IS PROVIDED "AS IS".  MICROCHIP AND ITS LICENSORS EXPRESSLY      *
;    DISCLAIM ANY WARRANTY OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING  *
;    BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS    *
;    FOR A PARTICULAR PURPOSE, OR NON-INFRINGEMENT. IN NO EVENT SHALL          *
;    MICROCHIP OR ITS LICENSORS BE LIABLE FOR ANY INCIDENTAL, SPECIAL,         *
;    INDIRECT OR CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, HARM TO     *
;    YOUR EQUIPMENT, COST OF PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR    *
;    SERVICES, ANY CLAIMS BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY   *
;    DEFENSE THEREOF), ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER      *
;    SIMILAR COSTS.                                                            *
;                                                                              *
;    To the fullest extend allowed by law, Microchip and its licensors         *
;    liability shall not exceed the amount of fee, if any, that you have paid  *
;    directly to Microchip to use this software.                               *
;                                                                              *
;    MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF    *
;    THESE TERMS.                                                              *
;                                                                              *
;*******************************************************************************
;                                                                              *
;    Filename:                                                                 *
;    Date:                                                                     *
;    File Version:                                                             *
;    Author:                                                                   *
;    Company:                                                                  *
;    Description:                                                              *
;                                                                              *
;*******************************************************************************
;                                                                              *
;    Notes: In the MPLAB X Help, refer to the MPASM Assembler documentation    *
;    for information on assembly instructions.                                 *
;                                                                              *
;*******************************************************************************
;                                                                              *
;    Known Issues: This template is designed for relocatable code.  As such,   *
;    build errors such as "Directive only allowed when generating an object    *
;    file" will result when the 'Build in Absolute Mode' checkbox is selected  *
;    in the project properties.  Designing code in absolute mode is            *
;    antiquated - use relocatable mode.                                        *
;                                                                              *
;*******************************************************************************
;                                                                              *
;    Revision History:                                                         *
;                                                                              *
;*******************************************************************************



;*******************************************************************************
; Processor Inclusion
     list	    p=18f4550        ; list directive to define processor
   INCLUDE <P18F4550.INC>
;
;*******************************************************************************
;			CONFIGURAÇOES 
;*******************************************************************************


; TODO INSERT CONFIG HERE
; CONFIG1L
  CONFIG  PLLDIV = 5           ; PLL Prescaler Selection bits (No prescale (4 MHz oscillator input drives PLL directly))
  CONFIG  CPUDIV = OSC1_PLL2    ; System Clock Postscaler Selection bits ([Primary Oscillator Src: /1][96 MHz PLL Src: /2])
  CONFIG  USBDIV = 1            ; USB Clock Selection bit (used in Full-Speed USB mode only; UCFG:FSEN = 1) (USB clock source comes directly from the primary oscillator block with no postscale)

; CONFIG1H
  CONFIG  FOSC = HS       ; Oscillator Selection bits (Internal oscillator, HS oscillator used by USB (INTHS))
  CONFIG  FCMEN = OFF           ; Fail-Safe Clock Monitor Enable bit (Fail-Safe Clock Monitor disabled)
  CONFIG  IESO = OFF            ; Internal/External Oscillator Switchover bit (Oscillator Switchover mode disabled)

; CONFIG2L
  CONFIG  PWRT = OFF            ; Power-up Timer Enable bit (PWRT disabled)
  CONFIG  BOR = OFF             ; Brown-out Reset Enable bits (Brown-out Reset disabled in hardware and software)
  CONFIG  BORV = 3              ; Brown-out Reset Voltage bits (Minimum setting 2.05V)
  CONFIG  VREGEN = OFF          ; USB Voltage Regulator Enable bit (USB voltage regulator disabled)

; CONFIG2H
  CONFIG  WDT = OFF             ; Watchdog Timer Enable bit (WDT disabled (control is placed on the SWDTEN bit))
  CONFIG  WDTPS = 32768         ; Watchdog Timer Postscale Select bits (1:32768)

; CONFIG3H
  CONFIG  CCP2MX = ON           ; CCP2 MUX bit (CCP2 input/output is multiplexed with RC1)
  CONFIG  PBADEN = OFF          ; PORTB A/D Enable bit (PORTB<4:0> pins are configured as digital I/O on Reset)
  CONFIG  LPT1OSC = OFF         ; Low-Power Timer 1 Oscillator Enable bit (Timer1 configured for higher power operation)
  CONFIG  MCLRE = OFF         ; MCLR Pin Enable bit (MCLR pin enabled; RE3 input pin disabled)

; CONFIG4L
  CONFIG  STVREN = OFF          ; Stack Full/Underflow Reset Enable bit (Stack full/underflow will not cause Reset)
  CONFIG  LVP = OFF             ; Single-Supply ICSP Enable bit (Single-Supply ICSP disabled)
  CONFIG  ICPRT = OFF           ; Dedicated In-Circuit Debug/Programming Port (ICPORT) Enable bit (ICPORT disabled)
  CONFIG  XINST = OFF           ; Extended Instruction Set Enable bit (Instruction set extension and Indexed Addressing mode disabled (Legacy mode))

; CONFIG5L
  CONFIG  CP0 = OFF             ; Code Protection bit (Block 0 (000800-001FFFh) is not code-protected)
  CONFIG  CP1 = OFF             ; Code Protection bit (Block 1 (002000-003FFFh) is not code-protected)
  CONFIG  CP2 = OFF             ; Code Protection bit (Block 2 (004000-005FFFh) is not code-protected)
  CONFIG  CP3 = OFF             ; Code Protection bit (Block 3 (006000-007FFFh) is not code-protected)

; CONFIG5H
  CONFIG  CPB = OFF             ; Boot Block Code Protection bit (Boot block (000000-0007FFh) is not code-protected)
  CONFIG  CPD = OFF             ; Data EEPROM Code Protection bit (Data EEPROM is not code-protected)

; CONFIG6L
  CONFIG  WRT0 = OFF            ; Write Protection bit (Block 0 (000800-001FFFh) is not write-protected)
  CONFIG  WRT1 = OFF            ; Write Protection bit (Block 1 (002000-003FFFh) is not write-protected)
  CONFIG  WRT2 = OFF            ; Write Protection bit (Block 2 (004000-005FFFh) is not write-protected)
  CONFIG  WRT3 = OFF            ; Write Protection bit (Block 3 (006000-007FFFh) is not write-protected)

; CONFIG6H
  CONFIG  WRTC = OFF            ; Configuration Register Write Protection bit (Configuration registers (300000-3000FFh) are not write-protected)
  CONFIG  WRTB = OFF            ; Boot Block Write Protection bit (Boot block (000000-0007FFh) is not write-protected)
  CONFIG  WRTD = OFF            ; Data EEPROM Write Protection bit (Data EEPROM is not write-protected)

; CONFIG7L
  CONFIG  EBTR0 = OFF           ; Table Read Protection bit (Block 0 (000800-001FFFh) is not protected from table reads executed in other blocks)
  CONFIG  EBTR1 = OFF           ; Table Read Protection bit (Block 1 (002000-003FFFh) is not protected from table reads executed in other blocks)
  CONFIG  EBTR2 = OFF           ; Table Read Protection bit (Block 2 (004000-005FFFh) is not protected from table reads executed in other blocks)
  CONFIG  EBTR3 = OFF           ; Table Read Protection bit (Block 3 (006000-007FFFh) is not protected from table reads executed in other blocks)

; CONFIG7H
  CONFIG  EBTRB = OFF           ; Boot Block Table Read Protection bit (Boot block (000000-0007FFh) is not protected from table reads executed in other blocks)


;*******************************************************************************
;			       VARIAVEIS 
;*******************************************************************************;
        UDATA
				    ;VARIAVEIS DAS ENTRADAS ANALOGICAS
	#DEFINE	    VALOR_ADC	    0X20
				    ;VARIAVEIS DAS ROTINAS DE TEMPO
	#DEFINE	    W_TEMP	    0X21
	#DEFINE	    STATUS_TEMP	    0X22
	#DEFINE	    TEMPO0	    0X23		
	#DEFINE	    TEMPO1	    0X24		
	#DEFINE	    TEMPO2	    0x25
	#DEFINE	    INCTEMPO	    0x26
				    ;VARIAVEIS DAS ROTINAS LCD
	#DEFINE	    TMPLCDREGISTER  0x27	
	#DEFINE	    TESTE_LINHA	    0x28		
	#DEFINE	    VAR1	    0X29
	#DEFINE	    VAR2	    0x2A
	#DEFINE	    DADO_LCD	    0X37
	#DEFINE	    SELECAO	    0X3A
				    ;VARIAVEIS PARA FLAGS
	#DEFINE	    FLAG	    0x2D
	#DEFINE	    FLAG01	    0X45
	#DEFINE	    FLAG02	    0X4A
	#DEFINE	    CONT	    0x2E		
				    ;VARIAVEIS PARA EUSART
	#DEFINE	    DATAR	    0X2F
	#DEFINE	    DADO	    0X30
				    ;VARIAVEIS PARA SENSORES ANALOGICOS
	#DEFINE	    UMIDADE	    0X31
	#DEFINE	    LUMINOSIDADE    0X32
	#DEFINE	    TEMPERATURA	    0X33
	#DEFINE	    TEMP_IDEIAL_MAX 0X34
	#DEFINE	    TEMP_IDEIAL_MIN 0X47
	#DEFINE	    UMID_IDEIAL_MAX 0X35
	#DEFINE	    UMID_IDEIAL_MIN 0X48
	#DEFINE	    LUMI_IDEIAL_MAX 0X36
	#DEFINE	    LUMI_IDEIAL_MIN 0X49
	#DEFINE	    TESTE	    0X38
	#DEFINE	    RESULTADO	    0X39
	#DEFINE	    CONTADOR_SENSOR 0X3B
	#DEFINE	    MAX		    0x2B
	#DEFINE	    MIN		    0x2C
	#DEFINE	    VALOR	    0x41
	#DEFINE	    DIVI	    0X3C
	#DEFINE	    RESULTADO_DIVI  0X3D
	#DEFINE	    TEMPERATURA_L   0X3E
	#DEFINE	    LUMINOSIDADE_L  0X3F
	#DEFINE	    UMIDADE_L	    0X40
	;VARIAVEIS PARA TRANSFORMACAO DE BINARIO EM ASCCI
	#DEFINE	    VALOR_B	    0X42
	#DEFINE	    UNIDADE	    0X43
	#DEFINE	    DEZENA	    0X44
	#DEFINE	    SELECAO_E	    0X46
	#DEFINE	    BA		    0X50
	#DEFINE	    DUTY_CYCLE	    0X51
	#DEFINE	    PWM_MOTOR	    0X52
	#DEFINE	    PWM_P	    0X53
	#DEFINE	    DADO_EPROM	    0X54
	#DEFINE	    POSICAO_EPROM   0X55
	#DEFINE	    DIAS	    0X56


;
;*******************************************************************************
;			     FLAGS EM GERAL
;*******************************************************************************
	#DEFINE	    SET_TEMPO	FLAG,0
	#DEFINE	    REQ_FLAG	FLAG,1
	#DEFINE	    BAIXO	FLAG,2
	#DEFINE	    CIMA	FLAG,3
	#DEFINE	    ENTER	FLAG,4
	#DEFINE	    RESULT_OK	FLAG,5
	#DEFINE	    RESULT_MAIS	FLAG,6
	#DEFINE	    RESULT_MENO	FLAG,7
	#DEFINE	    MENU	FLAG01,0
	#DEFINE	    ENTRA	FLAG01,1
	#DEFINE	    TERMINOU_L	FLAG01,2
	#DEFINE	    ENTRA_1	FLAG01,3 
	#DEFINE	    DESLIGA_M	FLAG01,4
	#DEFINE	    BOT_ALTO	FLAG01,5
	#DEFINE	    VENTILADOR	FLAG01,6
	#DEFINE	    LEDS	FLAG01,7
	#DEFINE	    MOTOR_T	FLAG02,0
	#DEFINE	    DEFINIDO	FLAG02,1
	#DEFINE	    TEMP_DIVI	FLAG02,2
	#DEFINE	    PLANTA_I_S	FLAG02,3
	#DEFINE	    ENTRA_2	FLAG02,4
	#DEFINE	    ENTRA_3	FLAG02,5
	#DEFINE	    TRAVA_MOTOR	FLAG02,6
;*******************************************************************************
; Reset Vector
;*******************************************************************************

RES_VECT  CODE    0x0000	    ; processor reset vector
  
	  GOTO    START		    ; go to beginning of program

;*******************************************************************************
;				INTERRUPÇÕES
;----------------------------------PIC18's--------------------------------------
				    ;INTERRUPÇOES DE ALTO NIVEL
ISRHV	    CODE    0x0008
	    GOTO    HIGH_ISR
					    ;INTERRUPÇOES DE BAIXO NIVEL
ISRLV	    CODE    0x0018
	    GOTO    LOW_ISR

ISRH     CODE				    ;INTERRUPÇOES DE ALTO NIVEL
HIGH_ISR
	 
	    BTFSC	PIR1,RCIF	    ;TESTA SE CHEGOU ALGUMA COISA EM RX
	    CALL	TRATA_RX	    ;SE SIM CHAMA TRATA RX
	    BTFSC	PIR1,ADIF	    ;TESTA SE CHEGOU ALGUMA COISA EM RX
	    CALL	LIBERA_S	    ;SE SIM CHAMA TRATA RX
	    
	    BTFSC	TRAVA_MOTOR
	    GOTO	DESLIGA_
	    BTFSC	INTCON,INT0IF
	    CALL	SOBRE_CORRENTE
DESLIGA_	
	    BTFSC	PIR1,TMR2IF
	    CALL	VERIFICA_MOTOR	    
	    BCF		INTCON,INT0IF
	    BCF		PIR1,ADIF
	    BCF		PIR1,TMR2IF
	    BCF		PIR1,ADIF
EXIT
	    RETFIE  FAST		    ;VOLTA PARA A PROGRAMAÇÃO

LOW_ISRL CODE				    ;INTERRUPÇOES EM BAIXO NIVEL
LOW_ISR		
	    BTFSS	PORTB,7		    ;TESTA SE O BOTAO BAIXO FOI PRESSIONADO
	    BSF		BAIXO		    ;SE SIM SETA A FLAG BAIXO
	    BTFSS	PORTB,6		    ;TESTA SE O BOTAO ENTER FOI PRESSIONADO
	    BSF		ENTER	
	    BTFSS	PORTB,5		    ;TESTA SE O BOTAO CIMA FOI PRESSIONADO
	    BSF		CIMA
	    BTFSS	PLANTA_I_S
	    GOTO	PULA_MENU
	    BTFSS	PORTB,4
	    BSF		MENU
PULA_MENU
	    BTFSC	INTCON,TMR0IF	    ;TESTA SE O TIMER 0 ESTOUROU
	    CALL	LEITURA_SENSORES
	    BTFSC	INTCON,RBIF	    ;TESTA SE ALGUM BOTAO NO PORTB MUDOU DE ESTADO
	    CALL	LCD_BOTOES	    ;SE SIM CHAMA LCD_BOTOES
	    BCF		INTCON,RBIF	    ;DESABILITA O ALERME DE MUDANÇA DE ESTADO
	    BCF		INTCON,TMR0IF	    ;REINICIA O TIMER 0
	    RETFIE			    ;VOLTA PARA A PROGRAMAÇÃO
;*******************************************************************************
;			   TRATA A ROTINA DE BOTOES DO LCD
;*******************************************************************************
LCD_BOTOES	
	    CALL	TELA_LCD	    ;CHAMA TELA LCD
	    RETURN
;*******************************************************************************
;			   TRATA A ROTINA DE INTERRUPÇÃO RX
;*******************************************************************************
TRATA_RX
	   MOVLW	H'06'						;move literal 06h para Work
	   ANDWF	RCSTA,W						;W = W and RCSTA
	   BTFSS	STATUS,Z					;Ocorreu algum erro?
	   GOTO		RxError						;sim. Desvia para corrigir
	
		
	   CLRF		WREG
	   MOVF		RCREG,W						;não. Copia dado para Work
	   MOVWF	DATAR				    		;armazena byte recebido
	   CALL		TRATA_DADO
RxError
	    bcf		RCSTA,CREN					;limpa recepção contínua
	    bsf		RCSTA,CREN
	    RETURN

LIBERA_S    
	    BSF		TERMINOU_L
	    RETURN
	    
SOBRE_CORRENTE
	    BSF		TRAVA_MOTOR
	    MOVLW	"T"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"R"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"A"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"V"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"A"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	" "
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"D"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"E"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	" "
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"S"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"E"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"G"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"U"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"R"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"A"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"N"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"C"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"A"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	" "
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"A"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"C"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"I"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"O"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"N"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"A"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"D"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"A"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	.13
	     MOVWF	TXREG
	    CALL	BUFFER
	    CALL	TEXTO_ERRO_MOTOR
	    RETURN
TEXTO_ERRO_MOTOR
	    CALL    LCDCLEAR
	    MOVLW   0X80
	    CALL    LCDLOCATE
	    CALL    LS
	    CALL    LO
	    CALL    LB
	    CALL    LR
	    CALL    LE
	    CALL    ESPACO
	    CALL    LC
	    CALL    LO
	    CALL    LR
	    CALL    LR
	    CALL    LE
	    CALL    LN
	    CALL    LT
	    CALL    LE
	    MOVLW   0XC3
	    CALL    LCDLOCATE
	    CALL    LN
	    CALL    LO
	    CALL    ESPACO
	    CALL    LM
	    CALL    LO
	    CALL    LT
	    CALL    LO
	    CALL    LR
	    RETURN
	    
	    
	    
;*******************************************************************************
;			   TRATA_DADOS DA INTERRUPÇÃO RCIF
;*******************************************************************************
TRATA_DADO	
;1 ATE 3: SELEÇÃO DE PLANTAS
;4 ATE 6: REQUISIÇÃO DE SENSORES
;7:FALHA NA CONEXÃO COM A REDE
;8ERRO COMUNICAÇÃO COM O BROKER
	    MOVLW	H'41'	    ;MOVE VALOR PARA W
	    MOVWF	DADO	    ;MOVE W PARA DADO
	    MOVLW	"S"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"O"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"L"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"I"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"C"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"I"
	    MOVWF	TXREG
	    CALL	BUFFER
	    CALL	ALFACE
	    MOVLW	"T"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"A"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"D"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"O"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	":"
	    MOVWF	TXREG
	    CALL	BUFFER

	    MOVF	DATAR,W	    ;MOVE O VALOR DO DADO RECEBIDO EM RX PARA W
	    MOVWF	TXREG	    ;MOVE PARA TXREG
	    CALL	BUFFER
	    MOVLW	.13		    ;MOVE  PARA W
	    MOVWF	TXREG	    ;MOVE PARA TXREG
	    CALL	BUFFER
	    BSF		REQ_FLAG    ;SETA A FLAG REQUISIÇÃO DE DADO SENSORES
	    
	    MOVF	DATAR,W	    ;MOVE O VALOR DO DADO RECEBIDO EM RX PARA W
	    XORWF	DADO,0	    ;COMPARAÇÃO ENTRE O DADO RECEBIDO EM RX COM DADO
	    BTFSC	STATUS,Z    ;SE OS DADOS FOREM DIFERENTES PULE 
	    CALL	ALFACE_SE ;SE IGUAIS OUVE UMA SOLICITAÇÃO PARA ALFACE
		
	    INCF	DADO	    ;INCREMENTA O DADO 
	    MOVF	DATAR,W	    ;MOVE O VALOR DO DADO RECEBIDO EM RX PARA W
	    XORWF	DADO,0	    ;COMPARAÇÃO ENTRE O DADO RECEBIDO EM RX COM DADO
	    BTFSC	STATUS,Z    ;SE OS DADOS FOREM DIFERENTES PULE 
	    CALL	CEBOLINHA_SE   ;SE IGUAIS OUVE UMA SOLICITAÇÃO PARA CEBOLINHA
		
	    INCF	DADO	    ;INCREMENTA O DADO 
	    MOVF	DATAR,W	    ;MOVE O VALOR DO DADO RECEBIDO EM RX PARA W
	    XORWF	DADO,0	    ;COMPARAÇÃO ENTRE O DADO RECEBIDO EM RX COM DADO
	    BTFSC	STATUS,Z    ;SE OS DADOS FOREM DIFERENTES PULE 
	    CALL	SALSINHA_SE   ;SE IGUAIS OUVE UMA SOLICITAÇÃO PARA SALSINHA
		
	    INCF	DADO	    ;INCREMENTA O DADO 
	    MOVF	DATAR,W	    ;MOVE O VALOR DO DADO RECEBIDO EM RX PARA W
	    XORWF	DADO,0	    ;COMPARAÇÃO ENTRE O DADO RECEBIDO EM RX COM DADO
	    BTFSC	STATUS,Z    ;SE OS DADOS FOREM DIFERENTES PULE 
	    CALL	REQ_U	    ;SE IGUAIS OUVE UMA SOLICITAÇÃO PARA O SENSOR DE UMIDADE
		
		
	    INCF	DADO	    ;INCREMENTA O DADO 
	    MOVF	DATAR,W	    ;MOVE O VALOR DO DADO RECEBIDO EM RX PARA W
	    XORWF	DADO,0	    ;COMPARAÇÃO ENTRE O DADO RECEBIDO EM RX COM DADO
	    BTFSC	STATUS,Z    ;SE OS DADOS FOREM DIFERENTES PULE 
	    CALL	REQ_T	    ;SE IGUAIS OUVE UMA SOLICITAÇÃO PARA O SENSOR DE TEMPERATURA
		
	    INCF	DADO	    ;INCREMENTA O DADO 
	    MOVF	DATAR,W	    ;MOVE O VALOR DO DADO RECEBIDO EM RX PARA W
	    XORWF	DADO,0	    ;COMPARAÇÃO ENTRE O DADO RECEBIDO EM RX COM DADO
	    BTFSC	STATUS,Z    ;SE OS DADOS FOREM DIFERENTES PULE 
	    CALL	REQ_L	    ;SE IGUAIS OUVE UMA SOLICITAÇÃO PARA O SENSOR DE LUMINOSIDADE
		
	    INCF	DADO	    ;INCREMENTA O DADO 
	    MOVF	DATAR,W	    ;MOVE O VALOR DO DADO RECEBIDO EM RX PARA W
	    XORWF	DADO,0	    ;COMPARAÇÃO ENTRE O DADO RECEBIDO EM RX COM DADO
	    BTFSC	STATUS,Z    ;SE OS DADOS FOREM DIFERENTES PULE 
	    CALL	ERRO_REDE   ;SE IGUAIS OUVE UM AVISO DE ERRO NAS CONFIGURAÇÕES DE REDE
		
	    INCF	DADO	    ;INCREMENTA O DADO 
	    MOVF	DATAR,W	    ;MOVE O VALOR DO DADO RECEBIDO EM RX PARA W
	    XORWF	DADO,0	    ;COMPARAÇÃO ENTRE O DADO RECEBIDO EM RX COM DADO
	    BTFSC	STATUS,Z    ;SE OS DADOS FOREM DIFERENTES PULE 
	    CALL	ERRO_BROKER ;SE IGUAIS OUVE UM AVISO DE ERRO NAS CONFIGURAÇÕES DE BROKER
		
		
	    BCF	REQ_FLAG
	    CLRF	DADO
	    RETURN
;*******************************************************************************
;				TRATA ERROS
;*******************************************************************************
ERRO_REDE	
	    CALL	LCDCLEAR
	    MOVLW	0X80
	    CALL	LCDLOCATE
	    CALL	LE
	    CALL	LR
	    CALL	LR
	    CALL	LO
	    CALL	ESPACO
	    CALL	LR
	    CALL	LE
	    CALL	LD
	    CALL	LE
	    RETURN
		
		
ERRO_BROKER	
	    CALL	LCDCLEAR
	    MOVLW	0X80
	    CALL	LCDLOCATE
	    CALL	LE
	    CALL	LR
	    CALL	LR
	    CALL	LO
	    CALL	ESPACO
	    CALL	LB
	    CALL	LR
	    CALL	LO
	    CALL	LK
	    CALL	LE
	    CALL	LR
	    RETURN
CEBOLINHA_SE
	    CALL	TEXTO_PLANTA
	    MOVLW	"C"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"E"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"B"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"O"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"L"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"I"
	    MOVWF	TXREG
	    CALL	BUFFER
	    CALL	ALFACE
	    MOVLW	"N"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"H"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"A"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	.13		    ;MOVE  PARA W
	    MOVWF	TXREG	    ;MOVE PARA TXREG
	    CALL	BUFFER
	    CALL	CEBOLINHA
	    RETURN
SALSINHA_SE
	    CALL	TEXTO_PLANTA
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"S"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"A"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"L"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"S"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"I"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"N"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"H"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"A"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW   .13		    ;MOVE  PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    CALL	SALSINHA
	    RETURN
ALFACE_SE
	    CALL	TEXTO_PLANTA
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"A"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"L"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"F"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"A"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"C"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"E"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	.13		    ;MOVE  PARA W
	    MOVWF	TXREG	    ;MOVE PARA TXREG
	    CALL	BUFFER
	    CALL	ALFACE
	    RETURN
	   
TEXTO_PLANTA
	    MOVLW	"P"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"L"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"A"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"N"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"T"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"A"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	" "
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"S"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"E"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"L"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"E"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"C"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"I"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"O"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"N"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"A"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"D"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	"A"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	":"
	    MOVWF	TXREG
	    CALL	BUFFER
	    MOVLW	" "
	    RETURN
	    
	
	    
;*******************************************************************************
;				MAIN PROGRAM
;*******************************************************************************
MAIN_PROG CODE                          
START
	CLRF		RCON
	#DEFINE		BT_ENTER    PORTB,6	;Define como BOTAO_MENU o bit 6 do PORTB.
	#DEFINE		BT_C	    PORTB,5	;Define como BOTAO_INC o bit 5 do PORTB.
	#DEFINE		BT_B	    PORTB,4	;Define como BOTAO_DEC o bit 4 do PORTB.
	#DEFINE		BT_E	    PORTB,3	;Define como BOTAO_ENTER o bit 3 do PORTB.
	#DEFINE		BT_D	    PORTB,2;Define como BOTAO_ENTER o bit 3 do PORTB.

    ;******************************************************************************
    ;				DEFINICAO DAS SAIDAS			      *
    ;******************************************************************************
	#DEFINE		LCD_RS	    PORTD,2	;DEFINE LCD_RS COMO 
	#DEFINE		LCD_E	    PORTD,3	;DEFINE LCD_E COMO
	#DEFINE		LCD_DB4	    PORTD,4	;DEFINE LCD_DB4 COMO 
	#DEFINE		LCD_DB5	    PORTD,5	;DEFINE LCD_DB5 COMO 
	#DEFINE		LCD_DB6	    PORTD,6	;DEFINE LCD_DB6 COMO 
	#DEFINE		LCD_DB7	    PORTD,7	;DEFINE LCD_DB7 COMO 
	#DEFINE		LED_R	    PORTE,0	;DEFINE LED VERMELHO COMO
	#DEFINE		LED_G	    PORTE,1	;DEFINE LED VERDE COMO
	#DEFINE		LED_B	    PORTE,2	;DEFINE LED AZUL COMO
	#DEFINE		VENTI	    PORTE,3
	#DEFINE		PWM	    PORTB,3	;DEFINE	PWM COMO
	#DEFINE		RELE	    PORTD,0
	
;*******************************************************************************
;			CONFIGURAÇÃO DA EUSART
;*******************************************************************************
	    MOVLW	H'81'	
	    MOVWF	SPBRG		;Configuração de BAUD RATE
	    MOVLW	B'00100110'		
					
	    MOVWF   	TXSTA		;HABILITA ENVIO DE DADOS
	    MOVLW	B'10010000'		
		    			
	    MOVWF	RCSTA
	    
	    BSF		TXSTA,TXEN
;*******************************************************************************
;			CONFIGURAÇÃO DAS ENTRADAS ANALOGICAS 
;*******************************************************************************	   
	    MOVLW	H'01'
	    MOVWF	ADCON0
	    MOVLW	H'0C'
	    MOVWF	ADCON1
	    MOVLW	H'10'
	    MOVWF	ADCON2
;*******************************************************************************
;			CCPxCON: REGISTRO DE CONTROLE CCPx PADRÃO
;*******************************************************************************
	  
	    MOVLW	.255
	    MOVWF	PR2
	    
	    MOVLW	B'00110000'
	    MOVWF	CCP2CON
	    MOVLW	.128
	    MOVWF	DUTY_CYCLE
	    
	    
	    
	    
	    
	    
	    
;*******************************************************************************
;			CONFIGURAÇÃO DO TIMER 0
;*******************************************************************************
	    MOVLW	B'10000111'
	    MOVWF	T0CON
	    MOVLW	B'00000110'
	    MOVWF	T2CON
	    MOVLW	B'00000000'
	    MOVWF	T3CON
	    MOVLW	B'00000000'
	    MOVWF	T1CON
	    
;*******************************************************************************
;			CONFIGURAÇÃO DOS TRIS
;*******************************************************************************
	    MOVLW	B'11110111'		;SETA TRISB COMO SAIDA 
	    MOVWF	TRISB
	    BCF		LATB,3
	    MOVLW	B'00000000'		;CONFIGURA OS TRISX 1= ENTRADA 0= SAIDA
	    MOVWF	TRISD
	    MOVLW	B'11111111'
	    MOVWF	TRISA
	    MOVLW	B'11111000'
	    MOVWF	TRISE
	    MOVLW	B'10000001'
	    MOVWF	TRISC
	    
	    
;*******************************************************************************
;			CONFIGURAÇÃO DAS INTERRUPÇOES
;*******************************************************************************	   
	    MOVLW	B'11101000'
	    MOVWF	INTCON				
				
	    MOVLW	B'10000000'
	    MOVWF	INTCON2
		    
	    CLRF	INTCON3
				
	    BSF		RCON,IPEN
				
	    MOVLW	.99
	    MOVWF	PIE1
		
	    MOVLW	B'00000010'
	    MOVWF	PIE2
					
	    MOVLW	B'01100010'
	    MOVWF	IPR1
	    MOVLW	B'00000000'
	    MOVWF	IPR2
	    CALL	INICIALIZA_LCD
;*******************************************************************************
;			SELEÇÃO DE PLANTA 
;*******************************************************************************	
	    MOVLW	 H'01'		;MOVE 0 PARA W
	    MOVWF	SELECAO
	    BSF		ENTRA
	    CALL	TELA_LCD
	    CALL	LEITURA_SENSORES
TRAVA_
	    BTFSC	PLANTA_I_S
	    GOTO	LOOP
	    BTFSS	BOT_ALTO
	    GOTO	TRAVA_
	    BTFSS	PORTB,7		    ;TESTA SE O BOTAO BAIXO FOI PRESSIONADO
	    GOTO	TRAVA_	    ;SE SIM SETA A FLAG BAIXO
	    BTFSS	PORTB,6		    ;TESTA SE O BOTAO ENTER FOI PRESSIONADO
	    GOTO	TRAVA_	
	    BTFSS	PORTB,5		    ;TESTA SE O BOTAO CIMA FOI PRESSIONADO
	    GOTO	TRAVA_
	    BTFSS	PORTB,4
	    GOTO	TRAVA_
	    MOVLW	B'11111000'
	    MOVWF	INTCON	
	    BCF		BOT_ALTO
	    GOTO	TRAVA_
;*******************************************************************************
;			LOOP
;*******************************************************************************		    
	    
	    
LOOP	
	    CLRF	SELECAO
	    CALL	TELA_LCD
	    BSF		INTCON,5
	    BSF		T0CON,7
LOOP_TESTE
	    
	    BTFSS	BOT_ALTO
	    GOTO	LOOP_TESTE
	    BTFSS	PORTB,7		    ;TESTA SE O BOTAO BAIXO FOI PRESSIONADO
	    GOTO	LOOP_TESTE	    ;SE SIM SETA A FLAG BAIXO
	    BTFSS	PORTB,6		    ;TESTA SE O BOTAO ENTER FOI PRESSIONADO
	    GOTO	LOOP_TESTE	
	    BTFSS	PORTB,5		    ;TESTA SE O BOTAO CIMA FOI PRESSIONADO
	    GOTO	LOOP_TESTE
	    BTFSS	PORTB,4
	    GOTO	LOOP_TESTE
	    MOVLW	B'11101000'
	    MOVWF	INTCON	
	    BCF		BOT_ALTO
	    GOTO	LOOP_TESTE
    
;******************************************************************************
;				SUBROTINAS
;******************************************************************************
;ESCRITA_EPROM
;	    MOVF    DADO_EPROM,W
;	    MOVWF   EEDATA
;	    MOVF    POSICAO_EPROM
;	    MOVWF   EEADR
;	    BCF	    EECON1, EEPGD ; Point to DATA memory
;	    BCF	    EECON1, CFGS ; Access EEPROM
;	    BSF	    EECON1, WREN ; Enable writes
;	    BCF	    INTCON, GIE ; Disable Interrupts
;	    MOVLW   55h ;
;	    MOVWF   EECON2 ; Write 55h
;	    MOVLW   0AAh ;
;	    MOVWF   EECON2 ; Write 0AAh
;	    BSF	    EECON1, WR ; Set WR bit to begin
;	    
;LEITURA_EPROM
;	    MOVLW POSICAO_EPROM ;
;	    MOVWF EEADR ; Lower bits of Data Memory Address to read
;	    BCF EECON1, EEPGD ; Point to DATA memory
;	    BCF EECON1, CFGS ; Access EEPROM
;	    BSF EECON1, RD ; EEPROM Read
;	    MOVF EEDATA, W ; W = EEDATA
;	    

;******************************************************************************
;			ROTINA LIGA E DESLIGA PWM
;******************************************************************************
		;ESTA ROTINA É CHAMADA PELO ESTOURO DO TIMER 2
	
VERIFICA_MOTOR			    ;ESTA ROTINA É CHAMADA PELO ESTOURO DO TIMER 2
	    BTFSC   TRAVA_MOTOR
	    CALL    DESLIGA_MOTOR
	    BTFSS   DESLIGA_M	    ;TESTA SE A FLAG FOI ACIONADA
	    CALL    INC_MOTOR	    ;SE NÃO  VAI PARA ...
	    BTFSC   DESLIGA_M	    ;TESTA SE A FLAG FOI ACIONADA
	    CALL    DEC_MOTOR	    ;SE SIM  VAI PARA ...
	    RETURN
;******************************************************************************
;				ROTINA DO MOTOR
;******************************************************************************	 
LIGA_MOTOR
	    BTFSC   TRAVA_MOTOR
	    CALL    DESLIGA_MOTOR
	    MOVLW   B'00000111'
	    MOVWF   T2CON
	    MOVLW   B'00001111'	    ;CONFIGURAÇOES DO CCP2CON
	    MOVWF   CCP2CON	    ;MOVE AS CONFIG PARA CCP2CON
	    BCF	    DESLIGA_M	    ;DESABILITA A FLAG 
	    RETURN
DESLIGA_MOTOR
	    BSF	    DESLIGA_M	    ;LIGA A FLAG
	    RETURN
INC_MOTOR
	    MOVF    DUTY_CYCLE,W
	    XORWF   CCPR2L,0
	    BTFSS   STATUS,Z
	    INCF    CCPR2L
	    RETURN
DEC_MOTOR
	    
	    MOVLW   .0
	    XORWF   CCPR2L,0
	    BTFSS   STATUS,Z
	    GOTO    DEC_M
	    MOVLW   B'00000000'
	    MOVWF   CCP2CON
	    MOVLW   B'00000110'
	    MOVWF   T2CON
	    RETURN
DEC_M	
	    DECF    CCPR2L
	    RETURN

;*******************************************************************************
;			    SELEÇÃO DE PLANTAS
;*******************************************************************************	
ALFACE	    
	    MOVLW   .4
	    MOVWF   DIAS
	;ROTINA PARA SETAR OS VALORES QUE OS SENSORES DEVEM ATUAR
	    MOVLW   .25
	    MOVWF   TEMP_IDEIAL_MAX	;CONFIGURA VALOR MAXIMO DE ACORDO COM W
	    MOVLW   .20
	    MOVWF   TEMP_IDEIAL_MIN	;CONFIGURA VALOR MINIMO DE ACORDO COM W
	    MOVLW   .90
	    MOVWF   UMID_IDEIAL_MAX	;CONFIGURA VALOR MAXIMO DE ACORDO COM W
	    MOVLW   .50
	    MOVWF   UMID_IDEIAL_MIN	;CONFIGURA VALOR MINIMO DE ACORDO COM W
	    MOVLW   .80
	    MOVWF   LUMI_IDEIAL_MAX	;CONFIGURA VALOR MAXIMO DE ACORDO COM W
	    MOVLW   .70
	    MOVWF   LUMI_IDEIAL_MIN	;CONFIGURA VALOR MINIMO DE ACORDO COM W
	    BSF	    PLANTA_I_S
;	    MOVLW   .1
;	    MOVWF   DADO_EPROM
;	    MOVLW   .0
;	    MOVWF   POSICAO_EPROM
;	    CALL    ESCRITA_EPROM
	    RETURN
CEBOLINHA
	    MOVLW   .3
	    MOVWF   DIAS
	;ROTINA PARA SETAR OS VALORES QUE OS SENSORES DEVEM ATUAR
	    MOVLW   H'F0'
	    MOVLW   .27
	    MOVWF   TEMP_IDEIAL_MAX	;CONFIGURA VALOR MAXIMO DE ACORDO COM W
	    MOVLW   .22
	    MOVWF   TEMP_IDEIAL_MIN	;CONFIGURA VALOR MINIMO DE ACORDO COM W
	    MOVLW   .90
	    MOVWF   UMID_IDEIAL_MAX	;CONFIGURA VALOR MAXIMO DE ACORDO COM W
	    MOVLW   .60
	    MOVWF   UMID_IDEIAL_MIN	;CONFIGURA VALOR MINIMO DE ACORDO COM W
	    MOVLW   .80
	    MOVWF   LUMI_IDEIAL_MAX	;CONFIGURA VALOR MAXIMO DE ACORDO COM W
	    MOVLW   .60
	    MOVWF   LUMI_IDEIAL_MIN	;CONFIGURA VALOR MINIMO DE ACORDO COM W
	    BSF	    PLANTA_I_S

	    RETURN
SALSINHA
	    MOVLW   .5
	    MOVWF   DIAS
	;ROTINA PARA SETAR OS VALORES QUE OS SENSORES DEVEM ATUAR    
	    MOVLW   .25
	    MOVWF   TEMP_IDEIAL_MAX	;CONFIGURA VALOR MAXIMO DE ACORDO COM W
	    MOVLW   .20
	    MOVWF   TEMP_IDEIAL_MIN	;CONFIGURA VALOR MINIMO DE ACORDO COM W
	    MOVLW   .100
	    MOVWF   UMID_IDEIAL_MAX	;CONFIGURA VALOR MAXIMO DE ACORDO COM W
	    MOVLW   .90
	    MOVWF   UMID_IDEIAL_MIN	;CONFIGURA VALOR MINIMO DE ACORDO COM W
	    MOVLW   .80
	    MOVWF   LUMI_IDEIAL_MAX	;CONFIGURA VALOR MAXIMO DE ACORDO COM W
	    MOVLW   .70
	    MOVWF   LUMI_IDEIAL_MIN	;CONFIGURA VALOR MINIMO DE ACORDO COM W
	    BSF	    PLANTA_I_S
	    RETURN
;*******************************************************************************
;			    TESTE DO TXREG
;*******************************************************************************
BUFFER
	    BTFSS   TXSTA,TRMT	    ;TESTA DE TXREG JA ESTA VAZIO 
	    GOTO    BUFFER	    ;LOOP
	    CLRF    TXREG	    ;LIMPA TXREG
	    RETURN
;*******************************************************************************
;			    REQUISIÇOES DE LEITURA WEB/LCD
;*******************************************************************************
;		     REQUISIÇOES DE LEITURA NO SENSORE DE UMIDADE

REQ_U				
	    MOVF    UMIDADE,W	    ;MOVE VALOR DE UMIDADE PARA W
	    CALL    TRANFORMA_ASCII
REQ_WEB_U
	    MOVLW   ' '		    ;MOVE U PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'U'		    ;MOVE U PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'M'		    ;MOVE M PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'I'		    ;MOVE I PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'D'		    ;MOVE I PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'A'		    ;MOVE U PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'D'		    ;MOVE M PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'E'		    ;MOVE I PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   ':'		    ;MOVE P PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   ' '		    ;MOVE P PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVF    DEZENA,W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVF    UNIDADE,W
	    MOVWF   TXREG
	    CALL    BUFFER
	    MOVLW   '%'		    ;MOVE U PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   .13		    ;MOVE % PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    
	    
	     RETURN
	    
;	    REQUISIÇOES DE LEITURA NO SENSORE DE TEMPERATURA
REQ_T
	    MOVF    TEMPERATURA,W
	    CALL    TRANFORMA_ASCII
REQ_WEB_T
	   
	    MOVLW   ' '		    ;MOVE % PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'T'		    ;MOVE T PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'E'		    ;MOVE M PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'M'		    ;MOVE P PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'P'		    ;MOVE T PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'E'		    ;MOVE M PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'R'		    ;MOVE P PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'A'		    ;MOVE T PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'T'		    ;MOVE M PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'U'		    ;MOVE P PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'R'		    ;MOVE T PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'A'		    ;MOVE M PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   ':'		    ;MOVE P PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   ' '		    ;MOVE P PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVF    DEZENA,W
	    MOVWF   TXREG			;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVF    UNIDADE,W
	    MOVWF   TXREG
	    CALL    BUFFER
	    MOVLW   '°'		    ;MOVE P PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'C'		    ;MOVE P PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   .13		    ;MOVE  PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    RETURN
	    
;	    REQUISIÇOES DE LEITURA NO SENSORE DE LUMINOSIDADE	   
REQ_L
	    
	    MOVF    LUMINOSIDADE,W	    ;MOVE VALOR DE UMIDADE PARA W
	    CALL    TRANFORMA_ASCII
REQ_WEB_L
	    
	    MOVLW   ' '		    ;MOVE U PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'L'		    ;MOVE L PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'U'		    ;MOVE M PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'M'		    ;MOVE I PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'I'		    ;MOVE T PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'N'		    ;MOVE M PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'O'		    ;MOVE P PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'S'		    ;MOVE T PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'I'		    ;MOVE M PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'D'		    ;MOVE P PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'A'		    ;MOVE T PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'D'		    ;MOVE M PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'E'		    ;MOVE P PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   ':'		    ;MOVE P PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   ' '		    ;MOVE P PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVF    DEZENA,W
	    MOVWF   TXREG			;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVF    UNIDADE,W
	    MOVWF   TXREG
	    CALL    BUFFER
	    MOVLW   '%'		    ;MOVE U PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   .13		    ;MOVE % PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    RETURN
COLHEITA
	    MOVLW   ' '		    ;MOVE U PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'H'		    ;MOVE L PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'O'		    ;MOVE M PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'R'		    ;MOVE I PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'A'		    ;MOVE T PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   ' '		    ;MOVE M PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'D'		    ;MOVE P PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'E'		    ;MOVE T PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   ' '		    ;MOVE M PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'C'		    ;MOVE P PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'O'		    ;MOVE T PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'L'		    ;MOVE M PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'H'		    ;MOVE P PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'E'		    ;MOVE P PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVLW   'R'		    ;MOVE P PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    MOVWF   TXREG
	    MOVLW   .13		    ;MOVE % PARA W
	    MOVWF   TXREG	    ;MOVE PARA TXREG
	    CALL    BUFFER
	    RETURN
;******************************************************************************
;			LEITURA DOS SENSORES ANALOGICOS
;******************************************************************************
LEITURA_SENSORES  
	    MOVLW   .0
	    XORWF   DIAS,W
	    BTFSC   STATUS,Z
	    GOTO    PULA_COLHEITA
	    DECF    DIAS,F
	    BTFSC   STATUS,Z
	    CALL    COLHEITA
PULA_COLHEITA
	    BTFSS   PLANTA_I_S
	    RETURN
	    MOVLW   B'00000011'		;MOVE O VALOR 3 CONFIGURANDO A LEITURA 
					;DO AN0
	    MOVWF   ADCON0		;CONFIGURA O REGISTRADOR ADCON0
	    CALL    ESPERA_LEITURA	;ESPERA ATE QUE A LEITURA DA ENTRADA 
					;ESTEJA CONCLUIDA
	    MOVF    ADRESH,W		;MOVE O VALOR LIDO PARA W
	    MOVWF   LUMINOSIDADE_L	;MOVE O VALOR DE W PARA A VARIAVEL
	    
	    MOVLW   B'00000111'		;MOVE O VALOR 3 CONFIGURANDO A LEITURA DO AN1
	    MOVWF   ADCON0		;CONFIGURA O REGISTRADOR ADCON0
	    CALL    ESPERA_LEITURA	;ESPERA ATE QUE A LEITURA DA ENTRADA ESTEJA CONCLUIDA
	    MOVF    ADRESH,W		;MOVE O VALOR LIDO PARA W
	    MOVWF   TEMPERATURA_L	;MOVE O VALOR DE W PARA A VARIAVEL 
	    
	    MOVLW   B'00001011'		;MOVE O VALOR 3 CONFIGURANDO A LEITURA DO AN2
	    MOVWF   ADCON0		;CONFIGURA O REGISTRADOR ADCON0
	    CALL    ESPERA_LEITURA	;ESPERA ATE QUE A LEITURA DA ENTRADA ESTEJA CONCLUIDA
	    MOVF    ADRESH,W		;MOVE O VALOR LIDO PARA W
	    MOVWF   UMIDADE_L		;MOVE O VALOR DE W PARA A VARIAVEL   
	  
	    CALL    DIVISAO		;CHAMA ROTINA DE DIVISAO
	    MOVWF   UMIDADE		;MOVE O RESULTADO PARA UMIDADE
	    MOVLW   .99			;MOVW 99 PARA W
	    CPFSGT  UMIDADE,W		;COMPARA 99 COM UMIDADE
	    GOTO    PULA_UMIDA		; SE MENOR PULE
	    MOVLW   .99			;SE MAIOR 99 PARA W
	    MOVWF   UMIDADE		;MOVER PRA UMIDADE

PULA_UMIDA	    
	    MOVF    LUMINOSIDADE_L,W	;MOVE VALOR DE LUMINOSIDADE PARA W
	    CALL    DIVISAO		;CHAMA DIVISAO
	    MOVWF   LUMINOSIDADE	;MOVE RESULTADO PARA LUMINOSIDADE
	    MOVLW   .99			;MOVE 99 PARA W
	    CPFSGT  LUMINOSIDADE,W	;COMPARA 99 COM LUMINOSIDADE
	    GOTO    PULA_LUMI		; SE MENOR PULE
	    MOVLW   .99			;SE MAIOR 99 PARA W
	    MOVWF   LUMINOSIDADE	;MOVER PRA LUMINOSIDADE
	    
	    
PULA_LUMI
	    MOVF    TEMPERATURA_L,W	;MOVE VALOR DE TEMEPRATURA PARA W
	    BSF	    TEMP_DIVI		;ACIONA A FLAG TEMP_DIVI 
					;PARA MUDAR O DIVISOR
	    CALL    DIVISAO		;CHAMA DIVISAO
	    MOVWF   TEMPERATURA		;MOVE RESULTADO PARA TEMPERATURA
	    MOVLW   .27			;MOVE 27 PARA W
	    SUBWF   TEMPERATURA,W	;SUBRITRAI 27 DE TEMPERATURA
	    BTFSS   STATUS,N		;RESULTADO FOI NEGATIVO
	    CALL    SOMA_02		;NÃO CHAMA SOMA_02
	    
	    CALL    TRATA_VALORES	;CHAMA TRATA VALORES
	    MOVLW   H'04'		;MOVE 4 PARA W
	    XORWF   SELECAO,0		;COMPARA O VALOR DA SELEÇÃO COM W
	    BTFSS   STATUS,Z		;TESTA SE A COMPARAÇÃO DEU 0
	    RETURN			;SE SIM VA PARA ...
	    BTFSS   ENTRA		;TESTA A FLAG ENTRA
	    RETURN			;RETORNA
	    CALL    SENSORES_ENTER	;CHAMA TELA DE LCD SENSORES_ENTER
	    RETURN			;RETORNA

SOMA_02	 
	    MOVLW   .1			;MOVE 1 PARA W
	    SUBWF   TEMPERATURA,F	;SUBTRAI 1 DE TEMPERATURA
	    RETURN			;RETORNA
	    
	    

	    
ESPERA_LEITURA
	    BTFSC   ADCON0,GO_DONE	;TESTA SE A CAPTURA DO VALOR JA FOI REALIZADA
	    GOTO    ESPERA_LEITURA	;LOPPING
	    RETURN			;VOLTA
;******************************************************************************
;			TRATA VALORES DOS SENSORES ANALOGICOS 
;******************************************************************************
DIVISAO	    
	    
	    CLRF    RESULTADO_DIVI	;LIMPA RESULTADO
	    MOVWF   VALOR		;MOVE W PARA VALOR
	    BTFSC   TEMP_DIVI		;TESTA A FLAG PRA MUDAR O DIVISOR
	    GOTO    TEMP_		;FLAG SETADA
UMI_
	    MOVLW   .2			;MOVE 2 PARA W
	    MOVWF   DIVI		;MOVE W PARA DIVI
	    GOTO    DIVI_01		;VA PARA DIVI_01
TEMP_
	    MOVLW   .4			;MOVE 4 PARA W
	    MOVWF   DIVI		;MOVE W PARA DIVI
DIVI_01
	    MOVF    DIVI,W		;MOVE DIVI PARA W
	    SUBWF   VALOR,F		;SUBTRAI DO VALOR E ARMAZENA NO MESMO
	    BTFSS   STATUS,C		;TESTA SE O BIT DE CARRY VIROU 1
	    GOTO    D_MENO		;SIM VAI PARA D_MENO
	    INCF    RESULTADO_DIVI,F	;INCREMENTA RESULTADO
	    GOTO    DIVI_01		;CHAMA DIV1_01 PARA CRIAR UM LOOP
D_MENO	
	    MOVF   RESULTADO_DIVI,W	;MOVE O RESULTADO DA OPERACAO PARA W
	    BCF	   TEMP_DIVI		;DESABILITA A FLAG 
	    RETURN			;RETORNA 
;******************************************************************************
;		TRANSFORMA VALORES BINARIO EM DEZENA E UNIDADE
;******************************************************************************

TRANFORMA_ASCII
	    
	    MOVWF   VALOR_B		;MOVE W PARA VALOR_B
	    MOVLW   .0			;MOVE 0 PARA W
	    XORWF   VALOR_B,W		;COMPARA W E VALOR_B
	    BTFSC   STATUS,Z		;É IGUAL A ZERO?
	    GOTO    MANDA_ZERO		;SIM VIA PARA...
		
	    BTFSC   STATUS,Z		;É IGUAL A ZERO?
	    GOTO    LIMPA		;SIM GOTO LIMPA
	    CLRF    UNIDADE		;LIMPA A VARIAVEL UNIDADE
	    CLRF    DEZENA		;LIMPA A VARIAVEL DEZENA
LOOP_UNI
	    INCF    UNIDADE		;INCREMENTA UNIDADE
	    DECF    VALOR_B		;DECREMTENRA VALOR_B
	    BTFSS   STATUS,Z		;É ZERO?
	    GOTO    TESTE_DEZENA	;NÃO VA PARA...
	    CALL    TESTE_DEZENA_FIM	;SIM VAI PARA...
	    GOTO    SOMA_30H		;VA PARA ...
TESTE_DEZENA
	    MOVLW   .10			;MOVE 10 PARA W
	    XORWF   UNIDADE,0		;COMPARA W COM UNIDADE
	    BTFSS   STATUS,Z		;SÃO IGUAIS?
	    GOTO    LOOP_UNI		
	    CLRF    UNIDADE
	    INCF    DEZENA
	    GOTO    LOOP_UNI
TESTE_DEZENA_FIM
	    MOVLW   .10
	    XORWF   UNIDADE,0
	    BTFSS   STATUS,Z
	    RETURN
	    CLRF    UNIDADE
	    INCF    DEZENA
	    RETURN
LIMPA
	    CLRF    UNIDADE
	    CLRF    DEZENA  
	    RETURN
SOMA_30H    
	    MOVLW  .48
	    ADDWF   UNIDADE,F
	    ADDWF   DEZENA,F
	    RETURN
MANDA_ZERO
	    MOVLW  .48
	    MOVWF   UNIDADE
	    MOVWF   DEZENA
	    RETURN
	    
	    
;*******************************************************************************
;			 TRATA VALROES DE SENSORES REAL VS IDEIAL 
;*******************************************************************************
TRATA_VALORES
VER_TEMPERATURA
	    BCF	    RESULT_MAIS	
	    BCF	    RESULT_MENO
	    MOVF    TEMP_IDEIAL_MAX,W	;Pega valores setados para comparação
	    MOVWF   MAX			;move para MAX
	    MOVF    TEMP_IDEIAL_MIN,W
	    MOVWF   MIN			;MOVE PARA MIM
	    MOVF    TEMPERATURA,W	;MOVE O VALOR LIDO NO SENSOR PARA W
	    CALL    VERIFICA_MAIS
	    BTFSC   RESULT_MAIS
	    BSF	    VENTI
	    MOVF    TEMPERATURA,W
	    CALL    VERIFICA_MENOS
	    BTFSC   RESULT_MENO
	    BCF	    VENTI
	    
VER_LUMINOSIDADE
	    BCF	    RESULT_MAIS	
	    BCF	    RESULT_MENO
	    MOVF    LUMI_IDEIAL_MAX,W	;Pega valores setados para comparação
	    MOVWF   MAX			;move para MAX
	    MOVF    LUMI_IDEIAL_MIN,W
	    MOVWF   MIN			;MOVE PARA MIM
	    MOVF    LUMINOSIDADE,W	;MOVE O VALOR LIDO NO SENSOR PARA W
	    CALL    VERIFICA_MAIS
	    BTFSC   RESULT_MAIS
	    CALL    DESLIGA_L
	    MOVF    LUMINOSIDADE,W
	    CALL    VERIFICA_MENOS
	    BTFSC   RESULT_MENO
	    CALL    LIGA_L

	    
VER_UMIDADE
	    BCF	    RESULT_MAIS	
	    BCF	    RESULT_MENO
	    MOVF    UMID_IDEIAL_MAX,W	;Pega valores setados para comparação
	    MOVWF   MAX			;move para MAX
	    MOVF    UMID_IDEIAL_MIN,W
	    MOVWF   MIN			;MOVE PARA MIM
	    MOVF    UMIDADE,W		;MOVE O VALOR LIDO NO SENSOR PARA W
	    CALL    VERIFICA_MAIS
	    CALL    DESLIGA_MOTOR
	    MOVF    UMIDADE,W
	    CALL    VERIFICA_MENOS
	    BTFSC   RESULT_MENO
	    CALL    LIGA_MOTOR
	    RETURN
LIGA_L 
	    BTFSC	LEDS
	    RETURN
	    CALL	AZUL
	    CALL	VERMELHO
	    CALL	AZUL
	    CALL	VERMELHO
	    CALL	AZUL
	    CALL	VERMELHO
	    CALL	AZUL
	    CALL	VERMELHO
	    BSF		LEDS
	    RETURN
DESLIGA_L
	    CALL	PRETO
	    CALL	PRETO
	    CALL	PRETO
	    CALL	PRETO
	    CALL	PRETO
	    CALL	PRETO
	    CALL	PRETO
	    CALL	PRETO
	    BCF		LEDS
	    RETURN
;*******************************************************************************
;			SETA AS FLAGS DE MAIS E MENOS
;*******************************************************************************
MAIOR_
	    BSF	    RESULT_MAIS		;SETA A FLAG, INDICANDO QUE O VALOR ESTA ALTO
	    RETURN
MENOR_
	    BSF	    RESULT_MENO	;SETA A FLAG, INDICANDO QUE O VALOR ESTA ALTO
	    RETURN
	    
	    
;*******************************************************************************
;			FAZ A COMPARAÇÃO ENTRE O VALORES
;*******************************************************************************	    
VERIFICA_MAIS
	    
	    SUBWF  MAX,0		;SUBRITAI O VALOR DE MAX DO W
	    BTFSC  STATUS,N		;SE W FOR MAIOR QUE MAX GOTO MAIOR,
					;CASO SEJA MENOR PULE
	    GOTO   MAIOR_		;VAI PARA SETAR A FLAG MAIOR 
	    MOVWF  RESULTADO		;MOVE O RESULTADO DA OPERAÇÃO ACIMA PARA RESULTADO

	    RETURN
VERIFICA_MENOS
	    SUBWF  MIN,0		;SUBRITAI O VALOR DE MAX DO W
	    BTFSS  STATUS,N		;SE W FOR MAIOR QUE MIN GOTO MENOR_,
					;CASO SEJA MAIOR PULE
	    GOTO   MENOR_		;VAI PARA SETAR A FLAG MAIOR 

	    RETURN
;******************************************************************************
;			TELA QUE SERA TRANMITIDA NO LCD
;******************************************************************************
		
TELA_LCD    
	    BTFSC   BOT_ALTO
	    RETURN  
	    BSF	    BOT_ALTO
	    
	    BTFSC   BAIXO		;TESTA A FLAG BAIXO
	    CALL    DEC_			;SE ATIVA VA PARA DECREMENTA
	    
	    BTFSC   CIMA		;TESTA A FLAG BAIXO
	    CALL    INC_			;SE ATIVA VA PARA INCREMENTA
	    
	    BTFSC   ENTER		;TESTA A FLAG BAIXO
	    CALL    SELECT_E		;SE ATIVA VA PARA SELECT
	    
	    BTFSC   MENU		;TESTA A FLAG BAIXO
	    CALL    SELECT_S		;SE ATIVA VA PARA SELECT
	    
	    MOVLW   H'00'		;MOVE 0 PARA W
	    XORWF   SELECAO,0		;COMPARA O VALOR DA SELEÇÃO COM W
	    BTFSC   STATUS,Z
	    GOTO    TELA_INICIO
	    
	    MOVLW   H'01'		;MOVE 1 PARA W
	    XORWF   SELECAO,0		;COMPARA O VALOR DA SELEÇÃO COM W
	    BTFSC   STATUS,Z		;TESTA SE A COMPARAÇÃO DEU 0
	    GOTO    PLANTA_S		;SE SIM VA PARA ...
	    
	    MOVLW   H'02'		;MOVE 2 PARA W
	    XORWF   SELECAO,0		;COMPARA O VALOR DA SELEÇÃO COM W
	    BTFSC   STATUS,Z		;TESTA SE A COMPARAÇÃO DEU 0
	    GOTO    SAIDA_S		;SE SIM VA PARA ...
	    
	    MOVLW   H'03'		;MOVE 3 PARA W
	    XORWF   SELECAO,0		;COMPARA O VALOR DA SELEÇÃO COM W
	    BTFSC   STATUS,Z		;TESTA SE A COMPARAÇÃO DEU 0
	    GOTO    ENTRADAS_S		;SE SIM VA PARA ...
	    
	    MOVLW   H'04'		;MOVE 4 PARA W
	    XORWF   SELECAO,0		;COMPARA O VALOR DA SELEÇÃO COM W
	    BTFSC   STATUS,Z		;TESTA SE A COMPARAÇÃO DEU 0
	    GOTO    SENSORES		;SE SIM VA PARA ...
	    
	    
	    MOVLW   H'05'		;MOVE 4 PARA W
	    XORWF   SELECAO,0		;COMPARA O VALOR DA SELEÇÃO COM W
	    BTFSC   STATUS,Z		;TESTA SE A COMPARAÇÃO DEU 0
	    GOTO    TELA_INICIO		;SE SIM VA PARA ...
CONTINUA_LCD	    
	  ;ROTINA PARA EVITAR QUE O VALOR DE SELEÇÃO FUJA DO ESPERADO  
	    MOVLW   H'FF'		;MOVE 255 PARA W
	    XORWF   SELECAO,0		;COMPARA O VALOR DA SELEÇÃO COM W
	    BTFSC   STATUS,Z		;TESTA SE A COMPARAÇÃO DEU 0
	    GOTO    R_SELECAO		;SE SIM VA PARA
	    
	    
	    MOVLW   H'FE'		;MOVE 255 PARA W
	    XORWF   SELECAO,0		;COMPARA O VALOR DA SELEÇÃO COM W
	    BTFSC   STATUS,Z		;TESTA SE A COMPARAÇÃO DEU 0
	    GOTO    R_SELECAO		;SE SIM VA PARA
	    
	    MOVLW   H'06'		;MOVE 255 PARA W
	    XORWF   SELECAO,0		;COMPARA O VALOR DA SELEÇÃO COM W
	    BTFSC   STATUS,Z		;TESTA SE A COMPARAÇÃO DEU 0
	    GOTO    TELA_INICIO		;SE SIM VA PARA

	    BCF	    BAIXO		;DESATIVA A FLAG
	    BCF	    CIMA		;DESATIVA A FLAG
	    BCF	    ENTER		;DESATIVA A FLAG
	    BCF	    MENU		;DESATIVA A FLAG
	    BSF	    BOT_ALTO
	    MOVF    SELECAO,W
	    RETURN
TELA_INICIO
	    MOVLW   H'00'		;MOVE 0 PARA W
	    MOVWF   SELECAO
	    CALL    LCDCLEAR		;LIMPA LCD
	    MOVLW   0X80		;MOVE 0X81 PARA W
	    CALL    LCDLOCATE		;CHAMA ROTINA DE POSIÇÃO DO LCD
	    CALL    LS			;ENVIA A LETRA PARA O LCD
	    CALL    LT			;ENVIA A LETRA PARA O LCD
	    CALL    LA			;ENVIA A LETRA PARA O LCD		
	    CALL    LT			
	    CALL    LU			
	    CALL    LS	
	    MOVLW   ":"
	    CALL    LCDSENDDATA
	    CALL    TESTES_ESTADO

	    
	 
	    MOVLW   0XC0		;MOVE 0XC3 PARA W
	    CALL    LCDLOCATE		;CHAMA ROTINA DE POSIÇÃO DO LCD
	    CALL    LC			;ENVIA A LETRA PARA O LCD
	    CALL    LO			;ENVIA A LETRA PARA O LCD
	    CALL    LL			;ENVIA A LETRA PARA O LCD
	    CALL    LH
	    CALL    LE
	    CALL    LI
	    CALL    LT
	    CALL    LA
	    CALL    ESPACO
	    CALL    LE
	    CALL    LM
	    MOVLW   ":"
	    CALL    LCDSENDDATA
	    MOVF    DIAS,W
	    CALL    TRANFORMA_ASCII
	    MOVF    DEZENA,W
	    CALL    LCDSENDDATA
	    MOVF    UNIDADE,W
	    CALL    LCDSENDDATA
	    BCF	   ENTRA_1		;LIMPA A FLAG ENTRA_1
	    BCF	   ENTRA 		;LIMPA A FLAG ENTRA
	    GOTO    CONTINUA_LCD			;RETORNA
TESTES_ESTADO
	    MOVLW   .0
	    CPFSEQ  DIAS,W
	    GOTO    ESTADO_2
	    CALL    LC			;ENVIA A LETRA PARA O LCD
	    CALL    LO			;ENVIA A LETRA PARA O LCD
	    CALL    LL			;ENVIA A LETRA PARA O LCD
	    CALL    LH
	    CALL    LE
	    CALL    LI
	    CALL    LT
	    CALL    LA
	    RETURN
ESTADO_2    
	    BTFSS   DESLIGA_M
	    GOTO    ESTADO_03
OK__
	    CALL    LO
	    CALL    LK
	    RETURN
ESTADO_03   
	    BTFSC   DESLIGA_M
	    GOTO    OK__
	    CALL    LR
	    CALL    LE
	    CALL    LG
	    CALL    LA
	    CALL    LN
	    CALL    LD
	    CALL    LO
	    RETURN
		     ;ROTINA PARA MOSTRAR O MENU DE SELECAO DE PLANTAS
PLANTA_S
	    BTFSC   ENTRA		;TESTA SE O BOTAO ENTER DOI PRESSIONADO
	    GOTO    PLANTA_S_ENTER	;SE SIM, VA PARA ...
	    CALL    LCDCLEAR		;LIMPA LCD 
	    MOVLW   0X80		;MOVE 0X80 PARA W
	    CALL    LCDLOCATE		;POSICIONA CURSOR NA PRIMEIRA LINHA PRIMERA COLUNA
	    CALL    LS			;ENVIA A LETRA 
	    CALL    LE
	    CALL    LL
	    CALL    LE
	    CALL    LC
	    CALL    LA
	    CALL    LO
	    CALL    ESPACO		;ENVIA ESPACO
	    CALL    LP
	    CALL    LL
	    CALL    LA	
	    CALL    LN
	    CALL    LT
	    CALL    LA
	    CALL    LS
	    MOVLW   0XC0	       ;MOVE 0XC0 PARA W
	    CALL    LCDLOCATE	       ;POSICIONA CURSOR NA SEGUNDA LINHA PRIMERA COLUNA
	    CALL    LP
	    CALL    LR
	    CALL    LE
	    CALL    LS
	    CALL    LS
	    CALL    LI
	    CALL    LO	
	    CALL    LN
	    CALL    LE
	    CALL    ESPACO
	    CALL    LE
	    CALL    LN	
	    CALL    LT
	    CALL    LE
	    CALL    LR
	    GOTO    CONTINUA_LCD			;RETURN

					 ;ROTINA DE QUANDO ENTRE É PRESSINADO 
PLANTA_S_ENTER
	    
	    CALL    LCDCLEAR		;LIMPA LCD
	    CALL    LD
	    CALL    LE
	    CALL    LS
	    CALL    LE
	    CALL    LJ
	    CALL    LA
	    CALL    ESPACO		
	    CALL    LP
	    CALL    LL
	    CALL    LA
	    CALL    LN
	    CALL    LT
	    CALL    LA
	    CALL    LR
	    MOVLW   ":"			;MOVE : PARA W
	    CALL    LCDSENDDATA		;ENVIA DADO PARA LCD
	    MOVLW   H'00'		;MOVE 0 PARA W
	    XORWF   SELECAO_E,0		;COMPARA O VALOR DA SELEÇÃO COM W
	    BTFSC   STATUS,Z		;TESTA SE A COMPARAÇÃO DEU 0
	    GOTO    ALFACE_LCD		;SE SIM VA PARA ...
	    
	    MOVLW   H'01'		;MOVE 1 PARA W
	    XORWF   SELECAO_E,0		;COMPARA O VALOR DA SELEÇÃO COM W
	    BTFSC   STATUS,Z		;TESTA SE A COMPARAÇÃO DEU 0
	    GOTO    CEBOLINHA_LCD		;SE SIM VA PARA ...
	    
	    MOVLW   H'02'		;MOVE 2 PARA W
	    XORWF   SELECAO_E,0		;COMPARA O VALOR DA SELEÇÃO COM W
	    BTFSC   STATUS,Z		;TESTA SE A COMPARAÇÃO DEU 0
	    GOTO    SALSINHA_LCD		;SE SIM VA PARA ...
	    
	    MOVLW   H'03'		;MOVE 3 PARA W
	    XORWF   SELECAO_E,0		;COMPARA O VALOR DA SELEÇÃO COM W
	    BTFSC   STATUS,Z		;TESTA SE A COMPARAÇÃO DEU 0
	    GOTO    ALFACE_LCD		;SE SIM VA PARA ...
	       
	    
	    MOVLW   H'FF'		;MOVE 255 PARA W
	    XORWF   SELECAO_E,0		;COMPARA O VALOR DA SELEÇÃO COM W
	    BTFSC   STATUS,Z		;TESTA SE A COMPARAÇÃO DEU 0
	    GOTO   SALSINHA_LCD	;SE SIM VA PARA
	    
	    
	    
TESTE_ENTRA_1
	    BTFSC   ENTRA_1		;TESTA SE O ENTER FOI PRESSINADO DUAS VEZES
	    GOTO    LIMPA_ENTRA		;SE SIM A SELEÇÃO JA TERMINOU
	    GOTO    CONTINUA_LCD
LIMPA_ENTRA
	    CALL   CURSOR_OFF
	    BCF	   ENTRA_3
	    BCF	   ENTRA_2
	    BCF	   ENTRA_1		;LIMPA A FLAG ENTRA_1
	    BCF	   ENTRA 		;LIMPA A FLAG ENTRA
	    MOVLW  .0			
	    MOVWF  SELECAO_E		;LIMPA O SELECAO_E
	    GOTO    TELA_INICIO
	    GOTO    CONTINUA_LCD			;RETORNA

				    
SAIDA_S					;LCD MENU PRINCIPAL SAIDAS
	    
	    BTFSC   ENTRA	   	;TESTA SE O ENTER FOI PRESSIONADO 
	    GOTO    SAIDAS_ENTER	;SE SIM VAI PARA...
	    CALL    LCDCLEAR		;LIMPA LCD
	    MOVLW   0X82		;MOVE 0X80 PARA W
	    CALL    LCDLOCATE		;POSICIONA O LCD NA PRIMEIRA LINHA PRIMEIRA COLUNA 	
	    CALL    LC
	    CALL    LO
	    CALL    LF
	    CALL    LI
	    CALL    LG
	    CALL    LU
	    CALL    LR
	    CALL    LA
	    CALL    LC
	    CALL    LO
	    CALL    LE
	    CALL    LS
	    MOVLW   0XC4
	    CALL    LCDLOCATE
	    CALL    LS
	    CALL    LA
	    CALL    LI    
	    CALL    LD
	    CALL    LA
	    CALL    LS
	    GOTO    CONTINUA_LCD
SAIDAS_ENTER

	    MOVLW   H'00'		;MOVE 0 PARA W
	    XORWF   SELECAO_E,0		;COMPARA O VALOR DA SELEÇÃO COM W
	    BTFSC   STATUS,Z		;TESTA SE A COMPARAÇÃO DEU 0
	    GOTO   S1			;SE SIM VA PARA ...
	    
	    MOVLW   H'01'		;MOVE 1 PARA W
	    XORWF   SELECAO_E,0		;COMPARA O VALOR DA SELEÇÃO COM W
	    BTFSC   STATUS,Z		;TESTA SE A COMPARAÇÃO DEU 0
	    GOTO    S2			;SE SIM VA PARA ...
	    
	    MOVLW   H'02'		;MOVE 2 PARA W
	    XORWF   SELECAO_E,0		;COMPARA O VALOR DA SELEÇÃO COM W
	    BTFSC   STATUS,Z		;TESTA SE A COMPARAÇÃO DEU 0
	    GOTO    S3			;SE SIM VA PARA ...
	    
	    MOVLW   H'03'		;MOVE 3 PARA W
	    XORWF   SELECAO_E,0		;COMPARA O VALOR DA SELEÇÃO COM W
	    BTFSC   STATUS,Z		;TESTA SE A COMPARAÇÃO DEU 0
	    GOTO    S1			;SE SIM VA PARA ...
	       
	    
	    MOVLW   H'FF'		;MOVE 255 PARA W
	    XORWF   SELECAO_E,0		;COMPARA O VALOR DA SELEÇÃO COM W
	    BTFSC   STATUS,Z		;TESTA SE A COMPARAÇÃO DEU 0
	    GOTO    S3			;SE SIM VA PARA
 
	  		    
S1
					;TELA DE CONFIGURAÇÃOD E SAIDAS
	    BTFSC	ENTRA_1
	    GOTO	S1_1
	    MOVLW	.0
	    MOVWF	SELECAO_E
	    CALL	LCDCLEAR
	    MOVLW	0X83
	    CALL	LCDLOCATE
	    CALL	LC
	    CALL	LO
	    CALL	LN
	    CALL	LF
	    CALL	LI
	    CALL	LG
	    CALL	LU
	    CALL	LR
	    CALL	LA
	    CALL	LC
	    CALL	LA
	    CALL	LO
	    CALL	ESPACO
	    CALL	LM
	    CALL	LO
	    CALL	LT
	    CALL	LO
	    CALL	LR
	    MOVLW	0XC0
	    CALL	LCDLOCATE
	    CALL	LS
	    CALL	LT
	    CALL	LA
	    CALL	LT
	    CALL	LU
	    CALL	LS
	    MOVLW	":"
	    CALL	LCDSENDDATA
	    BTFSS	TRAVA_MOTOR
	    CALL	HABILITADO
	    BTFSC	TRAVA_MOTOR
	    CALL	DESABILITADO
	    CALL    LCDSENDDATA
	    GOTO    CONTINUA_LCD
S1_1
	    BTFSC	ENTRA_2
	    GOTO	TESTE_ENTRA_1
	    BTFSC	CIMA
	    CALL	HABILITADO
	    BTFSC	BAIXO
	    CALL	DESABILITADO
	    MOVLW	0XC8
	    CALL	LCDLOCATE
	    GOTO	CONTINUA_LCD
HABILITADO
	    CALL    LCDCLEAR
	    MOVLW   0X83
	    CALL    LCDLOCATE
	    CALL    LC
	    CALL    LO
	    CALL    LN
	    CALL    LF
	    CALL    LI
	    CALL    LG
	    CALL    LU
	    CALL    LR
	    CALL    LA
	    CALL    LC
	    CALL    LA
	    CALL    LO
	    CALL    ESPACO
	    CALL    LM
	    CALL    LO
	    CALL    LT
	    CALL    LO
	    CALL    LR
	    MOVLW   0XC0
	    CALL    LCDLOCATE
	    CALL    LS
	    CALL    LT
	    CALL    LA
	    CALL    LT
	    CALL    LU
	    CALL    LS
	    MOVLW   ":"
	    CALL    LCDSENDDATA
	    CALL    LCDLOCATE
	    CALL    LA
	    CALL    LT
	    CALL    LI
	    CALL    LV
	    CALL    LO
	    BCF	    TRAVA_MOTOR
	    RETURN
	    
DESABILITADO
	    MOVLW   0XC7
	    CALL    LCDLOCATE
	    CALL    LD
	    CALL    LE
	    CALL    LS
	    CALL    LA
	    CALL    LT
	    CALL    LI
	    CALL    LV
	    CALL    LO
	    BSF	    TRAVA_MOTOR
	    RETURN
	    GOTO	CONTINUA_LCD

S2
	    GOTO    TESTE_ENTRA_1
S3
	    MOVLW   .3
	    MOVWF   SELECAO_E
	    GOTO    TESTE_ENTRA_1

			;ROTINA PARA MOSTRAR O MENU DE SELECAO DE ENTRADAS
ENTRADAS_S	     ;LCD MENU PRINCIPAL ENTRADAS
	    BTFSC   ENTRA	   	;TESTA SE O ENTER FOI PRESSIONADO 
	    GOTO    ENTRADAS_ENTER	;SE SIM VAI PARA...
	    CALL    LCDCLEAR		;LIMPA LCD
	    MOVLW   0X82		;MOVE 0X80 PARA W
	    CALL    LCDLOCATE		;POSICIONA O LCD NA PRIMEIRA LINHA PRIMEIRA COLUNA 	
	    CALL    LC
	    CALL    LO
	    CALL    LF
	    CALL    LI
	    CALL    LG
	    CALL    LU
	    CALL    LR
	    CALL    LA
	    CALL    LC
	    CALL    LO
	    CALL    LE
	    CALL    LS
	    MOVLW   0XC4
	    CALL    LCDLOCATE
	    CALL    LS
	    CALL    LE
	    CALL    LN    
	    CALL    LS
	    CALL    LO
	    CALL    LR
	    CALL    LE
	    CALL    LS
	    GOTO    CONTINUA_LCD
ENTRADAS_ENTER
	    
	    MOVLW   H'00'		;MOVE 0 PARA W
	    XORWF   SELECAO_E,0		;COMPARA O VALOR DA SELEÇÃO COM W
	    BTFSC   STATUS,Z
	    GOTO    TEMP_LCD
	    
	    MOVLW   H'01'		;MOVE 1 PARA W
	    XORWF   SELECAO_E,0		;COMPARA O VALOR DA SELEÇÃO COM W
	    BTFSC   STATUS,Z		;TESTA SE A COMPARAÇÃO DEU 0
	    GOTO    UMI_LCD		;SE SIM VA PARA ...
	    
	    MOVLW   H'02'		;MOVE 2 PARA W
	    XORWF   SELECAO_E,0		;COMPARA O VALOR DA SELEÇÃO COM W
	    BTFSC   STATUS,Z		;TESTA SE A COMPARAÇÃO DEU 0
	    GOTO    LUMI_LCD		;SE SIM VA PARA ...
	    
	    MOVLW   H'03'		;MOVE 3 PARA W
	    XORWF   SELECAO_E,0		;COMPARA O VALOR DA SELEÇÃO COM W
	    BTFSC   STATUS,Z		;TESTA SE A COMPARAÇÃO DEU 0
	    GOTO    TEMP_LCD		;SE SIM VA PARA ...
	       
	    
	    MOVLW   H'FF'		;MOVE 255 PARA W
	    XORWF   SELECAO_E,0		;COMPARA O VALOR DA SELEÇÃO COM W
	    BTFSC   STATUS,Z		;TESTA SE A COMPARAÇÃO DEU 0
	    GOTO    LUMI_LCD		;SE SIM VA PARA
TEMP_LCD
	    MOVLW   .0
	    MOVWF   SELECAO_E
	    BTFSC   ENTRA_1
	    GOTO    MUDA_TEMPMAX
	    CALL    LCDCLEAR
	    MOVLW   0X82
	    CALL    LCDLOCATE
	    BTFSC   ENTRA_1
	    GOTO    TESTE_ENTRA_1
	    CALL    LCDLOCATE		;POSICIONA O LCD NA PRIMEIRA LINHA PRIMEIRA COLUNA 	
	    CALL    LT
	    CALL    LE
	    CALL    LM
	    CALL    LP
	    CALL    LE
	    CALL    LR
	    CALL    LA
	    CALL    LT
	    CALL    LU
	    CALL    LR
	    CALL    LA
	    CALL    ESPACO
	    MOVLW   0XC1
	    CALL    LCDLOCATE
	    CALL    LM
	    CALL    LA
	    CALL    LX
	    MOVF    TEMP_IDEIAL_MAX,W
	    CALL    TRANFORMA_ASCII
	    MOVF    DEZENA,W
	    CALL    LCDSENDDATA
	    MOVF    UNIDADE,W
	    CALL    LCDSENDDATA
	    MOVLW   0XC9
	    CALL    LCDLOCATE
	    CALL    LM
	    CALL    LI
	    CALL    LN
	    MOVF    TEMP_IDEIAL_MIN,W
	    CALL    TRANFORMA_ASCII
	    MOVF    DEZENA,W
	    CALL    LCDSENDDATA
	    MOVF    UNIDADE,W
	    CALL    LCDSENDDATA
	    GOTO    TESTE_ENTRA_1
MUDA_TEMPMAX
	    BTFSC   ENTRA_2
	    GOTO    MUDA_TEMPMIN
	    CALL    CURSOR_ON
	    BTFSC   CIMA
	    INCF    TEMP_IDEIAL_MAX,F
	    BTFSC   BAIXO
	    DECF    TEMP_IDEIAL_MAX,F
	    MOVLW   0XC4
	    CALL    LCDLOCATE
	    MOVF    TEMP_IDEIAL_MAX,W
	    CALL    TRANFORMA_ASCII
	    MOVF    DEZENA,W
	    CALL    LCDSENDDATA
	    MOVF    UNIDADE,W
	    CALL    LCDSENDDATA
	    MOVLW   0XC5
	    CALL    LCDLOCATE
	    CALL    CURSOR_ON
	    GOTO    CONTINUA_LCD
	    
	    
	    
	    
MUDA_TEMPMIN	   
	    BTFSC   ENTRA_3
	    GOTO    TESTE_ENTRA_1
	    CALL    CURSOR_ON
	    BTFSC   CIMA
	    INCF    TEMP_IDEIAL_MIN,F
	    BTFSC   BAIXO
	    DECF    TEMP_IDEIAL_MIN,F
	    MOVLW   0XCC
	    CALL    LCDLOCATE
	    MOVF    TEMP_IDEIAL_MIN,W
	    CALL    TRANFORMA_ASCII
	    MOVF    DEZENA,W
	    CALL    LCDSENDDATA
	    MOVF    UNIDADE,W
	    CALL    LCDSENDDATA
	    MOVLW   0XCD
	    CALL    LCDLOCATE
	    CALL    CURSOR_ON
	    GOTO    CONTINUA_LCD
	    
	    
	    GOTO    TESTE_ENTRA_1
UMI_LCD	 
	    
	    BTFSC   ENTRA_1
	    GOTO    MUDA_UMIMAX
	    CALL    LCDCLEAR
	    MOVLW   0X83
	    CALL    LCDLOCATE
	    BTFSC   ENTRA_1
	    GOTO    TESTE_ENTRA_1
	    CALL    LCDLOCATE		;POSICIONA O LCD NA PRIMEIRA LINHA PRIMEIRA COLUNA 	
	    CALL    LU
	    CALL    LM
	    CALL    LI
	    CALL    LD
	    CALL    LA
	    CALL    LD
	    CALL    LE
	    CALL    ESPACO
	    MOVLW   0XC1
	    CALL    LCDLOCATE
	    CALL    LM
	    CALL    LA
	    CALL    LX
	    MOVF    UMID_IDEIAL_MAX,W
	    CALL    TRANFORMA_ASCII
	    MOVF    DEZENA,W
	    CALL    LCDSENDDATA
	    MOVF    UNIDADE,W
	    CALL    LCDSENDDATA
	    MOVLW   0XC9
	    CALL    LCDLOCATE
	    CALL    LM
	    CALL    LI
	    CALL    LN
	    MOVF    UMID_IDEIAL_MIN,W
	    CALL    TRANFORMA_ASCII
	    MOVF    DEZENA,W
	    CALL    LCDSENDDATA
	    MOVF    UNIDADE,W
	    CALL    LCDSENDDATA
	    GOTO    TESTE_ENTRA_1
MUDA_UMIMAX
	    BTFSC   ENTRA_2
	    GOTO    MUDA_UMIMIN
	    CALL    CURSOR_ON
	    BTFSC   CIMA
	    INCF    UMID_IDEIAL_MAX,F
	    BTFSC   BAIXO
	    DECF    UMID_IDEIAL_MAX,F
	    MOVLW   0XC4
	    CALL    LCDLOCATE
	    MOVF    UMID_IDEIAL_MAX,W
	    CALL    TRANFORMA_ASCII
	    MOVF    DEZENA,W
	    CALL    LCDSENDDATA
	    MOVF    UNIDADE,W
	    CALL    LCDSENDDATA
	    MOVLW   0XC5
	    CALL    LCDLOCATE
	    CALL    CURSOR_ON
	    GOTO    CONTINUA_LCD
	    
	    
	    
	    
MUDA_UMIMIN	   
	    BTFSC   ENTRA_3
	    GOTO    TESTE_ENTRA_1
	    CALL    CURSOR_ON
	    BTFSC   CIMA
	    INCF    UMID_IDEIAL_MIN,F
	    BTFSC   BAIXO
	    DECF    UMID_IDEIAL_MIN,F
	    MOVLW   0XCC
	    CALL    LCDLOCATE
	    MOVF    UMID_IDEIAL_MIN,W
	    CALL    TRANFORMA_ASCII
	    MOVF    DEZENA,W
	    CALL    LCDSENDDATA
	    MOVF    UNIDADE,W
	    CALL    LCDSENDDATA
	    MOVLW   0XCD
	    CALL    LCDLOCATE
	    CALL    CURSOR_ON
	    GOTO    CONTINUA_LCD
	    
LUMI_LCD
	    MOVLW   .2
	    MOVWF   SELECAO_E
	    BTFSC   ENTRA_1
	    GOTO    MUDA_LUMIMAX
	    CALL    LCDCLEAR
	    MOVLW   0X82
	    CALL    LCDLOCATE
	    BTFSC   ENTRA_1
	    GOTO    TESTE_ENTRA_1
	    CALL    LCDLOCATE		;POSICIONA O LCD NA PRIMEIRA LINHA PRIMEIRA COLUNA 	
	    CALL    LL
	    CALL    LU
	    CALL    LM
	    CALL    LI
	    CALL    LN
	    CALL    LO
	    CALL    LS
	    CALL    LI
	    CALL    LD
	    CALL    LA
	    CALL    LD
	    CALL    LE
	    CALL    ESPACO
	    MOVLW   0XC1
	    CALL    LCDLOCATE
	    CALL    LM
	    CALL    LA
	    CALL    LX
	    MOVF    LUMI_IDEIAL_MAX,W
	    CALL    TRANFORMA_ASCII
	    MOVF    DEZENA,W
	    CALL    LCDSENDDATA
	    MOVF    UNIDADE,W
	    CALL    LCDSENDDATA
	    MOVLW   0XC9
	    CALL    LCDLOCATE
	    CALL    LM
	    CALL    LI
	    CALL    LN
	    MOVF    LUMI_IDEIAL_MIN,W
	    CALL    TRANFORMA_ASCII
	    MOVF    DEZENA,W
	    CALL    LCDSENDDATA
	    MOVF    UNIDADE,W
	    CALL    LCDSENDDATA
	    GOTO    TESTE_ENTRA_1
MUDA_LUMIMAX
	    BTFSC   ENTRA_2
	    GOTO    MUDA_LUMIMIN
	    CALL    CURSOR_ON
	    BTFSC   CIMA
	    INCF    LUMI_IDEIAL_MAX,F
	    BTFSC   BAIXO
	    DECF    LUMI_IDEIAL_MAX,F
	    MOVLW   0XC4
	    CALL    LCDLOCATE
	    MOVF    LUMI_IDEIAL_MAX,W
	    CALL    TRANFORMA_ASCII
	    MOVF    DEZENA,W
	    CALL    LCDSENDDATA
	    MOVF    UNIDADE,W
	    CALL    LCDSENDDATA
	    MOVLW   0XC5
	    CALL    LCDLOCATE
	    CALL    CURSOR_ON
	    GOTO    CONTINUA_LCD
	    
	    
	    
	    
MUDA_LUMIMIN	   
	    BTFSC   ENTRA_3
	    GOTO    TESTE_ENTRA_1
	    CALL    CURSOR_ON
	    BTFSC   CIMA
	    INCF    LUMI_IDEIAL_MIN,F
	    BTFSC   BAIXO
	    DECF    LUMI_IDEIAL_MIN,F
	    MOVLW   0XCC
	    CALL    LCDLOCATE
	    MOVF    LUMI_IDEIAL_MIN,W
	    CALL    TRANFORMA_ASCII
	    MOVF    DEZENA,W
	    CALL    LCDSENDDATA
	    MOVF    UNIDADE,W
	    CALL    LCDSENDDATA
	    MOVLW   0XCD
	    CALL    LCDLOCATE
	    CALL    CURSOR_ON
	    GOTO    CONTINUA_LCD
SENSORES				;LCD MENU PRINCIPAL SENSORES
	    BTFSC   ENTRA	   	;TESTA SE O ENTER FOI PRESSIONADO 
	    GOTO    SENSORES_ENTER	;SE SIM VAI PARA...
	    CALL    LCDCLEAR		;LIMPA LCD
	    MOVLW   0X83		;MOVE 0X80 PARA W
	    CALL    LCDLOCATE		;POSICIONA O LCD NA PRIMEIRA LINHA PRIMEIRA COLUNA
	    CALL    LM
	    CALL    LE
	    CALL    LD
	    CALL    LI
	    CALL    LC
	    CALL    LO
	    CALL    LE
	    CALL    LS
	    MOVLW   0XC3		;MOVE 0X80 PARA W
	    CALL    LCDLOCATE		;POSICIONA O LCD NA PRIMEIRA LINHA PRIMEIRA COLUNA
	    CALL    LS
	    CALL    LE
	    CALL    LN
	    CALL    LS
	    CALL    LO
	    CALL    LR
	    CALL    LE
	    CALL    LS
	    GOTO    CONTINUA_LCD
SENSORES_ENTER
	    MOVLW   H'00'		;MOVE 0 PARA W
	    XORWF   SELECAO_E,0		;COMPARA O VALOR DA SELEÇÃO COM W
	    BTFSC   STATUS,Z
	    CALL    TEMPERATURA_LCD
	    
	    MOVLW   H'01'		;MOVE 1 PARA W
	    XORWF   SELECAO_E,0		;COMPARA O VALOR DA SELEÇÃO COM W
	    BTFSC   STATUS,Z		;TESTA SE A COMPARAÇÃO DEU 0
	    CALL    UMIDADE_LCD		;SE SIM VA PARA ...
	    
	    MOVLW   H'02'		;MOVE 2 PARA W
	    XORWF   SELECAO_E,0		;COMPARA O VALOR DA SELEÇÃO COM W
	    BTFSC   STATUS,Z		;TESTA SE A COMPARAÇÃO DEU 0
	    CALL    LUMINOSIDADE_LCD		;SE SIM VA PARA ...
	    
	    MOVLW   H'03'		;MOVE 3 PARA W
	    XORWF   SELECAO_E,0		;COMPARA O VALOR DA SELEÇÃO COM W
	    BTFSC   STATUS,Z		;TESTA SE A COMPARAÇÃO DEU 0
	    CALL    TEMPERATURA_LCD		;SE SIM VA PARA ...
	       
	    
	    MOVLW   H'FF'		;MOVE 255 PARA W
	    XORWF   SELECAO_E,0		;COMPARA O VALOR DA SELEÇÃO COM W
	    BTFSC   STATUS,Z		;TESTA SE A COMPARAÇÃO DEU 0
	    CALL    LUMINOSIDADE_LCD		;SE SIM VA PARA
 
	    BTFSC   ENTRA_1
	    GOTO    LIMPA_ENTRA
	    GOTO    CONTINUA_LCD
	    
TEMPERATURA_LCD 
	    
	    MOVLW   .0
	    MOVWF   SELECAO_E
	    CALL    LCDCLEAR
	    MOVLW   0X81		;MOVE 0X81 PARA W
	    CALL    LCDLOCATE		;POSICIONA O LCD NA PRIMEIRA LINHA PRIMEIRA COLUNA
	    CALL    LT
	    CALL    LE
	    CALL    LM 
	    CALL    LP
	    CALL    LE
	    CALL    LR
	    CALL    LA
	    CALL    LT
	    CALL    LU
	    CALL    LR
	    CALL    LA
	    MOVLW   ":" 
	    
	    CALL    LCDSENDDATA
	    MOVF    TEMPERATURA,W
	    CALL    TRANFORMA_ASCII
	    MOVF    DEZENA,W
	    CALL    LCDSENDDATA
	    MOVF    UNIDADE,W
	    CALL    LCDSENDDATA
	    MOVLW   "C"
	    CALL    LCDSENDDATA
	    GOTO    TESTE_ENTRA_1
UMIDADE_LCD
	    
	    MOVLW   .1
	    MOVWF   SELECAO_E
	    CALL    LCDCLEAR
	    MOVLW   0X81		;MOVE 0X81 PARA W
	    CALL    LCDLOCATE		;POSICIONA O LCD NA PRIMEIRA LINHA PRIMEIRA COLUNA
	    CALL    LU
	    CALL    LM
	    CALL    LI 
	    CALL    LD
	    CALL    LA
	    CALL    LD
	    CALL    LE
	    MOVLW   ":" 
	    CALL    LCDSENDDATA
	    MOVLW   0XC0		;MOVE 0X81 PARA W
	    CALL    LCDLOCATE		;POSICIONA O LCD NA PRIMEIRA LINHA PRIMEIRA COLUNA
	    MOVF    UMIDADE,W		;MOVE UMIDADE PARA W
	    CALL    TRANFORMA_ASCII	;TRANFORMA O VALOR DE UMIDADE PRA ASCII
	    MOVF    DEZENA,W		;CARREGA W COM VALOR DE DEZENA
	    CALL    LCDSENDDATA		;ENVIA W PARA O LCD
	    MOVF    UNIDADE,W		;CARREGA W COM VALOR DE UNIDADE
	    CALL    LCDSENDDATA		;ENVIA W PARA O LCD
	    MOVLW   "%"			;CARREGA W COM %
	    CALL    LCDSENDDATA		;ENVIA W PARA O LCD
	    GOTO    TESTE_ENTRA_1	; VA PARA 
LUMINOSIDADE_LCD
	    
	    MOVLW   .2
	    MOVWF   SELECAO_E
	    CALL    LCDCLEAR
	    MOVLW   0X81		;MOVE 0X81 PARA W
	    CALL    LCDLOCATE		;POSICIONA O LCD NA PRIMEIRA LINHA PRIMEIRA COLUNA
	    CALL    LL
	    CALL    LU
	    CALL    LM 
	    CALL    LI
	    CALL    LN
	    CALL    LO
	    CALL    LS
	    CALL    LI
	    CALL    LD
	    CALL    LA
	    CALL    LD
	    CALL    LE
	    MOVLW   ":" 
	    CALL    LCDSENDDATA
	    MOVF    LUMINOSIDADE,W
	    CALL    TRANFORMA_ASCII
	    MOVF    DEZENA,W		;CARREGA W COM VALOR DE DEZENA
	    CALL    LCDSENDDATA		;ENVIA W PARA O LCD
	    MOVF    UNIDADE,W		;CARREGA W COM VALOR DE UNIDADE
	    CALL    LCDSENDDATA		;ENVIA W PARA O LCD
	    MOVLW   "%"
	    CALL    LCDSENDDATA
	    GOTO    TESTE_ENTRA_1
ALFACE_LCD		    ;LCD MENU AUXILIAR DA SELEÇÃO PLANTAÇÃO
	    MOVLW   0XC0
	    CALL    LCDLOCATE
	    CALL    LA
	    CALL    LL
	    CALL    LF
	    CALL    LA
	    CALL    LC
	    CALL    LE
	    MOVLW   .0
	    MOVWF   SELECAO_E
	    BTFSC    ENTRA_1
	    CALL     ALFACE
	    GOTO    TESTE_ENTRA_1
CEBOLINHA_LCD		    ;LCD MENU AUXILIAR DA SELEÇÃO PLANTAÇÃO
	    MOVLW   0XC0
	    CALL    LCDLOCATE
	    CALL    LC
	    CALL    LE
	    CALL    LB
	    CALL    LO
	    CALL    LL
	    CALL    LI
	    CALL    LN
	    CALL    LH
	    CALL    LA
	    BTFSC    ENTRA_1
	    CALL     CEBOLINHA
	    GOTO    TESTE_ENTRA_1
SALSINHA_LCD		    ;LCD MENU AUXILIAR DA SELEÇÃO PLANTAÇÃO
	    MOVLW   .2
	    MOVWF   SELECAO_E	    ;ROTINA PARA MOSTRAR O MENU DE SELECAO DE SAIDAS
	    MOVLW   0XC0
	    CALL    LCDLOCATE
	    CALL    LS
	    CALL    LA
	    CALL    LL
	    CALL    LS
	    CALL    LI
	    CALL    LN
	    CALL    LH
	    CALL    LA
	    BTFSC   ENTRA_1
	    CALL    SALSINHA
	    GOTO    TESTE_ENTRA_1
	    ;ROTINA PARA INCREMENTAR A VARIAVEL SELECAO
INC_		
	    BTFSC   ENTRA_1		    ;TESTE SE A FLAG ESTA ACIONADA
	    GOTO    INC_ENTRA_1		    ;VA PARA
	    BTFSC   ENTRA		    ;TESTE SE A FLAG ESTA ACIONADA
	    GOTO    INC_ENTRA		    ; VA PARA 
	    INCF    SELECAO
	    RETURN
	    ;ROTINA PARA DECREMENTAR A VARIAVEL SELECAO
DEC_	    
	    BTFSC   ENTRA_1		   ;TESTE SE A FLAG ESTA ACIONADA
	    GOTO    DEC_ENTRA_1		    ;VA PARA 
	    BTFSC   ENTRA		   ;TESTE SE A FLAG ESTA ACIONADA
	    GOTO    DEC_ENTRA		    ;VA PARA 
	    DECF    SELECAO		   ;DECREMENTA SELECAO 
	    RETURN
	    
INC_ENTRA
	    INCF    SELECAO_E
	    RETURN
	    
DEC_ENTRA
	    DECF    SELECAO_E
	    RETURN
INC_ENTRA_1
	    RETURN
DEC_ENTRA_1
	    RETURN
	    ;ROTINA PARA ALTERAR INFORMAÇOES NOS MENUS
SELECT_E
	    BTFSC   ENTRA_2		;TESTE SE A FLAG ESTA ACIONADA
	    BSF	    ENTRA_3
	    BTFSC   ENTRA_1		;TESTE SE A FLAG ESTA ACIONADA
	    BSF     ENTRA_2
	    BTFSC   ENTRA		;TESTE SE A FLAG ESTA ACIONADA
	    BSF	    ENTRA_1
	    BSF	    ENTRA
	
	    RETURN
SELECT_S
	    BCF	    ENTRA
	    BCF	    ENTRA_2
	    BCF	    ENTRA_3
	    BCF	    ENTRA_1
	    CALL    CURSOR_OFF
	    RETURN
	    ;ROTINA PARA NÃO DEIXAR O VALOR DE SELECAO SAIR DO ESPERADO
R_SELECAO
	    MOVLW   H'04'	    ;MOVE   4 PARA W
	    MOVWF   SELECAO	    ;MOVE PRA A VARIAVEL SELECAO
	    GOTO    SENSORES	    ;VA PARA SENSORES
	    RETURN		    ;RETORNA
	    
	    
	    
	    
	    
	    
	    
	    
;******************************************************************************
;		    ROTINAS PRONTAS  DOS LIVRO	    
;******************************************************************************
	    
	    
;******************************************************************************
; SUBROTINAS PARA ESCRITA EM LCD 16X2, COMUNICACAO A 4 BITS
; COMANDOS USADOS
; CALL	INICIALIZA_LCD	;INICIALIZACAO DO LCD
;******************************************************************************
INICIALIZA_LCD
	    MOVLW	.50
	    CALL    DELAY_MS
;******************************************************************************
; SEQUENCIA DE RESET 
;******************************************************************************
	    BCF     LCD_RS    ;ENTRA NO MODO DE COMANDO
;ENVIA A SEQUENCIA DE RESET AO LCD
	    BSF     LCD_DB4
	    BSF     LCD_DB5
	    BCF     LCD_DB6
	    BCF     LCD_DB7
	    BSF     LCD_E     ;ENABLES LCD
	    MOVLW   5         ;WAIT 5 MS
	    CALL    DELAY_MS
	    BCF     LCD_E     ;DISABLES LCD
	    MOVLW   1         ;WAIT 1MS
	    CALL    DELAY_MS
	    BSF     LCD_E     ;ENABLES LCD
	    MOVLW   1         ;WAIT 1MS
	    CALL    DELAY_MS
	    BCF     LCD_E     ;DISABLES LCD
	    MOVLW   1         ;WAIT 1MS
	    CALL    DELAY_MS
	    BSF     LCD_E     ;ENABLES E
	    MOVLW   1         ;WAIT 1MS
	    CALL    DELAY_MS
	    BCF     LCD_E     ;DISABLES E
	    MOVLW   1         ;WAIT 1MS
	    CALL    DELAY_MS
	    BCF     LCD_DB4
	    BSF     LCD_DB5
	    BCF     LCD_DB6
	    BCF     LCD_DB7
	    BSF     LCD_E     ;ENABLES LCD
	    MOVLW   1         ;WAIT 1MS
	    CALL    DELAY_MS
	    BCF     LCD_E     ;DISABLED LCD
	    MOVLW   1         ;WAIT 1MS
	    CALL    DELAY_MS
;******************************************************************************
;CONFIGURA PARA COMUNICAÇÃO DE 4 BITS
;******************************************************************************
	    MOVLW   28H
	    CALL    LCDSENDCOMMAND

; ESCOLHER UM MODO MARA INICIALIZAÇÃO PADRAO
	
	    CALL	LCD_CURSOR_DIR
	    CALL	CURSOR_OFF
	    RETURN
	
;******************************************************************************
;CONFIGURACOES DO LCD
;******************************************************************************	
LCD_ON		
	    MOVLW   0CH;
	    CALL    LCDSENDCOMMAND
	    RETURN
LCD_OFF		
	    MOVLW   08H;
	    CALL    LCDSENDCOMMAND
	    RETURN
	
;******************************************************************************
;CONFIGURACOES DO CURSOR
;******************************************************************************	

;******************************************************************************	
; SENTIDO DE DESLOCAMENTO DO CURSOR COM A ENTRADA DE UM NOVO CARACTER
;******************************************************************************
; AO ENTRAR NOVO CARACTER DESLOCA CURSOR A DIREIRA
LCD_CURSOR_DIR		
	    MOVLW   06H;
	    CALL    LCDSENDCOMMAND
	    RETURN
; AO ENTRAR NOVO CARACTER DESLOCA CURSOR A ESQUERDA
LCD_CURSOR_ESQ		
	    MOVLW   04H;
	    CALL    LCDSENDCOMMAND
	    RETURN
	
;******************************************************************************	
; SENTIDO DE DESLOCAMENTO DO TEXTO COM A ENTRADA DE UM NOVO CARACTER
;******************************************************************************
; AO ENTRAR NOVO CARACTER DESLOCA O TEXTO A DIREIRA
LCD_TEXTO_DIR		
	    MOVLW   05H;
	    CALL    LCDSENDCOMMAND
	    RETURN
; AO ENTRAR NOVO CARACTER DESLOCA O TEXTO A ESQUERDA
LCD_TEXTO_ESQ		
	    MOVLW   07H;
	    CALL    LCDSENDCOMMAND
	    RETURN
;******************************************************************************	
; SENTIDO DE DESLOCAMENTO DO TEXTO SEM A ENTRADA DE UM NOVO CARACTER
;******************************************************************************
; DESLOCA O TEXTO A DIREIRA
TEXTO_DIR		
	    MOVLW   1CH;
	    CALL    LCDSENDCOMMAND
	    RETURN
; DESLOCA O TEXTO A ESQUERDA
TEXTO_ESQ		
	    MOVLW   18H;
	    CALL    LCDSENDCOMMAND
	    RETURN
;******************************************************************************	
; CONTROLE DO CURSOR 
;******************************************************************************

CURSOR_OFF
	    ;DISPLAY ON, CURSON OFF, BLINK OFF   
	    MOVLW   0CH	
	    CALL    LCDSENDCOMMAND
	    RETURN
CURSOR_ON
	    ;DISPLAY ON, CURSON ON, BLINK OFF   
	    MOVLW   0EH	
	    CALL    LCDSENDCOMMAND
	    RETURN
CURSOR_BLINK
	    ;DISPLAY ON, CURSON OFF, BLINK ON   
	    MOVLW   0DH	
	    CALL    LCDSENDCOMMAND
	    RETURN
CURSOR_ALTERNADO
	    ;DISPLAY ON, CURSON ON, BLINK ON   
	    MOVLW   0FH	
	    CALL    LCDSENDCOMMAND
	    RETURN
CURSOR_DIR
	;DESLOCA O CURSOR A DIREITA   
	    MOVLW   14H	
	    CALL    LCDSENDCOMMAND
	    RETURN
CURSOR_ESQ
	;DESLOCA O CURSOR A ESQUERDA   
        MOVLW   10H	
        CALL    LCDSENDCOMMAND
	RETURN
CURSOR_HOME
	;DESLOCA PARA A LINHA 1 COLUNA 1   
	    MOVLW   02H	
	    CALL    LCDSENDCOMMAND
	    RETURN

;**********************************************************************
; CLEAR LCD
;**********************************************************************

LCDCLEAR
	    MOVLW   01H
	    CALL    LCDSENDCOMMAND
	    MOVLW   2               ;WAIT 2 MS
	    CALL    DELAY_MS

	    ;DD RAM ADDRESS SET 1ST DIGIT

	    MOVLW   80H;
	    CALL    LCDSENDCOMMAND
	    RETURN

;******************************************************************************
; POSICIONAR CURSOR ON LCD
; W = D7-D4 LINHA, D3-D0 COLUNA
;******************************************************************************
;Tabela com os 32 caracteres do display 16x2 e seus endereços em hexadecimal
;
;Coluna   0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 
;Linha 0 80 81 82 83 84 85 86 87 88 89 8A 8B 8C 8D 8E 8F 
;Linha 1 C0 C1 C2 C3 C4 C5 C6 C7 C8 C9 CA CB CC CD CE CF 
;
;Tabela com os 80 caracteres do display 20x4 e seus endereços em hexadecimal
;
;Coluna   0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19
;Linha 0 80 81 82 83 84 85 86 87 88 89 8A 8B 8C 8D 8E 8F 90 91 92 93
;Linha 1 C0 C1 C2 C3 C4 C5 C6 C7 C8 C9 CA CB CC CD CE CF D0 D1 D2 D3
;Linha 2 94 95 96 97 98 99 9A 9B 9C 9D 9E 9F A0 A1 A2 A3 A4 A5 A6 A7
;Linha 3 D4 D5 D6 D7 D8 D9 DA DB DC DD DE DF E0 E1 E2 E3 E4 E5 E6 E7
;
; EXEMPLO 2 LINHA 4 COLUMA C4
;MOVLW	0XC4		;MOVE O VALOR HEXADECIMAL C4 PARA WORK
;CALL	LCDLOCATE	;SALTA PARA SUBROTINA DE POSICIONAMENTO DO CURSOR 
;NA SEGUNDA LINHA E QUARTA COLUNA
;**********************************************************************

LCDLOCATE
                CALL    LCDSENDCOMMAND
                RETURN

;**********************************************************************
;ENVIA DADO PARA O LCD
;**********************************************************************

LCDSENDDATA
                BSF     LCD_RS
                CALL    LCDSENDBYTE
                RETURN

;**********************************************************************
;			ENVIA COMANDO PARA O LCD
;**********************************************************************

LCDSENDCOMMAND
                BCF     LCD_RS
                CALL    LCDSENDBYTE
                RETURN

;**********************************************************************
;		ENVIA BYTE ATRAVES DE BARRAMENTO DE 4 VIAS
;**********************************************************************

LCDSENDBYTE
                ;SAVE VALUE TO SEND

	    MOVWF   TMPLCDREGISTER       ;SEND HIGHTER FOUR BITS
	    BCF     LCD_DB4
	    BCF     LCD_DB5
	    BCF     LCD_DB6
	    BCF     LCD_DB7
	    BTFSC   TMPLCDREGISTER,4
	    BSF     LCD_DB4
	    BTFSC   TMPLCDREGISTER,5
	    BSF     LCD_DB5
	    BTFSC   TMPLCDREGISTER,6
	    BSF     LCD_DB6
	    BTFSC   TMPLCDREGISTER,7
	    BSF     LCD_DB7
	    BSF     LCD_E     ;ENABLES LCD
	    MOVLW   1               ;WAIT 1MS
	    CALL    DELAY_MS
	    BCF     LCD_E     ;DISABLED LCD
	    MOVLW   1               ;WAIT 1MS
	    CALL    DELAY_MS

	    ;SEND LOWER FOUR BITS

	    BCF     LCD_DB4
	    BCF     LCD_DB5
	    BCF     LCD_DB6
	    BCF     LCD_DB7
	    BTFSC   TMPLCDREGISTER,0
	    BSF     LCD_DB4
	    BTFSC   TMPLCDREGISTER,1
	    BSF     LCD_DB5
	    BTFSC   TMPLCDREGISTER,2
	    BSF     LCD_DB6
	    BTFSC   TMPLCDREGISTER,3
	    BSF     LCD_DB7
	    BSF     LCD_E			    ;ENABLES LCD
	    MOVLW   1			    ;WAIT 1MS
	    CALL    DELAY_MS
	    BCF     LCD_E			    ;DISABLED LCD
	    MOVLW   1			;WAIT 1MS
	    CALL    DELAY_MS
	    RETURN
                

;*******************************************************************************
;			    ALFABETO
;*******************************************************************************
LA	
	    MOVLW	'A'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
LB	
	    MOVLW	'B'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
LC	
	    MOVLW	'C'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
LD	
	    MOVLW	'D'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
LE	
	    MOVLW	'E'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
LF	
	    MOVLW	'F'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
LG	
	    MOVLW	'G'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
LH	
	    MOVLW	'H'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
LI	
	    MOVLW	'I'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
LJ	
	    MOVLW	'J'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
	
LK
	    MOVLW	'K'
	    CALL	LCDSENDDATA
	    RETURN
LL	
	    MOVLW	'L'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
LM	
	    MOVLW	'M'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
LN	
	    MOVLW	'N'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
LO	
	    MOVLW	'O'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
LP	
	    MOVLW	'P'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
LQ	
	    MOVLW	'Q'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
LR	
	    MOVLW	'R'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
LS	
	    MOVLW	'S'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
LT	
	    MOVLW	'T'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
LU	
	    MOVLW	'U'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
LV	
	    MOVLW	'V'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
LW	
	    MOVLW	'W'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
LY	
	    MOVLW	'Y'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
LX	
	    MOVLW	'X'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
LZ	
	    MOVLW	'Z'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
L0	
	    MOVLW	'0'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
L1	
	    MOVLW	'1'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
L2	
	    MOVLW	'2'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
L3	
	    MOVLW	'3'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
L4	
	    MOVLW	'4'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
L5	
	    MOVLW	'5'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
L6	
	    MOVLW	'6'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
L7	
	    MOVLW	'7'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
L8	
	    MOVLW	'8'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
L9	
	    MOVLW	'9'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN

ESPACO	
	    MOVLW	' '			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
PONTO	
	    MOVLW	'.'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN	
MAIS	
	    MOVLW	'+'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
MENOS	
	    MOVLW	'-'			;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA		;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    RETURN
	
;*******************************************************************************
;	    ROTINA QUE LIGA TODOS OS CARACTERES POR 3 SEGUNDOS
;*******************************************************************************
TESTA_LCD
	    MOVLW	.20		;VALOR REFERENTE A N° DE COLUNAS
	    MOVWF	TESTE_LINHA
	    MOVLW	H'80'		;MOVE O VALOR HEXADECIMAL 80 PARA WORK
	    CALL	LCDLOCATE	;SALTA PARA SUBROTINA DE POSICIONAMENTO
					;DO CURSOR NA PRIMEIRA LINHA E COLUNA 
LCD_TEST1
	    MOVLW	0XFF		;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA	;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    DECFSZ 	TESTE_LINHA,F
	    GOTO	LCD_TEST1	
	    MOVLW	.20		;VALOR REFERENTE A N° DE COLUNAS
	    MOVWF	TESTE_LINHA
	    MOVLW	H'C0'		;MOVE O VALOR HEXADECIMAL C0 PARA WORK
	    CALL	LCDLOCATE	;SALTA PARA SUBROTINA DE POSICIONAMENTO DO CURSOR NA SEGUNDA LINHA E COLUNA PRIMEIRA	
LCD_TEST2
	    MOVLW	0XFF		;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA	;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    DECFSZ 	TESTE_LINHA,F
	    GOTO	LCD_TEST2
	    MOVLW	.20		;VALOR REFERENTE A N° DE COLUNAS
	    MOVWF	TESTE_LINHA
	    MOVLW	H'94'		;MOVE O VALOR HEXADECIMAL 80 PARA WORK
	    CALL	LCDLOCATE	;SALTA PARA SUBROTINA DE POSICIONAMENTO DO CURSOR NA PRIMEIRA LINHA E COLUNA PRIMEIRA
LCD_TEST3
	    MOVLW	0XFF		;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA	;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    DECFSZ 	TESTE_LINHA,F
	    GOTO	LCD_TEST3	
	    MOVLW	.20		;VALOR REFERENTE A N° DE COLUNAS
	    MOVWF	TESTE_LINHA
	    MOVLW	H'D4'		;MOVE O VALOR HEXADECIMAL C0 PARA WORK
	    CALL	LCDLOCATE	;SALTA PARA SUBROTINA DE POSICIONAMENTO DO CURSOR NA SEGUNDA LINHA E COLUNA PRIMEIRA	
LCD_TEST4
	    MOVLW	H'FF'		;ENVIA O CARACTER PARA O WORK
	    CALL	LCDSENDDATA	;SALTA PARA SUBROTINA DE ESCRITA NO LCD
	    DECFSZ 	TESTE_LINHA,F
	    GOTO	LCD_TEST4
	    CALL    DELAY_50MS
	    CALL	LCDCLEAR
	    RETURN
	
	
;*******************************************************************************
; DELAY 50_MS
;*******************************************************************************
	
	
DELAY_50MS
	
	    MOVLW	.50
	    CALL	DELAY_MS
	    RETURN			;ENCERRA ROTINA	
; * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
; * 			ROTINA DE DELAY (DE 1MS ATÉ 256MS)		    *
; * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
; ESTA É UMA ROTINA DE DELAY VARIÁVEL, COM DURAÇÃO DE 1MS X O VALOR PASSADO
; EM WORK (W).
; EXEMPLO DE 250MS
; MOVLW .250
; CALL DELAY_MS
; EXEMPLO DE 50MS
; MOVLW .50
; CALL DELAY_MS

TEMP	
	    MOVF	TEMPO2,W
	    GOTO	DELAY_MS
DELAY_MS
	    MOVWF	TEMPO2
	    MOVWF	TEMPO1

	    BTFSC	SET_TEMPO
	    GOTO	LOOP4
	    MOVLW	H'05'
	    MOVWF	INCTEMPO
	
	
LOOP4
	    BSF		SET_TEMPO
	    MOVLW	.167           
	    MOVWF	TEMPO0		;MOVE VALOR DE W PARA O ARQUIVO TEMPO
LOOP3
	    DECF	TEMPO0,F            
	    MOVF	TEMPO0,W           
	    BTFSS	STATUS,Z     
	    GOTO	LOOP3              
	    NOP                     ;1us
	    NOP                     ;1us
	    NOP                     ;1us
	    NOP                     ;1us
	    DECFSZ 	TEMPO1,F 	;FIM DE TEMPO1 ?
	    GOTO 	LOOP4		;NÃO - VOLTA 11 INSTRUÇÕES
	    DECFSZ 	INCTEMPO,F
	    GOTO	TEMP
	    BCF		SET_TEMPO
	    RETURN			; RETORNA 		; RETORNA 

	
	
	
;******************************************************************************
;				    WS2812
;******************************************************************************	
VERDE				    ;ENVIAR A COR VERDE PARA O LED
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    BTG		LED_G,0
	    NOP	
	    ;BIT 1
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    BTG		LED_G,0
	    NOP
	    ;BIT 2
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    BTG		LED_G,0
	    NOP
	    ;BIT 3
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    BTG		LED_G,0
	    NOP
	    ;BIT 4
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    BTG		LED_G,0
	    NOP
	    ;BIT 5
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    BTG		LED_G,0
	    NOP
	    ;BIT 6
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    BTG		LED_G,0
	    NOP
	    ;BIT 7
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 8
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 9
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 10
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 11
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 12
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 13
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 14
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 15
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 16
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 17
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 18
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 19
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 20
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 21   
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 22
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 23
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    RETURN
	    ;BIT 24
VERMELHO			    ;ENVIAR A COR VERMELHA PARA O LED
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 1
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 2
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 3
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 4
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 5
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 6
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 7  
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    ;BIT 8
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    BTG		LED_G,0
	    NOP
	    ;BIT    
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    BTG		LED_G,0
	    NOP	
	    ;BIT 9
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    BTG		LED_G,0
	    NOP
	    ;BIT 10
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    BTG		LED_G,0
	    NOP
	    ;BIT 11
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    BTG		LED_G,0
	    NOP
	    ;BIT 12
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    BTG		LED_G,0
	    NOP
	    ;BIT 13
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    BTG		LED_G,0
	    NOP
	    ;BIT 14
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    BTG		LED_G,0
	    NOP
	    ;BIT 15
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 16
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	   ;BIT 17
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 19
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 20
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 21	    
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP    
	    ;BIT 22    
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 23   
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    RETURN
	    ;BIT 24
	 	
AZUL				    ;ENVIAR A COR AZUL PARA O LED
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 1
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 2
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 3
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 4
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 5
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 6
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 7
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 8
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 9
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 10
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 11
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 12
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 13
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 14
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 15
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    BTG		LED_G,0
	    NOP
	    ;BIT 16
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    BTG		LED_G,0
	    NOP
	    ;BIT 17
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    BTG		LED_G,0
	    NOP	
	    ;BIT 18
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    BTG		LED_G,0
	    NOP
	    ;BIT 19
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    BTG		LED_G,0
	    NOP
	    ;BIT 20
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    BTG		LED_G,0
	    NOP
	    ;BIT 21
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    BTG		LED_G,0
	    NOP
	    ;BIT 22
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    BTG		LED_G,0
	    NOP
	    ;BIT 23
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    BTG		LED_G,0
	    RETURN
	    ;BIT 24
PRETO				    ;ENVIAR A COR PRETA PARA O LED
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 1
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 2
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 3
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 4
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 5
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 6
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 7
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 8
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 9
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 10
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 11
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 12
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 13
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 14
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 15	    
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 16
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 17	    
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 18	    
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 19	    
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 20	    
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 21	    
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 22	    
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    NOP
	    NOP
	    ;BIT 23	    
	    BTG		LED_G,0
	    NOP
	    BTG		LED_G,0
	    NOP
	    RETURN
	    ;BIT 24
    END

    