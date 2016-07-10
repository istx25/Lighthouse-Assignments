//
//  SecondViewController.m
//  ScrollView-Images
//
//  Created by Willow Belle on 2015-11-02.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController () <UIScrollViewDelegate>

@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic) UIImageView *standardImageView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.scrollView setMinimumZoomScale:1.0];
    [self.scrollView setMaximumZoomScale:4.0];

    self.standardImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.standardImageView setTranslatesAutoresizingMaskIntoConstraints: NO];
    [self.standardImageView setImage:self.image];
//    [self.scrollView addSubview:self.standardImageView];

    // Autolayout
    NSLayoutConstraint *standardImageViewTop = [NSLayoutConstraint constraintWithItem:self.standardImageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0];

    NSLayoutConstraint *standardImageViewBottom = [NSLayoutConstraint constraintWithItem:self.standardImageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];

    NSLayoutConstraint *standardImageViewLeft = [NSLayoutConstraint constraintWithItem:self.standardImageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0];

    NSLayoutConstraint *standardImageViewRight = [NSLayoutConstraint constraintWithItem:self.standardImageView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0];

    [self.view addConstraints:@[standardImageViewLeft, standardImageViewTop, standardImageViewBottom, standardImageViewRight]];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.standardImageView;
}

@end
