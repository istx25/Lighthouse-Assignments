//
//  main.m
//  Snakes and Ladders
//
//  Created by Willow Belle on 2015-10-24.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Board.h"
#import "Player.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        Board *board = [Board new];
        Player *firstPlayer = [Player new];
        Player *secondPlayer = [Player new];

        while (!board.isGameFinished) {
            [board movePlayer:firstPlayer withDiceNumber:[firstPlayer receiveDiceValue]];

            if (board.isGameFinished) {
                continue;
            }

            [board movePlayer:secondPlayer withDiceNumber:[secondPlayer receiveDiceValue]];
        }
    }
    
    return 0;
}
