//
//  Theatre.h
//  Rotten Mangoes
//
//  Created by Willow Belle on 2015-11-10.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface Theatre : NSObject <MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *address;

- (instancetype)initWithTheatreName:(NSString *)name address:(NSString *)address rawLongitude:(CGFloat)rawLongitude andRawLatitude:(CGFloat)rawLatitude;

@end
