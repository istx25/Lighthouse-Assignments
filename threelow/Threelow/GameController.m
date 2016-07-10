//
//  GameController.m
//  Threelow
//
//  Created by Willow Belle on 2015-10-21.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "GameController.h"

@interface GameController()

@property (nonatomic, strong) Dice *firstDie;
@property (nonatomic, strong) Dice *secondDie;
@property (nonatomic, strong) Dice *thirdDie;
@property (nonatomic, strong) Dice *fourthDie;
@property (nonatomic, strong) Dice *fifthDie;

@end

@implementation GameController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.dice = [[NSMutableArray alloc] init];
        self.heldDice = [[NSMutableArray alloc] init];

        self.firstDie = [[Dice alloc] initWithName:@"First die"];
        self.secondDie = [[Dice alloc] initWithName:@"Second die"];
        self.thirdDie = [[Dice alloc] initWithName:@"Third die"];
        self.fourthDie = [[Dice alloc] initWithName:@"Fourth die"];
        self.fifthDie = [[Dice alloc] initWithName:@"Fifth die"];
        
        [self.dice addObjectsFromArray:@[self.firstDie, self.secondDie, self.thirdDie, self.fourthDie, self.fifthDie]];
    }

    return self;
}

- (void)holdDie:(int)die {
    Dice *dice = self.dice[die];

    if ([self.heldDice containsObject:dice]) {
        NSLog(@"The %@ is no longer in the hold pile.", dice);
        return [self.heldDice removeObject:dice];
    }

    if (![self.heldDice containsObject:dice]) {
        NSLog(@"The %@ has been added to the hold pile.", dice);
        return [self.heldDice addObject:dice];
    }
}

- (BOOL)isDieHeld:(Dice *)die {
    die.isHeld = YES;
    return [self.heldDice containsObject:die];
}

- (void)resetDice {
    return [self.heldDice removeAllObjects];
}

- (int)findScore:(NSArray *)findScoreArray {
    NSLog(@"%@", findScoreArray);

    int score = 0;

    for (Dice *die in self.heldDice) {
        score += die.currentValue;
    }

    return score;
}

- (void)rollDice {
    [self printDice:self.dice];
}

- (void)printDice:(NSArray *)dice {
    for (int index = 0; index < dice.count; index++) {
        Dice *die = dice[index];
        if (die.isHeld) {
            NSLog(@"%i. The die landed on: [%@]", index, dice[index]);
        } else {
            [die randomizeValue];
            NSLog(@"%i. The die landed on: %@", index, dice[index]);
        }
    }
}

- (void)printScore {
    NSLog(@"Held die score: %d", [self findScore:[self heldDice]]);
}

@end
