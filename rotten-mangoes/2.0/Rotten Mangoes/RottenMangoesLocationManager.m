//
//  RottonMangoesLocationManager.m
//  Rotten Mangoes
//
//  Created by Willow Belle on 2015-11-10.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "RottenMangoesLocationManager.h"

static int const kLocationAgeSeconds = 10.0;
static int const kHorizontalAccuracy = 0.0;

@interface RottenMangoesLocationManager () <CLLocationManagerDelegate>

@property (nonatomic) CLLocationManager *manager;

@end

@implementation RottenMangoesLocationManager

- (void)setupLocationManager {
    if (!self.manager) {
        self.manager = [CLLocationManager new];

        [self.manager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
        [self.manager setDistanceFilter:10];
        [self.manager setDelegate:self];
        [self.manager requestWhenInUseAuthorization];

        NSLog(@"New Location Manager in [RottenMangoesLocationManager setupLocationManager]");
    }

    [self.manager startUpdatingLocation];
    NSLog(@"App has started updating to an existing location manager...");
}

- (void)startLocationManager {
    if (![CLLocationManager locationServicesEnabled]) {
        return;
    }

    switch ([CLLocationManager authorizationStatus]) {
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            break;
        case kCLAuthorizationStatusAuthorizedAlways:
            break;
        default:
            [self setupLocationManager];
            break;
    }
}

- (void)stopLocationManager {
    if (![CLLocationManager locationServicesEnabled]) {
        return;
    }

    if (!self.manager) {
        return;
    }

    [self.manager stopUpdatingLocation];
    NSLog(@"App has stopped sending updates.");
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *location = [locations objectAtIndex:locations.count - 1];

    NSLog(@"Time: %@", [NSDate date]);
    NSLog(@"Longitude: %+.6f", location.coordinate.longitude);
    NSLog(@"Latitude: %+.6f", location.coordinate.latitude);
    NSLog(@"Location Accuracy: %1.2f", location.horizontalAccuracy);
    NSLog(@"Time Interval: %f", fabs([location.timestamp timeIntervalSinceNow]));

    NSTimeInterval locationAge = -[location.timestamp timeIntervalSinceNow];

    if (kLocationAgeSeconds < locationAge) {
        NSLog(@"The locations age is %1.2f", locationAge);

        return;
    }

    if (kHorizontalAccuracy > location.horizontalAccuracy) {
        return;
    }

    if (self.currentLocation) {
        return;
    }

    if (!self.currentLocation.horizontalAccuracy >= location.horizontalAccuracy) {
        return;
    }

    self.currentLocation = location;

    if (!location.horizontalAccuracy <= self.manager.desiredAccuracy) {
        [self stopLocationManager];
    }

    [self.delegate receivedLocation];
}

@end
