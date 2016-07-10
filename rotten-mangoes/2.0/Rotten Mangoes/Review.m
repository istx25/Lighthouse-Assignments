//
//  Review.m
//  Rotten Mangoes
//
//  Created by Willow Belle on 2015-11-10.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "Review.h"

@interface Review ()

@property (nonatomic) NSString *rawFreshnessType;

@end

@implementation Review

- (instancetype)initWithCritic:(NSString *)critic publication:(NSString *)publication quote:(NSString *)quote andFreshnessType:(NSString *)rawFreshnessType {
    self = [super init];

    if (self) {
        _critic = critic;
        _publication = publication;
        _quote = quote;
        _rawFreshnessType = rawFreshnessType;

        [self configureFreshnessType];
    }

    return self;
}

- (void)configureFreshnessType {
    if ([self.rawFreshnessType isEqualToString:@"fresh"]) {
        self.freshnessType = FreshnessTypeFresh;
    }

    if ([self.rawFreshnessType isEqualToString:@"rotten"]) {
        self.freshnessType = FreshnessTypeRotten;
    }
}

@end
