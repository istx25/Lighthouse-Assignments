//
//  Player.h
//  Mafia Mini Games
//
//  Created by Willow Belle on 2015-10-28.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum: NSUInteger {
    PlayerTypeMafiaMember,
    PlayerTypeSheriff
} PlayerType;

@interface Player : NSObject

@property PlayerType type;

- (instancetype)initWithPlayerType:(PlayerType)type;

@end
