
_counter:

;TrafficLight_em.c,3 :: 		void counter(signed char count){
;TrafficLight_em.c,4 :: 		char left=count/10;      //Tens
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_counter_count+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R0+0, 0
	MOVWF      FLOC__counter+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_counter_count+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
;TrafficLight_em.c,6 :: 		portD.b7=0;
	BCF        PORTD+0, 7
;TrafficLight_em.c,7 :: 		display2=right;
	MOVF       R0+0, 0
	MOVWF      PORTC+0
;TrafficLight_em.c,8 :: 		display1=left;
	MOVF       FLOC__counter+0, 0
	MOVWF      PORTB+0
;TrafficLight_em.c,9 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_counter0:
	DECFSZ     R13+0, 1
	GOTO       L_counter0
	DECFSZ     R12+0, 1
	GOTO       L_counter0
	NOP
;TrafficLight_em.c,11 :: 		}
L_end_counter:
	RETURN
; end of _counter

_autooo:

;TrafficLight_em.c,16 :: 		void autooo(){
;TrafficLight_em.c,17 :: 		while(portA.b0==1){
L_autooo1:
	BTFSS      PORTA+0, 0
	GOTO       L_autooo2
;TrafficLight_em.c,18 :: 		if(portA.b0==0) break;
	BTFSC      PORTA+0, 0
	GOTO       L_autooo3
	GOTO       L_autooo2
L_autooo3:
;TrafficLight_em.c,19 :: 		for(;;){
L_autooo4:
;TrafficLight_em.c,20 :: 		for(count=23;count>=4;count--){
	MOVLW      23
	MOVWF      _count+0
L_autooo7:
	MOVLW      128
	XORWF      _count+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      4
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_autooo8
;TrafficLight_em.c,21 :: 		portD=0b00001100;      //green1 , red2
	MOVLW      12
	MOVWF      PORTD+0
;TrafficLight_em.c,22 :: 		for(i=0;i<50;i++){
	CLRF       _i+0
L_autooo10:
	MOVLW      50
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_autooo11
;TrafficLight_em.c,23 :: 		counter(count);
	MOVF       _count+0, 0
	MOVWF      FARG_counter_count+0
	CALL       _counter+0
;TrafficLight_em.c,22 :: 		for(i=0;i<50;i++){
	INCF       _i+0, 1
;TrafficLight_em.c,24 :: 		}
	GOTO       L_autooo10
L_autooo11:
;TrafficLight_em.c,25 :: 		if(portA.b0==0){
	BTFSC      PORTA+0, 0
	GOTO       L_autooo13
;TrafficLight_em.c,26 :: 		display1=0;
	CLRF       PORTB+0
;TrafficLight_em.c,27 :: 		display2=0;
	CLRF       PORTC+0
;TrafficLight_em.c,28 :: 		break;
	GOTO       L_autooo8
;TrafficLight_em.c,29 :: 		}
L_autooo13:
;TrafficLight_em.c,20 :: 		for(count=23;count>=4;count--){
	DECF       _count+0, 1
;TrafficLight_em.c,30 :: 		}
	GOTO       L_autooo7
L_autooo8:
;TrafficLight_em.c,31 :: 		if(portA.b0==0) break;
	BTFSC      PORTA+0, 0
	GOTO       L_autooo14
	GOTO       L_autooo5
L_autooo14:
;TrafficLight_em.c,32 :: 		for(count=3;count>=0;count--){
	MOVLW      3
	MOVWF      _count+0
L_autooo15:
	MOVLW      128
	XORWF      _count+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_autooo16
;TrafficLight_em.c,33 :: 		portD=0b00001010;      //yellow1 , red2
	MOVLW      10
	MOVWF      PORTD+0
;TrafficLight_em.c,34 :: 		for(i=0;i<50;i++){
	CLRF       _i+0
L_autooo18:
	MOVLW      50
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_autooo19
;TrafficLight_em.c,35 :: 		counter(count);
	MOVF       _count+0, 0
	MOVWF      FARG_counter_count+0
	CALL       _counter+0
;TrafficLight_em.c,34 :: 		for(i=0;i<50;i++){
	INCF       _i+0, 1
;TrafficLight_em.c,36 :: 		}
	GOTO       L_autooo18
L_autooo19:
;TrafficLight_em.c,37 :: 		if(portA.b0==0){
	BTFSC      PORTA+0, 0
	GOTO       L_autooo21
;TrafficLight_em.c,38 :: 		display1=0;
	CLRF       PORTB+0
;TrafficLight_em.c,39 :: 		display2=0;
	CLRF       PORTC+0
;TrafficLight_em.c,40 :: 		break;
	GOTO       L_autooo16
;TrafficLight_em.c,41 :: 		}
L_autooo21:
;TrafficLight_em.c,32 :: 		for(count=3;count>=0;count--){
	DECF       _count+0, 1
;TrafficLight_em.c,42 :: 		}
	GOTO       L_autooo15
L_autooo16:
;TrafficLight_em.c,43 :: 		if(portA.b0==0) break;
	BTFSC      PORTA+0, 0
	GOTO       L_autooo22
	GOTO       L_autooo5
L_autooo22:
;TrafficLight_em.c,44 :: 		for(count=15;count>=4;count--){
	MOVLW      15
	MOVWF      _count+0
L_autooo23:
	MOVLW      128
	XORWF      _count+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      4
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_autooo24
;TrafficLight_em.c,45 :: 		portD=0b00100001;       //red1 , green2
	MOVLW      33
	MOVWF      PORTD+0
;TrafficLight_em.c,46 :: 		for(i=0;i<50;i++){
	CLRF       _i+0
L_autooo26:
	MOVLW      50
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_autooo27
;TrafficLight_em.c,47 :: 		counter(count);
	MOVF       _count+0, 0
	MOVWF      FARG_counter_count+0
	CALL       _counter+0
;TrafficLight_em.c,46 :: 		for(i=0;i<50;i++){
	INCF       _i+0, 1
;TrafficLight_em.c,48 :: 		}
	GOTO       L_autooo26
L_autooo27:
;TrafficLight_em.c,49 :: 		if(portA.b0==0){
	BTFSC      PORTA+0, 0
	GOTO       L_autooo29
;TrafficLight_em.c,50 :: 		display1=0;
	CLRF       PORTB+0
;TrafficLight_em.c,51 :: 		display2=0;
	CLRF       PORTC+0
;TrafficLight_em.c,52 :: 		break;
	GOTO       L_autooo24
;TrafficLight_em.c,53 :: 		}
L_autooo29:
;TrafficLight_em.c,44 :: 		for(count=15;count>=4;count--){
	DECF       _count+0, 1
;TrafficLight_em.c,54 :: 		}
	GOTO       L_autooo23
L_autooo24:
;TrafficLight_em.c,55 :: 		if(portA.b0==0) break;
	BTFSC      PORTA+0, 0
	GOTO       L_autooo30
	GOTO       L_autooo5
L_autooo30:
;TrafficLight_em.c,56 :: 		for(count=3;count>=0;count--){
	MOVLW      3
	MOVWF      _count+0
L_autooo31:
	MOVLW      128
	XORWF      _count+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_autooo32
;TrafficLight_em.c,57 :: 		portD=0b00010001;      //red1 , yellow2
	MOVLW      17
	MOVWF      PORTD+0
;TrafficLight_em.c,58 :: 		for(i=0;i<50;i++){
	CLRF       _i+0
L_autooo34:
	MOVLW      50
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_autooo35
;TrafficLight_em.c,59 :: 		counter(count);
	MOVF       _count+0, 0
	MOVWF      FARG_counter_count+0
	CALL       _counter+0
;TrafficLight_em.c,58 :: 		for(i=0;i<50;i++){
	INCF       _i+0, 1
;TrafficLight_em.c,60 :: 		}
	GOTO       L_autooo34
L_autooo35:
;TrafficLight_em.c,61 :: 		if(portA.b0==0){
	BTFSC      PORTA+0, 0
	GOTO       L_autooo37
;TrafficLight_em.c,62 :: 		display1=0;
	CLRF       PORTB+0
;TrafficLight_em.c,63 :: 		display2=0;
	CLRF       PORTC+0
;TrafficLight_em.c,64 :: 		break;
	GOTO       L_autooo32
;TrafficLight_em.c,65 :: 		}
L_autooo37:
;TrafficLight_em.c,56 :: 		for(count=3;count>=0;count--){
	DECF       _count+0, 1
;TrafficLight_em.c,66 :: 		}
	GOTO       L_autooo31
L_autooo32:
;TrafficLight_em.c,67 :: 		}
	GOTO       L_autooo4
L_autooo5:
;TrafficLight_em.c,68 :: 		}
	GOTO       L_autooo1
L_autooo2:
;TrafficLight_em.c,69 :: 		}
L_end_autooo:
	RETURN
; end of _autooo

_manual:

;TrafficLight_em.c,70 :: 		void manual(){
;TrafficLight_em.c,71 :: 		while(portA.b0==0 ){
L_manual38:
	BTFSC      PORTA+0, 0
	GOTO       L_manual39
;TrafficLight_em.c,72 :: 		if(portA.b0==1) break;
	BTFSS      PORTA+0, 0
	GOTO       L_manual40
	GOTO       L_manual39
L_manual40:
;TrafficLight_em.c,73 :: 		while(portA.b1 == 0) {
L_manual41:
	BTFSC      PORTA+0, 1
	GOTO       L_manual42
;TrafficLight_em.c,74 :: 		currentStreet =! currentStreet; // Switch between streets in Manual mode
	MOVF       _currentStreet+0, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      _currentStreet+0
;TrafficLight_em.c,75 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_manual43:
	DECFSZ     R13+0, 1
	GOTO       L_manual43
	DECFSZ     R12+0, 1
	GOTO       L_manual43
	NOP
	NOP
;TrafficLight_em.c,76 :: 		if (currentStreet == 0) {
	MOVF       _currentStreet+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_manual44
;TrafficLight_em.c,77 :: 		for(count=3;count>=0;count--){
	MOVLW      3
	MOVWF      _count+0
L_manual45:
	MOVLW      128
	XORWF      _count+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_manual46
;TrafficLight_em.c,78 :: 		portD=0b00001010;    //yellow1 , red2
	MOVLW      10
	MOVWF      PORTD+0
;TrafficLight_em.c,79 :: 		for(i=0;i<50;i++){
	CLRF       _i+0
L_manual48:
	MOVLW      50
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_manual49
;TrafficLight_em.c,80 :: 		counter(count);
	MOVF       _count+0, 0
	MOVWF      FARG_counter_count+0
	CALL       _counter+0
;TrafficLight_em.c,79 :: 		for(i=0;i<50;i++){
	INCF       _i+0, 1
;TrafficLight_em.c,81 :: 		}
	GOTO       L_manual48
L_manual49:
;TrafficLight_em.c,77 :: 		for(count=3;count>=0;count--){
	DECF       _count+0, 1
;TrafficLight_em.c,83 :: 		}
	GOTO       L_manual45
L_manual46:
;TrafficLight_em.c,84 :: 		portD=0b00100001;    //red1 , green2
	MOVLW      33
	MOVWF      PORTD+0
;TrafficLight_em.c,85 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_manual51:
	DECFSZ     R13+0, 1
	GOTO       L_manual51
	DECFSZ     R12+0, 1
	GOTO       L_manual51
	DECFSZ     R11+0, 1
	GOTO       L_manual51
	NOP
	NOP
;TrafficLight_em.c,86 :: 		}
	GOTO       L_manual52
L_manual44:
;TrafficLight_em.c,89 :: 		for(count=3;count>=0;count--){
	MOVLW      3
	MOVWF      _count+0
L_manual53:
	MOVLW      128
	XORWF      _count+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_manual54
;TrafficLight_em.c,90 :: 		portD=0b00010001;     //red1 , yellow2
	MOVLW      17
	MOVWF      PORTD+0
;TrafficLight_em.c,91 :: 		for(i=0;i<50;i++){
	CLRF       _i+0
L_manual56:
	MOVLW      50
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_manual57
;TrafficLight_em.c,92 :: 		counter(count);
	MOVF       _count+0, 0
	MOVWF      FARG_counter_count+0
	CALL       _counter+0
;TrafficLight_em.c,91 :: 		for(i=0;i<50;i++){
	INCF       _i+0, 1
;TrafficLight_em.c,93 :: 		}
	GOTO       L_manual56
L_manual57:
;TrafficLight_em.c,89 :: 		for(count=3;count>=0;count--){
	DECF       _count+0, 1
;TrafficLight_em.c,94 :: 		}
	GOTO       L_manual53
L_manual54:
;TrafficLight_em.c,95 :: 		portD=0b00001100;    //green1 , red2
	MOVLW      12
	MOVWF      PORTD+0
;TrafficLight_em.c,96 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_manual59:
	DECFSZ     R13+0, 1
	GOTO       L_manual59
	DECFSZ     R12+0, 1
	GOTO       L_manual59
	DECFSZ     R11+0, 1
	GOTO       L_manual59
	NOP
	NOP
;TrafficLight_em.c,97 :: 		}
L_manual52:
;TrafficLight_em.c,98 :: 		}
	GOTO       L_manual41
L_manual42:
;TrafficLight_em.c,99 :: 		}
	GOTO       L_manual38
L_manual39:
;TrafficLight_em.c,100 :: 		}
L_end_manual:
	RETURN
; end of _manual

_main:

;TrafficLight_em.c,101 :: 		void main() {
;TrafficLight_em.c,102 :: 		adcon1=7;
	MOVLW      7
	MOVWF      ADCON1+0
;TrafficLight_em.c,103 :: 		trisB=0;    display1=0;
	CLRF       TRISB+0
	CLRF       PORTB+0
;TrafficLight_em.c,104 :: 		trisC=0;    display2=0;
	CLRF       TRISC+0
	CLRF       PORTC+0
;TrafficLight_em.c,105 :: 		trisD=0;    portD=0;    //Leds
	CLRF       TRISD+0
	CLRF       PORTD+0
;TrafficLight_em.c,106 :: 		trisD.b7=0;   portD.b7=1;  //off at beginning
	BCF        TRISD+0, 7
	BSF        PORTD+0, 7
;TrafficLight_em.c,107 :: 		trisA.b0=1;    //Auto / Manual Switch
	BSF        TRISA+0, 0
;TrafficLight_em.c,108 :: 		trisA.b1=1;    //Manual Switch
	BSF        TRISA+0, 1
;TrafficLight_em.c,109 :: 		while(1){
L_main60:
;TrafficLight_em.c,110 :: 		while(portA.b0==0){   //For Manual Mode
L_main62:
	BTFSC      PORTA+0, 0
	GOTO       L_main63
;TrafficLight_em.c,111 :: 		manual();
	CALL       _manual+0
;TrafficLight_em.c,112 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main64:
	DECFSZ     R13+0, 1
	GOTO       L_main64
	DECFSZ     R12+0, 1
	GOTO       L_main64
	NOP
	NOP
;TrafficLight_em.c,114 :: 		}
	GOTO       L_main62
L_main63:
;TrafficLight_em.c,115 :: 		while(portA.b0==1){   //For Auto Mode
L_main65:
	BTFSS      PORTA+0, 0
	GOTO       L_main66
;TrafficLight_em.c,116 :: 		autooo();
	CALL       _autooo+0
;TrafficLight_em.c,117 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main67:
	DECFSZ     R13+0, 1
	GOTO       L_main67
	DECFSZ     R12+0, 1
	GOTO       L_main67
	NOP
	NOP
;TrafficLight_em.c,119 :: 		}
	GOTO       L_main65
L_main66:
;TrafficLight_em.c,120 :: 		}
	GOTO       L_main60
;TrafficLight_em.c,123 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
