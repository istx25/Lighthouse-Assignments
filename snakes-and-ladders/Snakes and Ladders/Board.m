//
//  Board.m
//  Snakes and Ladders
//
//  Created by Willow Belle on 2015-10-24.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "Board.h"
#import "Ladder.h"
#import "Square.h"
#import "Player.h"
#import "Snake.h"
#import "InputCollector.h"

@interface Board () {
    int size;
    int combinedSize;

    int snakeSquareNumber;
    int ladderSquareNumber;
}

@end

@implementation Board

- (instancetype)init {
    self = [super self];

    if (self) {
        _board = [NSMutableArray array];
        _isGameFinished = NO;

        size = [self retrieveGridSize];
        combinedSize = size * size;

        NSLog(@"Welcome to Snakes and Ladders! You're playing in a %d *%d grid.", size, size);

        snakeSquareNumber = arc4random_uniform(combinedSize - 1) + 1;
        ladderSquareNumber = arc4random_uniform(combinedSize - 2) + 1;

        while (ladderSquareNumber == snakeSquareNumber) {
            ladderSquareNumber = arc4random_uniform(combinedSize - 2) + 1;
        }

        NSLog(@"Snakes: %d", snakeSquareNumber);
        NSLog(@"Ladders: %d", ladderSquareNumber);

        for (int index = 0; index < combinedSize; index++) {
            _square = [Square new];

            if (index == snakeSquareNumber) {
                _square.delegate = [[Snake alloc] initWithSquareNumber:snakeSquareNumber];
            }

            if (index == ladderSquareNumber) {
                _square.delegate = [[Ladder alloc] initWithSquareNumber:(combinedSize - ladderSquareNumber - 1)];
            }

            [_board addObject:_square];
        }
    }

    return self;
}

- (int)retrieveGridSize {
    InputCollector *collector = [InputCollector new];
    NSString *prompt = @"Input the grid size:";
    NSString *input = [collector inputForPrompt:prompt];

    return [input intValue];
}

- (void)movePlayer:(Player *)player withDiceNumber:(int)diceNumber {
    NSUInteger currentIndex;
    int totalSquares = (int)self.board.count;

    if (nil == player.square) {
        player.square = self.board[diceNumber - 1];
    }

    if (nil != player.square) {
        currentIndex = [self.board indexOfObject:player.square];
        if (currentIndex + diceNumber > totalSquares - 1) {
            self.isGameFinished = YES;
            NSLog(@"You are the winner.");
        }

        if (!currentIndex + diceNumber > totalSquares - 1) {
            player.square = self.board[currentIndex + diceNumber];
        }
    }

    if (player.square.delegate) {
        currentIndex = [self.board indexOfObject:player.square];
        int steps = [player.square.delegate steps];

        if (steps > 0) {
            NSLog(@"You found a ladder that will move you forward, %d steps.", steps);
        }

        if (steps < 0) {
            NSLog(@"You meet a snake that will move you backward, %d steps.", steps);
        }

        if (currentIndex + steps > totalSquares) {
            self.isGameFinished = YES;
            NSLog(@"You are the winner.");
        }

        if (currentIndex + steps > totalSquares) {
            player.square = self.board[currentIndex + steps];
        }
    }

    if (!self.isGameFinished) {
        currentIndex = [self.board indexOfObject:player.square];
        NSLog(@"Now you are in square %lu.", currentIndex + 1);
    }
}

@end
