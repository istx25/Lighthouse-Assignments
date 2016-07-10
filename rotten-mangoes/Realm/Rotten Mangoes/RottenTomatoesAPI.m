//
//  RottenTomatoesAPI.m
//  Rotten Mangoes
//
//  Created by Willow Belle on 2015-11-10.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "RottenTomatoesAPI.h"
#import "Review.h"
#import "Movie.h"

static NSString * const kAPIKey = @"xe4xau69pxaah5tmuryvrw75";
static NSString * const kBaseURL = @"http://api.rottentomatoes.com/api/public/v1.0/lists";

@implementation RottenTomatoesAPI

+ (void)fetchMoviesFromTheatreEndpoint:(void (^)(NSArray *))completionHandler {
    NSString *combinedString = [NSString stringWithFormat:@"%@/movies/in_theaters.json?apikey=%@", kBaseURL, kAPIKey];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:combinedString]];
    NSURLSession *session = [NSURLSession sharedSession];

    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {

        if (error) {
            return;
        }

        NSError *JSONError = nil;
        NSDictionary *theatre = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&JSONError];

        NSArray *moviesFromTheater = theatre[@"movies"];
        NSMutableArray *mutableSerializedTheatreArray = [NSMutableArray array];

        for (NSDictionary *movie in moviesFromTheater) {
            NSString *title = movie[@"title"];
            NSDictionary *posters = movie[@"posters"];
            NSString *originalPosterURL = posters[@"original"];
            NSRange URLRange = [originalPosterURL rangeOfString:@"dkpu1ddg7pbsk.cloudfront.net"];
            NSString *formattedString = [NSString stringWithFormat:@"http://%@", [originalPosterURL substringFromIndex:URLRange.location]];
            NSURL *URL = [NSURL URLWithString:formattedString];

            NSDictionary *links = movie[@"links"];
            NSString *reviewsURLString = links[@"reviews"];
            NSURL *reviewsURL = [NSURL URLWithString:reviewsURLString];

            Movie *movie = [[Movie alloc] initWithTitle:title andPosterImageURL:URL];
            movie.reviewsURL = reviewsURL;

            [mutableSerializedTheatreArray addObject:movie];
        }

        completionHandler(mutableSerializedTheatreArray);
    }];
    
    [task resume];
}

+ (void)fetchReviewsForMovie:(Movie *)movie withCompletionHandler:(void (^)(NSArray *))completionHandler {
    NSString *combinedString = [NSString stringWithFormat:@"%@?apikey=%@&page_limit=3", movie.reviewsURL, kAPIKey];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:combinedString]];
    NSURLSession *session = [NSURLSession sharedSession];

    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {

        if (error) {
            return;
        }

        NSError *JSONError = nil;
        NSDictionary *baseDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&JSONError];

        NSArray *reviewsForMovie = baseDictionary[@"reviews"];
        NSMutableArray *mutableSerializedReviewsArray = [NSMutableArray array];

        for (NSDictionary *review in reviewsForMovie) {
            NSString *critic = review[@"critic"];
            NSString *publication = review[@"publication"];
            NSString *quote = review[@"quote"];
            NSString *freshness = review[@"freshness"];

            Review *review = [[Review alloc] initWithCritic:critic publication:publication quote:quote andFreshnessType:freshness];
            [mutableSerializedReviewsArray addObject:review];
        }

        completionHandler(mutableSerializedReviewsArray);
    }];
    
    [task resume];
}


@end
