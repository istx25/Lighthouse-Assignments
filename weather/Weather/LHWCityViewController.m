//
//  LHWCityViewController.m
//  Weather
//
//  Created by Willow Belle on 2015-10-28.
//  Copyright © 2015 Lighthouse Labs. All rights reserved.
//

#import "LHWCityViewController.h"
#import "LHWDetailedViewController.h"

@implementation LHWCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor lightGrayColor]];

    [self addWeatherImage];
    [self addTemperatureLabel];
    [self addPrecipitationRateLabel];
    [self addDetailButton];
}

- (void)addWeatherImage {
    UIImageView *weatherImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [weatherImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [weatherImageView setImage:[LHWCity imageWithWeatherType:self.city.weather]];
    [self.view addSubview:weatherImageView];

    NSLayoutConstraint *weatherImageViewHeight = [NSLayoutConstraint constraintWithItem:weatherImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100.0];

    NSLayoutConstraint *weatherImageViewWidth = [NSLayoutConstraint constraintWithItem:weatherImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100.0];

    NSLayoutConstraint *weatherImageViewCenterX = [NSLayoutConstraint constraintWithItem:weatherImageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];

    NSLayoutConstraint *weatherImageViewCenterY = [NSLayoutConstraint constraintWithItem:weatherImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.5 constant:0.0];

    [self.view addConstraints:@[weatherImageViewHeight, weatherImageViewWidth, weatherImageViewCenterX, weatherImageViewCenterY]];
}

- (void)addTemperatureLabel {
    UILabel *temperatureLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [temperatureLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    temperatureLabel.text = [NSString stringWithFormat:@"Temperature is: %i", [self.city.temperature intValue]];
    [self.view addSubview:temperatureLabel];

    NSLayoutConstraint *temperatureLabelCenterX = [NSLayoutConstraint constraintWithItem:temperatureLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];

    NSLayoutConstraint *temperatureLabelCenterY = [NSLayoutConstraint constraintWithItem:temperatureLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];

    [self.view addConstraints:@[temperatureLabelCenterX, temperatureLabelCenterY]];
}

- (void)addPrecipitationRateLabel {
    UILabel *precipitationRateLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [precipitationRateLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    precipitationRateLabel.text = [NSString stringWithFormat:@"Precipitation Rate: %i", [self.city.precipitationRate intValue]];
    [self.view addSubview:precipitationRateLabel];

    NSLayoutConstraint *precipitationRateLabelCenterX = [NSLayoutConstraint constraintWithItem:precipitationRateLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];

    NSLayoutConstraint *precipitationRateLabelCenterY = [NSLayoutConstraint constraintWithItem:precipitationRateLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.25 constant:0.0];

    [self.view addConstraints:@[precipitationRateLabelCenterX, precipitationRateLabelCenterY]];
}

- (void)addDetailButton {
    UIButton *detailButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [detailButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [detailButton setFrame:CGRectZero];
    [detailButton setTitle:@"Go to Detail" forState:UIControlStateNormal];
    [detailButton addTarget:self action:@selector(detailButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:detailButton];

    NSLayoutConstraint *detailButtonCenterX = [NSLayoutConstraint constraintWithItem:detailButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];

    NSLayoutConstraint *detailButtonCenterY = [NSLayoutConstraint constraintWithItem:detailButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.50 constant:0.0];

    [self.view addConstraints:@[detailButtonCenterX, detailButtonCenterY]];
}

//#pragma mark - Navigation
- (void)detailButtonPressed {
    LHWDetailedViewController *detailedViewController = [LHWDetailedViewController new];
    detailedViewController.city = self.city;

    [self.navigationController pushViewController:detailedViewController animated:YES];
}

@end