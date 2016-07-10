//
//  GameModel.m
//  Mafia Mini Games
//
//  Created by Willow Belle on 2015-10-28.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "GameModel.h"
#import "Roles.h"

@interface GameModel ()

@property (nonatomic) Roles *roles;
@property (nonatomic) Player *player;

@end

@implementation GameModel

- (instancetype)initWithPlayerType:(PlayerType)type {
    self = [super init];

    if (self) {
        _player = [[Player alloc] initWithPlayerType:type];
        _roles = [[Roles alloc] initWithMafiaMembers:[NSNumber numberWithInt:15] andInnocentVillagers:[NSNumber numberWithInt:30]];
    }

    return self;
}

// MARK: - Mafia Methods
- (BOOL)hasLivingVillagers {
    if (self.roles.innocentVillagers <= 0) {
        return NO;
    }

    return YES;
}

- (void)killVillager {
    int villagers = [self.roles.innocentVillagers intValue];
    self.roles.innocentVillagers = [NSNumber numberWithInt:--villagers];
}

// MARK: - Sheriff Methods
- (BOOL)hasLivingMafiaMember {
    if (self.roles.mafiaMembers <= 0) {
        return NO;
    }

    return YES;
}

- (void)mafiaMemberConfessed {
    int mafiaMembers = [self.roles.mafiaMembers intValue];
    self.roles.mafiaMembers = [NSNumber numberWithInt:--mafiaMembers];
}

@end
