//
//  Pizza.m
//  PizzaRestaurant
//
//  Created by Willow Belle on 2015-10-22.
//  Copyright © 2015 Lighthouse Labs. All rights reserved.
//

#import "Pizza.h"

@implementation Pizza

- (instancetype)initWithPizzaSize:(PizzaSize)size toppings: (NSArray *)toppings {
    self = [super init];

    _size = size;
    _toppings = toppings;

    return self;
}

+ (PizzaSize)getPizzaSizeFromString:(NSString *)sizeString {

    if ([sizeString isEqualToString:@"small"]) {
        return PizzaSizeSmall;
    }

    if ([sizeString isEqualToString:@"medium"]) {
        return PizzaSizeMedium;
    }

    if ([sizeString isEqualToString:@"large"]) {
        return PizzaSizeLarge;
    }

    return PizzaSizeSmall;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Size chart: %lu, Toppings: %@", (unsigned long)self.size, self.toppings];
}

@end
