//
//  LPGViewController.m
//  Phonagotchi
//
//  Created by Steven Masuch on 2014-07-26.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPGViewController.h"
#import "LPGCat.h"

@interface LPGViewController () {
    CGFloat velocity;
}

@property (nonatomic, weak) IBOutlet UIImageView *basketImageView;
@property (nonatomic, weak) IBOutlet UIImageView *appleImageView;
@property (nonatomic, weak) IBOutlet UILabel *restfulnessLabel;
@property (nonatomic, weak) IBOutlet UILabel *sleepLabel;
@property (nonatomic, weak) IBOutlet UILabel *statusLabel;

@property (nonatomic) UIImageView *dragAppleImageView;
@property (nonatomic) UIImageView *petImageView;
@property (nonatomic) LPGCat *cat;

@end

@implementation LPGViewController

#pragma mark — Controller Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];

    _cat = [LPGCat new];

    [self.view setBackgroundColor:[UIColor colorWithRed:(252.0/255.0) green:(240.0/255.0) blue:(228.0/255.0) alpha:1.0]];
    [self setupPetImageView];
    [self setupCat];
}

#pragma mark — Setup UI
- (void)setupPetImageView {
    self.petImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.petImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.petImageView setUserInteractionEnabled:YES];
    [self.petImageView setImage:[UIImage imageNamed:@"default"]];
    [self.view addSubview:self.petImageView];

    NSLayoutConstraint *petImageViewCenterX = [NSLayoutConstraint constraintWithItem:self.petImageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];

    NSLayoutConstraint *petImageViewCenterY = [NSLayoutConstraint constraintWithItem:self.petImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];

    [self.view addConstraints:@[petImageViewCenterX, petImageViewCenterY]];

    UIPanGestureRecognizer *gestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(petCat:)];
    [self.petImageView addGestureRecognizer:gestureRecognizer];
}

- (void)setupCat {
    self.sleepLabel.text = [NSString stringWithFormat:@"Sleep time: %i", self.cat.sleep];
    self.restfulnessLabel.text = [NSString stringWithFormat:@"Restfulness: %i", self.cat.restfulness];
    self.statusLabel.text = [NSString stringWithFormat:@"Status: %@", self.cat.status];
    [self.cat startTimer];

    [self.cat addObserver:self forKeyPath:@"sleep" options:0 context:NULL];
    [self.cat addObserver:self forKeyPath:@"restfulness" options:0 context:NULL];
    [self.cat addObserver:self forKeyPath:@"status" options:0 context:NULL];
}

#pragma mark — KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"sleep"]) {
        self.sleepLabel.text = [NSString stringWithFormat:@"Sleep time: %i", self.cat.sleep];
    }

    if ([keyPath isEqualToString:@"restfulness"]) {
        self.restfulnessLabel.text = [NSString stringWithFormat:@"Restfulness: %i", self.cat.restfulness];
    }

    if ([keyPath isEqualToString:@"status"]) {
        self.statusLabel.text = [NSString stringWithFormat:@"Status: %@", self.cat.status];
    }
}

#pragma mark — Cat
- (void)petCat:(id)sender {
    CGPoint component = [sender velocityInView:self.view];
    velocity = sqrt((component.x * component.y) + (component.x + component.y));
    [self.cat handlePet:velocity];

    if (self.cat.isGrumpy) {
        [self.petImageView setImage:[UIImage imageNamed:@"grumpy"]];
        [self.statusLabel setText:@"Status: Grumpy"];
    }

    if (!self.cat.isGrumpy) {
        [self.petImageView setImage:[UIImage imageNamed:@"default"]];
        [self.statusLabel setText:@"Status: Happy"];
    }
}

#pragma mark — Food/Responder Chain
- (IBAction)pinchApple:(UIPinchGestureRecognizer *)sender {
    if (self.dragAppleImageView) {
        return;
    }

    self.dragAppleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"apple"]];
    [self.dragAppleImageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:self.dragAppleImageView];

    CGPoint location = [sender locationInView:self.view];
    CGRect appleFrame = CGRectMake(location.x - 25.0, location.y - 25, 50.0, 50.0);
    [self.dragAppleImageView setFrame:appleFrame];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (!self.dragAppleImageView) {
        return;
    }

    UITouch *touch = [touches anyObject];
    CGPoint position = [touch locationInView:self.view.superview];
    self.dragAppleImageView.center = CGPointMake(position.x, position.y);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (!self.dragAppleImageView) {
        return;
    }

    if (CGRectIntersectsRect(self.petImageView.frame, self.dragAppleImageView.frame)) {
        [self.statusLabel setText:@"Status: Ate Apple"];
        [self.dragAppleImageView removeFromSuperview];

        self.dragAppleImageView = nil;
    }

    if (!CGRectIntersectsRect(self.petImageView.frame, self.dragAppleImageView.frame)) {
        [UIView animateWithDuration:3.0 animations:^{
            [self.dragAppleImageView setCenter:CGPointMake(self.dragAppleImageView.center.x, self.view.bounds.size.height)];
        } completion:^(BOOL finished) {
            [self.dragAppleImageView removeFromSuperview];
            self.dragAppleImageView = nil;
        }];
    }
}

@end
