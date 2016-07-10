//
//  Dice.m
//  Threelow
//
//  Created by Willow Belle on 2015-10-21.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "Dice.h"

@implementation Dice

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        self.dieName = name;
    }

    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ (showing: %d)", self.dieName, self.currentValue];
}

- (int)randomizeValue {
    return self.currentValue = arc4random_uniform(6) + 1;
}

@end
