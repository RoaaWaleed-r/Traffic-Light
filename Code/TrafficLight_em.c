#define display1 portB
#define display2 portC
void counter(signed char count){
    char left=count/10;      //Tens
    char right=count%10;     //Units
    portD.b7=0;
    display2=right;
    display1=left;
    delay_ms(10);

}
 signed char count;
 unsigned char i;
 char currentStreet=0;   // To togle between 2  streets

void autooo(){
while(portA.b0==1){
     if(portA.b0==0) break;
     for(;;){
       for(count=23;count>=4;count--){
          portD=0b00001100;      //green1 , red2
          for(i=0;i<50;i++){
             counter(count);
          }
          if(portA.b0==0){
             display1=0;
             display2=0;
             break;
          }
       }
       if(portA.b0==0) break;
       for(count=3;count>=0;count--){
          portD=0b00001010;      //yellow1 , red2
          for(i=0;i<50;i++){
             counter(count);
          }
          if(portA.b0==0){
            display1=0;
            display2=0;
            break;
          }
       }
       if(portA.b0==0) break;
       for(count=15;count>=4;count--){
          portD=0b00100001;       //red1 , green2
          for(i=0;i<50;i++){
             counter(count);
          }
          if(portA.b0==0){
             display1=0;
             display2=0;
             break;
          }
       }
       if(portA.b0==0) break;
       for(count=3;count>=0;count--){
          portD=0b00010001;      //red1 , yellow2
          for(i=0;i<50;i++){
             counter(count);
          }
          if(portA.b0==0){
             display1=0;
             display2=0;
             break;
          }
       }
    }
}
}
void manual(){
while(portA.b0==0 ){
    if(portA.b0==1) break;
    while(portA.b1 == 0) {
       currentStreet =! currentStreet; // Switch between streets in Manual mode
       delay_ms(50);
       if (currentStreet == 0) {
           for(count=3;count>=0;count--){
               portD=0b00001010;    //yellow1 , red2
               for(i=0;i<50;i++){
                 counter(count);
               }

           }
        portD=0b00100001;    //red1 , green2
        delay_ms(1000);
       }

       else {
           for(count=3;count>=0;count--){
               portD=0b00010001;     //red1 , yellow2
               for(i=0;i<50;i++){
                  counter(count);
               }
           }
        portD=0b00001100;    //green1 , red2
        delay_ms(1000);
       }
   }
}
}
void main() {
adcon1=7;
    trisB=0;    display1=0;
    trisC=0;    display2=0;
    trisD=0;    portD=0;    //Leds
    trisD.b7=0;   portD.b7=1;  //off at beginning
    trisA.b0=1;    //Auto / Manual Switch
    trisA.b1=1;    //Manual Switch
    while(1){
          while(portA.b0==0){   //For Manual Mode
             manual();
            delay_ms(50);

          }
          while(portA.b0==1){   //For Auto Mode
             autooo();
            delay_ms(50);

          }
    }


}