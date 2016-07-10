//
//  GameModel.h
//  Mafia Mini Games
//
//  Created by Willow Belle on 2015-10-28.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface GameModel : NSObject

- (BOOL)hasLivingVillagers;
- (void)killVillager;

- (BOOL)hasLivingMafiaMember;
- (void)mafiaMemberConfessed;

- (instancetype)initWithPlayerType:(PlayerType)type;

@end
