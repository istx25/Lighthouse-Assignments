//
//  ForcePanGestureRecognizer.m
//  FingerPainting
//
//  Created by Willow Belle on 2015-10-30.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "ForcePanGestureRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@interface ForcePanGestureRecognizer ()

@property (readwrite) CGFloat touchForce;

@end

@implementation ForcePanGestureRecognizer

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    self.touchForce = touch.force;
    
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    self.touchForce = touch.force;

    [super touchesMoved:touches withEvent:event];
}

@end
