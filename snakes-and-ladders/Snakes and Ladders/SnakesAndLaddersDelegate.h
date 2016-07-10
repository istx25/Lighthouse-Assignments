//
//  SnakesAndLaddersDelegate.h
//  Snakes and Ladders
//
//  Created by Willow Belle on 2015-10-24.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SnakesAndLaddersDelegate <NSObject>

- (instancetype)initWithSquareNumber:(int)squareNumber;
- (int)steps;

@end
