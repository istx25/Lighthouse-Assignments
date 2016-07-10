//
//  MyScrollView.m
//  MyScrollView
//
//  Created by Willow Belle on 2015-11-02.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "MyScrollView.h"

@interface MyScrollView ()

@property (nonatomic) UIPanGestureRecognizer *gestureRecognizer;

@end

@implementation MyScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        _gestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(respondToPanRecognizer:)];
        [self addGestureRecognizer:_gestureRecognizer];
    }

    return self;
}

- (void)respondToPanRecognizer:(UIPanGestureRecognizer *)sender {
    CGPoint translation = [sender translationInView:self];
    CGRect bounds = self.bounds;

    CGFloat newBoundsOriginY = bounds.origin.y - translation.y;
    CGFloat minBoundsOriginY = 0.0;
    CGFloat maxBoundsOriginY = self.contentSize.height - bounds.size.height;

    bounds.origin.y = fmax(minBoundsOriginY, fmin(newBoundsOriginY, maxBoundsOriginY));
    self.bounds = bounds;

    [sender setTranslation:CGPointZero inView:self];
}

@end
