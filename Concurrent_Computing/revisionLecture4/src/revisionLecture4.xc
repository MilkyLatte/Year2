/*
 * revisionLecture4.xc
 *
 *  Created on: 5 Oct 2017
 *      Author: juan
 */
#include<stdio.h>
#include<platform.h>
void receive(chanend dataIncoming){
    char data;
    while (1){
    dataIncoming :> data;
    printf("Received %i\n", data);
    }
}
void send(char data, chanend dataOutgoing) {
    while(1) {
        dataOutgoing <: data;
        printf("Sent %i\n", data);
        data++;
    }
}
int main(void) {
    chan c;
    chan b;
    par {
        on tile[0] : receive (c);
        on tile[1] : send(1,c);

    }
}
