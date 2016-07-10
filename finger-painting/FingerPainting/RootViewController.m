//
//  ViewController.m
//  FingerPainting
//
//  Created by Willow Belle on 2015-10-30.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "RootViewController.h"
#import "ForcePanGestureRecognizer.h"
#import "FingerPaintingView.h"
#import "FingerBezierPath.h"

@interface RootViewController () <FingerPaintingDataSource>

@property (nonatomic, weak) IBOutlet UISegmentedControl *colorControl;
@property (nonatomic, weak) IBOutlet FingerPaintingView *fingerPaintingView;
@property (nonatomic) FingerBezierPath *bezierPath;
@property (nonatomic) NSMutableArray *fingerBezierPathArray;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _fingerBezierPathArray = [NSMutableArray new];
    self.bezierPath = [FingerBezierPath new];
    self.fingerPaintingView.delegate = self;
}

- (UIColor *)currentColor {
    switch (self.colorControl.selectedSegmentIndex) {
        case 0:
            return [UIColor blackColor];
        case 1:
            return [UIColor blueColor];
        case 2:
            return [UIColor greenColor];
        case 3:
            return [UIColor redColor];
        case 4:
            return [UIColor whiteColor];
        default:
            break;
    }

    return [UIColor blackColor];
}

- (IBAction)colorControlSegmentSelected:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.bezierPath.strokeColor = [UIColor blackColor];
            break;
        case 1:
            self.bezierPath.strokeColor = [UIColor blueColor];
            break;
        case 2:
            self.bezierPath.strokeColor = [UIColor greenColor];
            break;
        case 3:
            self.bezierPath.strokeColor = [UIColor redColor];
            break;
        case 4:
            self.bezierPath.strokeColor = [UIColor whiteColor];
            break;
        default:
            break;
    }
}

- (IBAction)panGesture:(ForcePanGestureRecognizer *)sender {
    CGPoint location = [sender locationInView:sender.view];
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            [self.bezierPath moveToPoint:location];
            [self.fingerBezierPathArray addObject:self.bezierPath];
            break;
        case UIGestureRecognizerStateChanged:
            [self.bezierPath addLineToPoint:location];
            self.bezierPath.lineWidth = sender.touchForce * 10;

            if ([self.bezierPath.strokeColor isEqual:[UIColor whiteColor]]) {
                self.bezierPath.lineWidth = 20;
            }

            break;
        case UIGestureRecognizerStateEnded:
            self.bezierPath = [FingerBezierPath new];
            self.bezierPath.strokeColor = [self currentColor];
            break;
        default:
            break;
    }

    [self.fingerPaintingView setNeedsDisplay];
}

- (NSMutableArray *)pathsForDrawing {
    return self.fingerBezierPathArray;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        [[self pathsForDrawing] removeAllObjects];
        [self.fingerPaintingView setNeedsDisplay];
    }
}

@end
