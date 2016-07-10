//
//  ViewController.m
//  FastestRPM
//
//  Created by Willow Belle on 2015-10-29.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "ViewController.h"

#define calculateAngle(angle) (((angle) * M_PI) / 180.0)

@interface ViewController () {
    CGFloat angleSpeed;
}

@property (nonatomic, weak) IBOutlet UIPanGestureRecognizer *gestureRecognizer;
@property (nonatomic, weak) IBOutlet UIImageView *speedometerImageView;
@property (nonatomic, weak) IBOutlet UIImageView *needleImageView;

@property NSUInteger speed;

- (IBAction)respondToPanGestureRecognizer:(UIPanGestureRecognizer *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
}

- (void)setupUI {
    CGFloat angle = calculateAngle(130);
    self.needleImageView.transform = CGAffineTransformMakeRotation(angle);
}

- (IBAction)respondToPanGestureRecognizer:(UIPanGestureRecognizer *)sender {
    switch (sender.state) {
        case UIGestureRecognizerStateFailed:
            return;
        case UIGestureRecognizerStateChanged:
        {
            CGPoint velocity = [self.gestureRecognizer velocityInView:self.view];
            self.speed = sqrt((velocity.x * velocity.y) + (velocity.x + velocity.y));

            NSInteger calculation = self.speed * 0.0675;
            angleSpeed = ((130 + calculation) * M_PI) / 180.0;

            if (angleSpeed > 5) {
                angleSpeed = calculateAngle(30.0);
            }

            self.needleImageView.transform = CGAffineTransformMakeRotation(angleSpeed);
        }
        case UIGestureRecognizerStateEnded:
            [NSTimer scheduledTimerWithTimeInterval:3.5 target:self selector:@selector(moveNeedleBackToZero:) userInfo:nil repeats:YES];
        default:
            break;
    }
}

- (void)moveNeedleBackToZero:(NSTimer *)sender {
    angleSpeed = calculateAngle(130);
    self.needleImageView.transform = CGAffineTransformMakeRotation(angleSpeed);
}

@end
