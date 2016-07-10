//
//  MovieMapViewController.m
//  Rotten Mangoes
//
//  Created by Willow Belle on 2015-11-10.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "MovieMapViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "RottenMangoesLocationManager.h"
#import "LighthouseAPI.h"
#import "Theatre.h"

static int const kMapZoomValue = 2100;

@interface MovieMapViewController () <RottenMangoesLocationManagerDelegate> {
    BOOL _loadedWithVenues;
}

@property (nonatomic, weak) IBOutlet MKMapView *mapView;
@property (nonatomic) RottenMangoesLocationManager *locationManager;

@end

@implementation MovieMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.locationManager = [RottenMangoesLocationManager new];
    [self.mapView setShowsUserLocation:YES];
    [self.locationManager setupLocationManager];
    [self.locationManager setDelegate:self];

    _loadedWithVenues = NO;
}

- (void)receivedLocation {
    [self createMap];
}

- (void)createMap {
    CLLocationCoordinate2D coordinate = self.locationManager.currentLocation.coordinate;
    CLLocationCoordinate2D zoomLocation = coordinate;
    MKCoordinateRegion adjustedRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, kMapZoomValue, kMapZoomValue);

    [self.mapView setRegion:adjustedRegion animated:YES];

    CLGeocoder *geocoder = [CLGeocoder new];
    CLLocation *location = [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> *placemarks, NSError *error) {
        NSArray *placeArray = placemarks;
        CLPlacemark *placemark = placeArray[0];

        [LighthouseAPI fetchTheatresWithAddress:placemark.postalCode andMovie:self.movie withCompletionHandler:^(NSArray *theatresArray) {
            for (Theatre *theatre in theatresArray){
                dispatch_async(dispatch_get_main_queue(), ^(){
                    [self.mapView addAnnotation:theatre];
                });
            }
        }];
    }];
}

@end
