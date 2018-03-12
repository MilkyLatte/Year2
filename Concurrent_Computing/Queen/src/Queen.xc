/*
 * Queen.xc
 *
 *  Created on: 6 Oct 2017
 *      Author: juan
 */

#include <stdio.h>
#include <platform.h>

    const unsigned char world [3][4] = {{1,5,4,7}, {2,10,8,4}, {6,8,7,10}};
    unsigned int food [2];
    unsigned int x[2], y[2];
    unsigned int allFood = 0;
    unsigned int sumX = 0;
    unsigned int sumY = 0;

void queen(chanend ant1, chanend ant2){
    for(int i=0; i<120; i++){
    int ant1Food;
    int ant2Food;
    ant1 :> ant1Food;
    ant2 :> ant2Food;

    if (ant1Food > ant2Food) {
        ant1 <: 1;
        ant2 <: 0;
    } else {
        ant2 <: 1;
        ant1 <: 0;
    }
 }
}
void ant (unsigned int id,
                     const unsigned char w[3][4],
                     unsigned int x,
                     unsigned int y,
                     chanend c
                     ) {
    unsigned int food = 0;
    unsigned int foodAtLocation;

    for(int i=0; i<2; i++) {
      //check land fertility in east and south
      if ( w[(x+1)%3][y] > w[x][(y+1)%4] )
        //move east
        x = (x+1)%3;
      else
        //move south
        y = (y+1)%4;

      //increase food counter by current land fertility
      foodAtLocation = w[x][y];

      //announce move
    }
    printf("Ant %d moved to (%d,%d) with new food count %d\n", id, x, y, foodAtLocation);


    for (int k = 0; k<10; k++) {
    int bool;

    c <: foodAtLocation;
    c :> bool;
    if (bool == 0) {
        printf("%d\n", bool);

        for(int i=0; i<1; i++) {
            printf("And %d will move\n", id);
              //check land fertility in east and south
              if ( w[(x+1)%3][y] > w[x][(y+1)%4] )
                //move east
                x = (x+1)%3;
              else
                //move south
                y = (y+1)%4;
              foodAtLocation = w[x][y];


              //announce move
              printf("Ant %d moved to (%d,%d) with new food count %d\n", id, x, y, foodAtLocation);

            }
    } else {
        food += w[x][y];
        printf("Ant %d is harvesting the food\n", id);
        printf("Food collected by ant %d: %d\n", id, food);
     }
 }
    printf("Final");
}




int main() {

    chan c1, c2;

    par {
        on tile[1]: ant(0, world, 0, 1, c1);
        on tile[1]: ant(1, world, 1, 2, c2);
        on tile[0]: queen(c1, c2);
    }

return 0;


};

