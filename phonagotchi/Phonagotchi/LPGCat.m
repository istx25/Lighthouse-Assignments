//
//  LPGCat.m
//  Phonagotchi
//
//  Created by Willow Belle on 2015-10-29.
//  Copyright © 2015 Lighthouse Labs. All rights reserved.
//

#import "LPGCat.h"

@interface LPGCat ()

@property (readwrite) BOOL isGrumpy;

- (void)restTimer:(NSTimer *)timer;

@end

@implementation LPGCat

- (instancetype)init {
    self = [super init];

    if (self) {
        _isGrumpy = NO;
        _sleep = 0;
        _restfulness = 10;
        _status = @"Happy";
    }

    return self;
}

- (void)handlePet:(CGFloat)velocity {
    if (200 < velocity) {
        self.isGrumpy = YES;
    }

    if (200 > velocity) {
        self.isGrumpy = NO;
    }

    NSLog(@"Velocity: %f", velocity);
}

- (void)startTimer {
    self.sleep = 0;
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(restTimer:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}

- (void)restTimer:(NSTimer *)timer {
    self.sleep++;
    self.restfulness--;

    NSLog(@"%d", self.sleep);

    if (0 == self.restfulness) {
        [timer invalidate];
        self.status = @"Tired";
    }

    if (10 == self.sleep) {
        [timer invalidate];
        self.status = @"Happy";
    }
}

@end
