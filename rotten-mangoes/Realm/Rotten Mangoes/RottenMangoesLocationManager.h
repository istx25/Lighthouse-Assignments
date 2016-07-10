//
//  RottonMangoesLocationManager.h
//  Rotten Mangoes
//
//  Created by Willow Belle on 2015-11-10.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>

@protocol RottenMangoesLocationManagerDelegate <NSObject>

- (void)receivedLocation;

@end

@interface RottenMangoesLocationManager : NSObject

@property (nonatomic) CLLocation *currentLocation;
@property (nonatomic, weak) id<RottenMangoesLocationManagerDelegate> delegate;


- (void)setupLocationManager;
- (void)startLocationManager;
- (void)stopLocationManager;

@end
