//
//  LPAViewController.m
//  Autolayout
//
//  Created by Steven Masuch on 2014-07-20.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPAViewController.h"

@interface LPAViewController ()

@property (nonatomic, weak) UIButton *  squareButton;
@property (nonatomic, weak) UIButton *  portraitButton;
@property (nonatomic, weak) UIButton *  landscapeButton;

@property (nonatomic, weak) UIView *                framingView;
@property (nonatomic, weak) NSLayoutConstraint *    framingViewHeight;
@property (nonatomic, weak) NSLayoutConstraint *    framingViewWidth;

@end

@implementation LPAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *squareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [squareButton setTitle:@"Square" forState:UIControlStateNormal];
    [squareButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:squareButton];
    squareButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.squareButton = squareButton;
    
    UIButton *portraitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [portraitButton setTitle:@"Portrait" forState:UIControlStateNormal];
    [portraitButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:portraitButton];
    portraitButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.portraitButton = portraitButton;
    
    UIButton *landscapeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [landscapeButton setTitle:@"Landscape" forState:UIControlStateNormal];
    [landscapeButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landscapeButton];
    landscapeButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.landscapeButton = landscapeButton;
    
    UIView *framingView = [[UIView alloc] initWithFrame:CGRectZero];
    framingView.translatesAutoresizingMaskIntoConstraints = NO;
    framingView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:framingView];
    self.framingView = framingView;
    
    NSString *buttonsHorizontalConstraints = @"|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|";
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:buttonsHorizontalConstraints
                                                                      options:NSLayoutFormatAlignAllCenterY
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(squareButton, portraitButton, landscapeButton)]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:squareButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-50.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:framingView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:framingView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:-50.0]];
    
    NSLayoutConstraint *framingViewHeight = [NSLayoutConstraint constraintWithItem:framingView
                                                                         attribute:NSLayoutAttributeHeight
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:nil
                                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                                        multiplier:1.0
                                                                          constant:500.0];
    
    NSLayoutConstraint *framingViewWidth = [NSLayoutConstraint constraintWithItem:framingView
                                                                        attribute:NSLayoutAttributeWidth
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:500.0];
    
    [framingView addConstraint:framingViewHeight];
    [framingView addConstraint:framingViewWidth];
    
    self.framingViewHeight = framingViewHeight;
    self.framingViewWidth = framingViewWidth;

    // Set up your views and constraints here
    [self addPurpleView];
    [self addRedOrangeViews];
    [self addBlueViews];
}

- (void)addPurpleView {
    UIView *purpleView = [[UIView alloc] initWithFrame:CGRectZero];
    [purpleView setBackgroundColor: [UIColor purpleColor]];
    [purpleView setTranslatesAutoresizingMaskIntoConstraints: NO];
    [self.framingView addSubview:purpleView];

    NSLayoutConstraint *purpleViewRightMargin = [NSLayoutConstraint constraintWithItem:purpleView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeRightMargin multiplier:1.0 constant:-20.0];

    NSLayoutConstraint *purpleViewBottomMargin = [NSLayoutConstraint constraintWithItem:purpleView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant:-20.0];

    NSLayoutConstraint *purpleViewWidth = [NSLayoutConstraint constraintWithItem:purpleView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeWidth multiplier:0.61 constant:0.0];

    NSLayoutConstraint *purpleViewHeight = [NSLayoutConstraint constraintWithItem:purpleView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0];

    [self.framingView addConstraints:@[purpleViewRightMargin, purpleViewBottomMargin, purpleViewWidth, purpleViewHeight]];
}

- (void)addRedOrangeViews {
    UIView *firstOrangeView = [[UIView alloc] initWithFrame:CGRectZero];
    [firstOrangeView setBackgroundColor: [UIColor orangeColor]];
    [firstOrangeView setTranslatesAutoresizingMaskIntoConstraints: NO];
    [self.framingView addSubview:firstOrangeView];

    NSLayoutConstraint *firstOrangeViewHeight = [NSLayoutConstraint constraintWithItem:firstOrangeView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30.0];

    NSLayoutConstraint *firstOrangeViewWidth = [NSLayoutConstraint constraintWithItem:firstOrangeView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:70.0];

    [self.framingView addConstraints:@[firstOrangeViewHeight, firstOrangeViewWidth]];

    UIView *secondOrangeView = [[UIView alloc] initWithFrame:CGRectZero];
    [secondOrangeView setBackgroundColor: [UIColor orangeColor]];
    [secondOrangeView setTranslatesAutoresizingMaskIntoConstraints: NO];
    [self.framingView addSubview:secondOrangeView];

    NSLayoutConstraint *secondOrangeViewLeftMargin = [NSLayoutConstraint constraintWithItem:secondOrangeView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:firstOrangeView attribute:NSLayoutAttributeRight multiplier:1.0 constant:8.0];

    NSLayoutConstraint *secondOrangeViewBottomMargin = [NSLayoutConstraint constraintWithItem:secondOrangeView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:firstOrangeView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0];

    NSLayoutConstraint *secondOrangeViewHeight = [NSLayoutConstraint constraintWithItem:secondOrangeView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30.0];

    NSLayoutConstraint *secondOrangeViewWidth = [NSLayoutConstraint constraintWithItem:secondOrangeView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0];

    [self.framingView addConstraints:@[secondOrangeViewLeftMargin, secondOrangeViewBottomMargin, secondOrangeViewHeight, secondOrangeViewWidth]];

    UIView *redView = [[UIView alloc] initWithFrame:CGRectZero];
    [redView setBackgroundColor: [UIColor redColor]];
    [redView setTranslatesAutoresizingMaskIntoConstraints: NO];
    [self.framingView insertSubview:redView belowSubview:firstOrangeView];

    NSLayoutConstraint *redViewRightMargin = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeRightMargin multiplier:1.0 constant:-20.0];

    NSLayoutConstraint *redViewBottomMargin = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant:20.0];

    [self.framingView addConstraints:@[redViewRightMargin, redViewBottomMargin]];

    NSLayoutConstraint *orangeViewTop = [NSLayoutConstraint constraintWithItem:firstOrangeView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:redView attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant:0.0];

    NSLayoutConstraint *orangeViewBottom = [NSLayoutConstraint constraintWithItem:firstOrangeView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:redView attribute:NSLayoutAttributeBottomMargin multiplier:1.0 constant:0.0];

    NSLayoutConstraint *orangeViewLeft = [NSLayoutConstraint constraintWithItem:firstOrangeView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:redView attribute:NSLayoutAttributeLeftMargin multiplier:1.0 constant:0.0];

    NSLayoutConstraint *orangeViewRight = [NSLayoutConstraint constraintWithItem:secondOrangeView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:redView attribute:NSLayoutAttributeRightMargin multiplier:1.0 constant:0.0];

    [self.framingView addConstraints:@[orangeViewTop, orangeViewBottom, orangeViewLeft, orangeViewRight]];
}

