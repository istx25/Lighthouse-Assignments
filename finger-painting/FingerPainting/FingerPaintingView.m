//
//  DrawingView.m
//  FingerPainting
//
//  Created by Willow Belle on 2015-10-30.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "FingerPaintingView.h"
#import "FingerBezierPath.h"

@implementation FingerPaintingView

- (void)drawRect:(CGRect)rect {
    for (FingerBezierPath *path in [self.delegate pathsForDrawing]) {
        [path.strokeColor setStroke];
        [path stroke];
    }
}

@end
