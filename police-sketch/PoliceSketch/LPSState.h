//
//  LPSState.h
//  PoliceSketch
//
//  Created by Willow Belle on 2015-10-26.
//  Copyright © 2015 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LPSState : NSObject

@property (nonatomic) NSArray *eyes;
@property (nonatomic) NSArray *noses;
@property (nonatomic) NSArray *mouths;

@property NSNumber *eyesIndex;
@property NSNumber *nosesIndex;
@property NSNumber *mouthsIndex;

- (UIImage *)rotateForwardInStateArray:(NSArray *)array withIndex:(NSNumber *)index;
- (UIImage *)rotateBackwardInStateArray:(NSArray *)array withIndex:(NSNumber *)index;


//- (UIImage *)rotateBackwardInStateArray:(NSArray *)array;

@end
