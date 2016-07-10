//
//  Player.h
//  Snakes and Ladders
//
//  Created by Willow Belle on 2015-10-24.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Square.h"

@interface Player : NSObject

@property (nonatomic, strong) Square *square;

- (int)receiveDiceValue;

@end
