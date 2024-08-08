#line 1 "C:/Users/DELL/Downloads/RoaaWaleed/Project/Code/TrafficLight_em.c"


void counter(signed char count){
 char left=count/10;
 char right=count%10;
 portD.b7=0;
  portC =right;
  portB =left;
 delay_ms(10);

}
 signed char count;
 unsigned char i;
 char currentStreet=0;

void autooo(){
while(portA.b0==1){
 if(portA.b0==0) break;
 for(;;){
 for(count=23;count>=4;count--){
 portD=0b00001100;
 for(i=0;i<50;i++){
 counter(count);
 }
 if(portA.b0==0){
  portB =0;
  portC =0;
 break;
 }
 }
 if(portA.b0==0) break;
 for(count=3;count>=0;count--){
 portD=0b00001010;
 for(i=0;i<50;i++){
 counter(count);
 }
 if(portA.b0==0){
  portB =0;
  portC =0;
 break;
 }
 }
 if(portA.b0==0) break;
 for(count=15;count>=4;count--){
 portD=0b00100001;
 for(i=0;i<50;i++){
 counter(count);
 }
 if(portA.b0==0){
  portB =0;
  portC =0;
 break;
 }
 }
 if(portA.b0==0) break;
 for(count=3;count>=0;count--){
 portD=0b00010001;
 for(i=0;i<50;i++){
 counter(count);
 }
 if(portA.b0==0){
  portB =0;
  portC =0;
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
 currentStreet =! currentStreet;
 delay_ms(50);
 if (currentStreet == 0) {
 for(count=3;count>=0;count--){
 portD=0b00001010;
 for(i=0;i<50;i++){
 counter(count);
 }

 }
 portD=0b00100001;
 delay_ms(1000);
 }

 else {
 for(count=3;count>=0;count--){
 portD=0b00010001;
 for(i=0;i<50;i++){
 counter(count);
 }
 }
 portD=0b00001100;
 delay_ms(1000);
 }
 }
}
}
void main() {
adcon1=7;
 trisB=0;  portB =0;
 trisC=0;  portC =0;
 trisD=0; portD=0;
 trisD.b7=0; portD.b7=1;
 trisA.b0=1;
 trisA.b1=1;
 while(1){
 while(portA.b0==0){
 manual();
 delay_ms(50);

 }
 while(portA.b0==1){
 autooo();
 delay_ms(50);

 }
 }


}
