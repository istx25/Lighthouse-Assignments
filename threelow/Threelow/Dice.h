//
//  Dice.h
//  Threelow
//
//  Created by Willow Belle on 2015-10-21.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dice : NSObject

@property (nonatomic) NSString *dieName;
@property int currentValue;
@property BOOL isHeld;

- (instancetype)initWithName:(NSString *)name;
- (int)randomizeValue;

@end
