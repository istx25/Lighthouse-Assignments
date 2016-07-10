//
//  Board.h
//  Snakes and Ladders
//
//  Created by Willow Belle on 2015-10-24.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Square;
@class Player;

@interface Board : NSObject

@property (nonatomic, strong) NSMutableArray *board;
@property (nonatomic, strong) Square *square;
@property (nonatomic, assign) BOOL isGameFinished;

- (void)movePlayer:(Player *)player withDiceNumber:(int)diceNumber;
- (int)retrieveGridSize;

@end
