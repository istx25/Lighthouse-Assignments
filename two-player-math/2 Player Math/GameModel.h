//
//  GameModel.h
//  2 Player Math
//
//  Created by Willow Belle on 2015-10-26.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface GameModel : NSObject

@property (nonatomic) Player *currentPlayer;
@property (nonatomic) Player *firstPlayer;
@property (nonatomic) Player *secondPlayer;

@property (nonatomic) NSString *displayValue;
@property (readonly) int firstValueInEquation;
@property (readonly) int secondValueInEquation;

- (void)generateQuestion;
- (int)questionAnswer;
- (void)nextPlayer;
- (BOOL)isGameOver;

- (BOOL)checkAnswer:(int)providedAnswer;
- (int)addToDisplayValue:(int)displayValue;

@end
