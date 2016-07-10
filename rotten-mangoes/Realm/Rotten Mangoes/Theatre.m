//
//  Theatre.m
//  Rotten Mangoes
//
//  Created by Willow Belle on 2015-11-10.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "Theatre.h"

@interface Theatre ()

@property (nonatomic) CLLocationDegrees longitude;
@property (nonatomic) CLLocationDegrees latitude;

@end

@implementation Theatre

- (instancetype)initWithTheatreName:(NSString *)name address:(NSString *)address rawLongitude:(CGFloat)rawLongitude andRawLatitude:(CGFloat)rawLatitude {
    self = [super init];

    if (self) {
        _longitude = rawLongitude;
        _latitude = rawLatitude;
        _address = address;
        _name = name;

        _coordinate = CLLocationCoordinate2DMake(_latitude, _longitude);
    }

    return self;
}

@end
