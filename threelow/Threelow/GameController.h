//
//  GameController.h
//  Threelow
//
//  Created by Willow Belle on 2015-10-21.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

@interface GameController : NSObject

@property (nonatomic) NSMutableArray *dice;
@property (nonatomic) NSMutableArray *heldDice;

- (int)findScore:(NSArray *)findScoreArray;
- (void)printScore;

- (BOOL)isDieHeld:(Dice *)die;
- (void)holdDie:(int)die;
- (void)resetDice;

- (void)printDice:(NSArray *)dice;
- (void)rollDice;

@end
