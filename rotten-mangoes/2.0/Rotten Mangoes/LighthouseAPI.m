//
//  LighthouseAPI.m
//  Rotten Mangoes
//
//  Created by Willow Belle on 2015-11-10.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "LighthouseAPI.h"
#import "Movie.h"
#import "Theatre.h"

static NSString * const kBaseURL = @"http://lighthouse-movie-showtimes.herokuapp.com/";

///

@implementation LighthouseAPI

+ (void)fetchTheatresWithAddress:(NSString *)address andMovie:(Movie *)movie withCompletionHandler:(void (^)(NSArray *))completionHandler {
    NSString *combinedString = [NSString stringWithFormat:@"%@/theatres.json?address=%@&movie=%@", kBaseURL, address, movie.title];
    NSString *combinedEncodedString = [combinedString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:combinedEncodedString]];
    NSURLSession *session = [NSURLSession sharedSession];

    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            return;
        }

        NSError *JSONError = nil;
        NSDictionary *base = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&JSONError];
        NSArray *theatres = base[@"theatres"];
        NSMutableArray *mutableSerializedTheatresArray = [NSMutableArray array];

        for (NSDictionary *theatre in theatres) {
            NSString *name = theatre[@"name"];
            NSString *address = theatre[@"address"];

            NSString *longitudeString = theatre[@"lng"];
            NSString *latitudeString = theatre[@"lat"];

            CGFloat longitude = [longitudeString doubleValue];
            CGFloat latitude = [latitudeString doubleValue];

            Theatre *theatre = [[Theatre alloc] initWithTheatreName:name address:address rawLongitude:longitude andRawLatitude:latitude];
            [mutableSerializedTheatresArray addObject:theatre];
        }

        completionHandler(mutableSerializedTheatresArray);
    }];
    
    [task resume];
}

@end
