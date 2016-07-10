//
//  FingerBezierPath.m
//  FingerPainting
//
//  Created by Willow Belle on 2015-10-30.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "FingerBezierPath.h"

@implementation FingerBezierPath

- (instancetype)init {
    self = [super init];

    if (self) {
        _strokeColor = [UIColor blackColor];
    }

    return self;
}

@end
