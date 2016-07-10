//
//  Player.m
//  Mafia Mini Games
//
//  Created by Willow Belle on 2015-10-28.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)initWithPlayerType:(PlayerType)type {
    self = [super init];

    if (self) {
        _type = type;
    }

    return self;
}

@end
