//
//  LHWAppDelegate.m
//  Weather
//
//  Created by Steven Masuch on 2014-07-30.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LHWAppDelegate.h"
#import "LHWCityViewController.h"
#import "LHWCity.h"

@implementation LHWAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [UIWindow new];
    UITabBarController *tabBarController = [UITabBarController new];

    LHWCityViewController *vancouverViewController = [LHWCityViewController new];
    UINavigationController *vancouverNavigationController = [[UINavigationController alloc] initWithRootViewController:vancouverViewController];
    vancouverViewController.title = @"Vancouver";
    vancouverViewController.city = [[LHWCity alloc] initWithName:@"Vancouver" precipitationRate:[NSNumber numberWithFloat:0.75] weatherType:WeatherTypeCloudy andTemperature:[NSNumber numberWithInt:29]];

    LHWCityViewController *seattleViewController = [LHWCityViewController new];
    UINavigationController *seattleNavigationController = [[UINavigationController alloc] initWithRootViewController:seattleViewController];
    seattleViewController.title = @"Seattle";
    seattleViewController.city = [[LHWCity alloc] initWithName:@"Seattle" precipitationRate:[NSNumber numberWithFloat:0.53] weatherType:WeatherTypeSleet andTemperature:[NSNumber numberWithInt:13]];

    LHWCityViewController *londonViewController = [LHWCityViewController new];
    UINavigationController *londonNavigationController = [[UINavigationController alloc] initWithRootViewController:londonViewController];
    londonViewController.title = @"London";
    londonViewController.city = [[LHWCity alloc] initWithName:@"London" precipitationRate:[NSNumber numberWithFloat:100.0] weatherType:WeatherTypeRain andTemperature:[NSNumber numberWithInt:4]];

    LHWCityViewController *berlinViewController = [LHWCityViewController new];
    UINavigationController *berlinNavigationController = [[UINavigationController alloc] initWithRootViewController:berlinViewController];
    berlinViewController.title = @"Berlin";
    berlinViewController.city = [[LHWCity alloc] initWithName:@"Berlin" precipitationRate:[NSNumber numberWithFloat:0.0] weatherType:WeatherTypeSunny andTemperature:[NSNumber numberWithInt:40]];

    LHWCityViewController *tokyoViewController = [LHWCityViewController new];
    UINavigationController *tokyoNavigationController = [[UINavigationController alloc] initWithRootViewController:tokyoViewController];
    tokyoViewController.title = @"Tokyo";
    tokyoViewController.city = [[LHWCity alloc] initWithName:@"Tokyo" precipitationRate:[NSNumber numberWithFloat:0.33] weatherType:WeatherTypeSnow andTemperature:[NSNumber numberWithInt:18]];

    tabBarController.viewControllers = @[vancouverNavigationController, seattleNavigationController, londonNavigationController,
                                         berlinNavigationController, tokyoNavigationController];

    [self.window setRootViewController:tabBarController];
    [self.window addSubview:tabBarController.view];
    [self.window makeKeyAndVisible];

    return YES;
}

@end
