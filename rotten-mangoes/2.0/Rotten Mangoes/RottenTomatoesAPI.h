//
//  RottenTomatoesAPI.h
//  Rotten Mangoes
//
//  Created by Willow Belle on 2015-11-10.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Movie;

@interface RottenTomatoesAPI : NSObject

+ (void)fetchMoviesFromTheatreEndpoint:(void (^)(NSArray *serializedTheatreArray))completionHandler;
+ (void)fetchReviewsForMovie:(Movie *)movie withCompletionHandler: (void (^)(NSArray *serializedReviewsArray))completionHandler;


@end
