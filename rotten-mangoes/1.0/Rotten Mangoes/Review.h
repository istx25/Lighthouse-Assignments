//
//  Review.h
//  Rotten Mangoes
//
//  Created by Willow Belle on 2015-11-10.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum NSUInteger {
    FreshnessTypeRotten,
    FreshnessTypeFresh
} FreshnessType;

@interface Review : NSObject

@property (nonatomic) NSString *critic;
@property (nonatomic) NSString *publication;
@property (nonatomic) NSString *quote;

@property (nonatomic) FreshnessType freshnessType;

- (instancetype)initWithCritic:(NSString *)critic publication:(NSString *)publication quote:(NSString *)quote andFreshnessType:(NSString *)rawFreshnessType;

@end
