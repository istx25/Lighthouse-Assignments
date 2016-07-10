//
//  Barracks.m
//
//
//  Created by Daniel Mathews on 2015-07-31.
//
//

#import "Barracks.h"

@implementation Barracks

- (instancetype)init {
    _food = 80;
    _gold = 1000;

    return self;
}

- (BOOL)canTrainFootman {
    if ((self.food >= 2) && (self.gold >= 135)) {
        return YES;
    }

    return NO;
}

- (BOOL)canTrainPeasant {
    if ((self.food >= 5) && (self.gold >= 90)) {
        return YES;
    }

    return NO;
}

- (Footman *)trainFootman {
    if ([self canTrainFootman]) {
        _gold -= 135;
        _food -= 2;

        Footman *newFootman = [[Footman alloc] init];

        return newFootman;
    }

    return nil;
}

- (Peasant *)trainPeasant {
    if ([self canTrainPeasant]) {
        _gold -= 90;
        _food -= 5;

        Peasant *newPeasant = [[Peasant alloc] init];

        return newPeasant;
    }

    return nil;
}

- (int)gold {
    return _gold;
}

- (int)food {
    return _food;
}

- (void)setGoldValue:(int)gold {
    _gold = gold;
}

- (void)setFoodValue:(int)food {
    _food = food;
}

@end
