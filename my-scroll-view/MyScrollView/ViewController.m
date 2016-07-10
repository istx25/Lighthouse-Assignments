//
//  ViewController.m
//  MyScrollView
//
//  Created by Willow Belle on 2015-11-02.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "ViewController.h"
#import "MyScrollView.h"

@interface ViewController ()

@property (nonatomic) MyScrollView *mainView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.mainView = [[MyScrollView alloc] initWithFrame:self.view.frame];
    self.mainView.contentSize = CGSizeMake(self.view.frame.size.width, 775);
    [self.view addSubview:self.mainView];

    [self addNewSubviewInParent:self.mainView withBackgroundColor:[UIColor redColor] andFrame:CGRectMake(20.0, 20.0, 100.0, 100.0)];
    [self addNewSubviewInParent:self.mainView withBackgroundColor:[UIColor greenColor] andFrame:CGRectMake(150.0, 150.0, 150.0, 200.0)];
    [self addNewSubviewInParent:self.mainView withBackgroundColor:[UIColor blueColor] andFrame:CGRectMake(40.0, 400.0, 200.0, 150.0)];
    [self addNewSubviewInParent:self.mainView withBackgroundColor:[UIColor yellowColor] andFrame:CGRectMake(100.0, 600.0, 180.0, 150.0)];
}

- (void)addNewSubviewInParent:(MyScrollView *)parent withBackgroundColor:(UIColor *)color andFrame:(CGRect)frame {
    UIView *colorView = [[UIView alloc] initWithFrame:frame];
    colorView.backgroundColor = color;
    [parent addSubview:colorView];
}

@end