- (void)addBlueViews {
    UIView *middleBlueView = [[UIView alloc] initWithFrame:CGRectZero];
    [middleBlueView setBackgroundColor: [UIColor blueColor]];
    [middleBlueView setTranslatesAutoresizingMaskIntoConstraints: NO];
    [self.framingView addSubview:middleBlueView];

    NSLayoutConstraint *middleBlueViewCenterX = [NSLayoutConstraint constraintWithItem:middleBlueView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];

    NSLayoutConstraint *middleBlueViewCenterY = [NSLayoutConstraint constraintWithItem:middleBlueView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];

    NSLayoutConstraint *middleBlueViewHeight = [NSLayoutConstraint constraintWithItem:middleBlueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0];

    NSLayoutConstraint *middleBlueViewWidth = [NSLayoutConstraint constraintWithItem:middleBlueView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0];

    [self.framingView addConstraints:@[middleBlueViewCenterX, middleBlueViewCenterY, middleBlueViewHeight, middleBlueViewWidth]];

    UIView *topBlueView = [[UIView alloc] initWithFrame:CGRectZero];
    [topBlueView setBackgroundColor: [UIColor blueColor]];
    [topBlueView setTranslatesAutoresizingMaskIntoConstraints: NO];
    [self.framingView addSubview:topBlueView];

    NSLayoutConstraint *topBlueViewCenterX = [NSLayoutConstraint constraintWithItem:topBlueView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];

    NSLayoutConstraint *topBlueViewCenterY = [NSLayoutConstraint constraintWithItem:topBlueView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeCenterY multiplier:0.5 constant:0.0];

    NSLayoutConstraint *topBlueViewHeight = [NSLayoutConstraint constraintWithItem:topBlueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0];

    NSLayoutConstraint *topBlueViewWidth = [NSLayoutConstraint constraintWithItem:topBlueView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0];

    [self.framingView addConstraints:@[topBlueViewCenterX, topBlueViewCenterY, topBlueViewHeight, topBlueViewWidth]];

    UIView *bottomBlueView = [[UIView alloc] initWithFrame:CGRectZero];
    [bottomBlueView setBackgroundColor: [UIColor blueColor]];
    [bottomBlueView setTranslatesAutoresizingMaskIntoConstraints: NO];
    [self.framingView addSubview:bottomBlueView];

    NSLayoutConstraint *bottomBlueViewCenterX = [NSLayoutConstraint constraintWithItem:bottomBlueView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];

    NSLayoutConstraint *bottomBlueViewCenterY = [NSLayoutConstraint constraintWithItem:bottomBlueView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeCenterY multiplier:1.5 constant:0.0];

    NSLayoutConstraint *bottomBlueViewHeight = [NSLayoutConstraint constraintWithItem:bottomBlueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0];

    NSLayoutConstraint *bottomBlueViewWidth = [NSLayoutConstraint constraintWithItem:bottomBlueView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0];

    [self.framingView addConstraints:@[bottomBlueViewCenterX, bottomBlueViewCenterY, bottomBlueViewHeight, bottomBlueViewWidth]];
}


- (void)resizeFramingView:(id)sender
{
    CGFloat newWidth = 0.0;
    CGFloat newHeight = 0.0;
    
    if (sender == self.squareButton) {
        newWidth = 500.0;
        newHeight = 500.0;
    } else if (sender == self.portraitButton) {
        newWidth = 350.0;
        newHeight = 550.0;
    } else if (sender == self.landscapeButton) {
        newWidth = 900.0;
        newHeight = 300.0;
    }
    
    [UIView animateWithDuration:2.0 animations:^(){
        self.framingViewHeight.constant = newHeight;
        self.framingViewWidth.constant = newWidth;
        [self.view layoutIfNeeded];
    }];
}

@end
