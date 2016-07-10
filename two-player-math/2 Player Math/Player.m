//
//  Player.m
//  2 Player Math
//
//  Created by Willow Belle on 2015-10-26.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "Player.h"

@interface Player ()

@property (nonatomic) NSString *name;

@end

@implementation Player

- (instancetype)initWithName:(NSString *)name {
    self = [super init];

    if (self) {
        _lives = 3;
        _name = name;
    }

    return self;
}

- (NSString *)description {
    return self.name;
}

- (int)decrementLivesValue {
    return --self.lives;
}

@end
