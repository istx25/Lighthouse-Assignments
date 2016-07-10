//
//  ViewController.m
//  ScrollView-Images
//
//  Created by Willow Belle on 2015-11-02.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController () <UIScrollViewDelegate> {
    UIImageView *firstImageView;
    UIImageView *secondImageView;
    UIImageView *thirdImageView;
}

@property (nonatomic, weak) IBOutlet UIPageControl *pageControl;
@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // First Image
    firstImageView = [self newImageViewWithImage:[UIImage imageNamed:@"Lighthouse-in-Field"]];
    [self.scrollView addSubview:firstImageView];
    [self createTapGestureRecognizerOnImage:firstImageView withAction:@selector(imageViewTapReceived:)];

    [self constrainSizeWithItem:firstImageView toItem:self.scrollView];
    [self constrainTopAndBottomWithItem:firstImageView toItem:self.scrollView];

    NSLayoutConstraint *firstImageViewLeft = [NSLayoutConstraint constraintWithItem:firstImageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0];

    [self.scrollView addConstraint:firstImageViewLeft];

    // Second Image
    secondImageView = [self newImageViewWithImage:[UIImage imageNamed:@"Lighthouse-night"]];
    [self.scrollView addSubview:secondImageView];
    [self createTapGestureRecognizerOnImage:secondImageView withAction:@selector(imageViewTapReceived:)];

    [self constrainSizeWithItem:secondImageView toItem:self.scrollView];
    [self constrainTopAndBottomWithItem:secondImageView toItem:self.scrollView];

    NSLayoutConstraint *secondImageViewLeft = [NSLayoutConstraint constraintWithItem:secondImageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:firstImageView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0];

    [self.scrollView addConstraint:secondImageViewLeft];

    // Third Image
    thirdImageView = [self newImageViewWithImage:[UIImage imageNamed:@"Lighthouse-zoomed"]];
    [self.scrollView addSubview:thirdImageView];
    [self createTapGestureRecognizerOnImage:thirdImageView withAction:@selector(imageViewTapReceived:)];

    [self constrainSizeWithItem:thirdImageView toItem:self.scrollView];
    [self constrainTopAndBottomWithItem:thirdImageView toItem:self.scrollView];

    // Manual Autolayout
     NSLayoutConstraint *thirdImageViewLeft = [NSLayoutConstraint constraintWithItem:thirdImageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:secondImageView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0];

    NSLayoutConstraint *thirdImageViewRight = [NSLayoutConstraint constraintWithItem:thirdImageView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0];

    [self.scrollView addConstraints:@[thirdImageViewLeft, thirdImageViewRight]];
}

#pragma mark —— Responder & Data Methods
- (void)createTapGestureRecognizerOnImage:(UIImageView *)imageView withAction:(nullable SEL)action {
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:action];
    gestureRecognizer.numberOfTapsRequired = 1;
    [imageView addGestureRecognizer:gestureRecognizer];
}

- (void)imageViewTapReceived:(UITapGestureRecognizer *)sender {
    [self performSegueWithIdentifier:@"performSegueWithImage" sender:self];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSUInteger currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
    self.pageControl.currentPage = currentPage;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SecondViewController *destinationViewController = [segue destinationViewController];
    if ([segue.destinationViewController isEqual:destinationViewController]) {
        switch (self.pageControl.currentPage) {
            case 0:
                destinationViewController.image = firstImageView.image;
                break;
            case 1:
                destinationViewController.image = secondImageView.image;
                break;
            case 2:
                destinationViewController.image = thirdImageView.image;
                break;
            default:
                NSLog(@"No page found");
                break;
        }
    }
}

#pragma mark —— Convenience Methods
- (UIImageView *)newImageViewWithImage:(UIImage *)image {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [imageView setTranslatesAutoresizingMaskIntoConstraints: NO];
    [imageView setUserInteractionEnabled:YES];
    [imageView setImage:image];

    return imageView;
}

- (void)constrainSizeWithItem:(UIView *)withItem toItem:(UIView *)toItem {
    NSLayoutConstraint *imageViewWidth = [NSLayoutConstraint constraintWithItem:withItem attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:self.view.frame.size.width];

    NSLayoutConstraint *imageViewHeight = [NSLayoutConstraint constraintWithItem:withItem attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:self.view.frame.size.height];

    [toItem addConstraints:@[imageViewWidth, imageViewHeight]];
}

- (void)constrainTopAndBottomWithItem:(UIView *)withItem toItem:(UIView *)toItem {
    NSLayoutConstraint *imageViewTop = [NSLayoutConstraint constraintWithItem:withItem attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:toItem attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0];

    NSLayoutConstraint *imageViewBottom = [NSLayoutConstraint constraintWithItem:withItem attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:toItem attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];

    [toItem addConstraints:@[imageViewTop, imageViewBottom]];
}

@end