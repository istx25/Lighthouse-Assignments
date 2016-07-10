//
//  GameModel.m
//  2 Player Math
//
//  Created by Willow Belle on 2015-10-26.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "GameModel.h"

@interface GameModel ()

- (int)generateRandomNumber;

@end

@implementation GameModel

- (instancetype)init {
    self = [super init];

    if (self) {
        _firstPlayer = [[Player alloc] initWithName:@"Player 1"];
        _secondPlayer = [[Player alloc] initWithName:@"Player 2"];
        _currentPlayer = _firstPlayer;
        _displayValue = [NSString new];
    }

    return self;
}

- (int)generateRandomNumber {
    return arc4random_uniform(20 - 1);
}

- (void)generateQuestion {
    _firstValueInEquation = [self generateRandomNumber];
    _secondValueInEquation = [self generateRandomNumber];
}

- (int)questionAnswer {
    return _firstValueInEquation + _secondValueInEquation;
}

- (BOOL)checkAnswer:(int)providedAnswer {
    if (providedAnswer == [self questionAnswer]) {
        self.currentPlayer.points++;

        return YES;
    }

    self.currentPlayer.lives--;
    NSLog(@"%i", self.currentPlayer.lives);

    return NO;
}

- (void)nextPlayer {
    if ([self.currentPlayer isEqual:self.firstPlayer]) {
        self.currentPlayer = self.secondPlayer;

        return;
    }

    if ([self.currentPlayer isEqual:self.secondPlayer]) {
        self.currentPlayer = self.firstPlayer;

        return;
    }
}

- (BOOL)isGameOver {
    if (self.currentPlayer.lives != 0) {
        return NO;
    }

    NSLog(@"You have zero lives.");

    return YES;
}

- (int)addToDisplayValue:(int)displayValue {
    NSString *convert = [NSString stringWithFormat:@"%i", displayValue];
    self.displayValue = [self.displayValue stringByAppendingString:convert];

    return [self.displayValue intValue];;
}

@end
