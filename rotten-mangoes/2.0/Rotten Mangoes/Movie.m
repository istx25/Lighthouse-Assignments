//
//  Movie.m
//  Rotten Mangoes
//
//  Created by Willow Belle on 2015-11-09.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (instancetype)initWithTitle:(NSString *)title andPosterImageURL:(NSURL *)posterImageURL {
    self = [super init];

    if (self) {
        _title = title;
        _posterImageURL = posterImageURL;
    }

    return self;
}

@end
