//
//  Roles.m
//  Mafia Mini Games
//
//  Created by Willow Belle on 2015-10-28.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "Roles.h"

@implementation Roles

- (instancetype)initWithMafiaMembers:(NSNumber *)mafiaMembers andInnocentVillagers:(NSNumber *)villagers {
    self = [super init];

    if (self) {
        _mafiaMembers = mafiaMembers;
        _innocentVillagers = villagers;
    }

    return self;
}

@end
