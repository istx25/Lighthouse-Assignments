//
//  LPGCat.h
//  Phonagotchi
//
//  Created by Willow Belle on 2015-10-29.
//  Copyright © 2015 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LPGCat : NSObject

@property (nonatomic) NSString *status;
@property (readonly) BOOL isGrumpy;

@property int restfulness;
@property int sleep;

- (void)handlePet:(CGFloat)velocity;
- (void)startTimer;

@end
