//
//  Ladder.m
//  Snakes and Ladders
//
//  Created by Willow Belle on 2015-10-24.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "Ladder.h"

@implementation Ladder

- (instancetype)initWithSquareNumber:(int)squareNumber {
    self = [super init];

    if (self) {
        _steps = arc4random_uniform(squareNumber) + 1;
    }

    return self;
}

- (int)steps {
    return self.steps;
}

@end
