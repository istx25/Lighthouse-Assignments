//
//  Player.h
//  2 Player Math
//
//  Created by Willow Belle on 2015-10-26.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property int points;
@property int lives;

- (int)decrementLivesValue;
- (instancetype)initWithName:(NSString *)name;

@end
