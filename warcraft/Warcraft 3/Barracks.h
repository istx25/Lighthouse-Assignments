//
//  Barracks.h
//  
//
//  Created by Daniel Mathews on 2015-07-31.
//
//

#import <Foundation/Foundation.h>
#import "Footman.h"
#import "Peasant.h"

@interface Barracks : NSObject

@property (assign, nonatomic) int food;
@property (assign, nonatomic) int gold;

- (Footman *)trainFootman;
- (Peasant *)trainPeasant;

- (int)food;
- (int)gold;

- (void)setGoldValue:(int)goldValue;
- (void)setFoodValue:(int)foodValue;
- (BOOL)canTrainFootman;
- (BOOL)canTrainPeasant;

@end
