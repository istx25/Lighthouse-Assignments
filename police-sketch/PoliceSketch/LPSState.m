//
//  LPSState.m
//  PoliceSketch
//
//  Created by Willow Belle on 2015-10-26.
//  Copyright © 2015 Lighthouse Labs. All rights reserved.
//

#import "LPSState.h"

@implementation LPSState

- (instancetype)init {
    self = [super init];
    if (self) {

        _eyesIndex = [NSNumber numberWithInt:0];
        _nosesIndex = [NSNumber numberWithInt:0];
        _mouthsIndex = [NSNumber numberWithInt:0];

        _eyes = @[[UIImage imageNamed:@"eyes_1.jpg"],
                  [UIImage imageNamed:@"eyes_2.jpg"],
                  [UIImage imageNamed:@"eyes_3.jpg"],
                  [UIImage imageNamed:@"eyes_4.jpg"],
                  [UIImage imageNamed:@"eyes_5.jpg"]];

        _noses = @[[UIImage imageNamed:@"nose_1.jpg"],
                   [UIImage imageNamed:@"nose_2.jpg"],
                   [UIImage imageNamed:@"nose_3.jpg"],
                   [UIImage imageNamed:@"nose_4.jpg"],
                   [UIImage imageNamed:@"nose_5.jpg"]];

        _mouths = @[[UIImage imageNamed:@"mouth_1.jpg"],
                    [UIImage imageNamed:@"mouth_2.jpg"],
                    [UIImage imageNamed:@"mouth_3.jpg"],
                    [UIImage imageNamed:@"mouth_4.jpg"],
                    [UIImage imageNamed:@"mouth_5.jpg"]];
    }

    return self;
}

- (UIImage *)rotateForwardInStateArray:(NSArray *)array withIndex:(NSNumber *)index {
    int indexIntValue = [index intValue];

    if (indexIntValue >= array.count - 1) {
        index = [NSNumber numberWithInt:0];

        [self chooseIndex:array andIndex:index];
        NSLog(@"%i", [index intValue]);

        return array[[index intValue]];
    }

    indexIntValue++;
    index = [NSNumber numberWithInt:indexIntValue];
    [self chooseIndex:array andIndex:index];
    NSLog(@"%i", [index intValue]);

    return array[[index intValue]];
}

- (UIImage *)rotateBackwardInStateArray:(NSArray *)array withIndex:(NSNumber *)index {
    int indexIntValue = [index intValue];

    if (indexIntValue <= 0) {
        index = [NSNumber numberWithInt:array.count - 1];

        [self chooseIndex:array andIndex:index];
        NSLog(@"%i", [index intValue]);

        return array[[index intValue]];
    }

    index = [NSNumber numberWithInt:--indexIntValue];
    [self chooseIndex:array andIndex:index];
    NSLog(@"%i", [index intValue]);

    return array[[index intValue]];
}

- (NSNumber *)chooseIndex:(NSArray *)array andIndex:(NSNumber *)index  {
    if ([array isEqual:self.eyes]) {
        self.eyesIndex = index;
        return index;
    }

    if ([array isEqual:self.noses]) {
        self.nosesIndex = index;
        return index;
    }

    if ([array isEqual:self.mouths]) {
        self.mouthsIndex = index;
        return index;
    }

    return nil;
}

@end