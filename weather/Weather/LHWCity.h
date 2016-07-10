//
//  LHWCity.h
//  Weather
//
//  Created by Willow Belle on 2015-10-28.
//  Copyright © 2015 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum: NSUInteger {
    WeatherTypeDefault,
    WeatherTypeClearDay,
    WeatherTypeClearNight,
    WeatherTypeCloudy,
    WeatherTypeCloudyNight,
    WeatherTypeRain,
    WeatherTypeSleet,
    WeatherTypeSnow,
    WeatherTypeSunny,
    WeatherTypeWindy
} WeatherType;

@interface LHWCity : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSNumber *temperature;
@property (nonatomic) NSNumber *precipitationRate;
@property WeatherType weather;

- (instancetype)initWithName:(NSString *)name precipitationRate:(NSNumber *)precipitationRate weatherType:(WeatherType)weatherType andTemperature:(NSNumber *)temperature;
+ (UIImage *)imageWithWeatherType:(WeatherType)weatherType;

@end
