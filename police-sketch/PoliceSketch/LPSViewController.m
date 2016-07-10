//
//  LPSViewController.m
//  PoliceSketch
//
//  Created by Steven Masuch on 2014-07-20.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPSViewController.h"
#import "LPSState.h"

@interface LPSViewController ()

@property (nonatomic) LPSState *state;

@end

@implementation LPSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _state = [LPSState new];
}

- (IBAction)rotateEyesForward:(UIButton *)sender {
    UIImage *eyes = [self.state rotateForwardInStateArray:self.state.eyes withIndex:self.state.eyesIndex];
    self.eyesImageView.image = eyes;
}

- (IBAction)rotateEyesBackward:(UIButton *)sender {
    UIImage *eyes = [self.state rotateBackwardInStateArray:self.state.eyes withIndex:self.state.eyesIndex];
    self.eyesImageView.image = eyes;
}

- (IBAction)rotateNoseForward:(UIButton *)sender {
    UIImage *nose = [self.state rotateForwardInStateArray:self.state.noses withIndex:self.state.nosesIndex];
    self.noseImageView.image = nose;
}

- (IBAction)rotateNoseBackward:(UIButton *)sender {
    UIImage *nose = [self.state rotateBackwardInStateArray:self.state.noses withIndex:self.state.nosesIndex];
    self.noseImageView.image = nose;
}

- (IBAction)rotateMouthForward:(UIButton *)sender {
    UIImage *mouth = [self.state rotateForwardInStateArray:self.state.mouths withIndex:self.state.mouthsIndex];
    self.mouthImageView.image = mouth;
}

- (IBAction)rotateMouthBackward:(UIButton *)sender {
    UIImage *mouth = [self.state rotateBackwardInStateArray:self.state.mouths withIndex:self.state.mouthsIndex];
    self.mouthImageView.image = mouth;
}

@end
