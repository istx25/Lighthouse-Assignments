//
//  LHWCity.m
//  Weather
//
//  Created by Willow Belle on 2015-10-28.
//  Copyright © 2015 Lighthouse Labs. All rights reserved.
//

#import "LHWCity.h"

@implementation LHWCity

- (instancetype)initWithName:(NSString *)name precipitationRate:(NSNumber *)precipitationRate weatherType:(WeatherType)weatherType andTemperature:(NSNumber *)temperature; {
    self = [super init];

    if (self) {
        _name = name;
        _temperature = temperature;
        _precipitationRate = precipitationRate;
        _weather = weatherType;
    }

    return self;
}

+ (UIImage *)imageWithWeatherType:(WeatherType)weatherType {
    switch (weatherType) {
        case WeatherTypeClearDay:
            return [UIImage imageNamed:@"clear-day.png"];
        case WeatherTypeClearNight:
            return [UIImage imageNamed:@"clear-night.png"];
        case WeatherTypeCloudy:
            return [UIImage imageNamed:@"cloudy.png"];
        case WeatherTypeCloudyNight:
            return [UIImage imageNamed:@"cloudy-night.png"];
        case WeatherTypeRain:
            return [UIImage imageNamed:@"rain.png"];
        case WeatherTypeSleet:
            return [UIImage imageNamed:@"sleet.png"];
        case WeatherTypeSnow:
            return [UIImage imageNamed:@"snow.png"];
        case WeatherTypeSunny:
            return [UIImage imageNamed:@"sunny.png"];
        case WeatherTypeWindy:
            return [UIImage imageNamed:@"wind.png"];
        default:
            return [UIImage imageNamed:@"default.png"];
    }
}

@end
