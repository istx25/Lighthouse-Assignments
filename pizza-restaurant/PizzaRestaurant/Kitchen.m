//
//  Kitchen.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "Kitchen.h"

@implementation Kitchen

- (Pizza *)makePizzaWithSize:(PizzaSize)size toppings:(NSArray *)toppings {
    if (self.delegate) {
        if (![self.delegate kitchen:self shouldMakePizzaOfSize:size andToppings:toppings]) {
            return nil;
        }

        Pizza *pizza;

        if (![self.delegate kitchenShouldUpgradeOrder:self]) {
            pizza = [[Pizza alloc] initWithPizzaSize:size toppings:toppings];

            if ([self.delegate respondsToSelector:@selector(kitchenDidMakePizza:)]) {
                [self.delegate kitchenDidMakePizza:pizza];
            }

            return pizza;
        }

        pizza = [[Pizza alloc] initWithPizzaSize:PizzaSizeLarge toppings:toppings];

        if ([self.delegate respondsToSelector:@selector(kitchenDidMakePizza:)]) {
            [self.delegate kitchenDidMakePizza:pizza];
        }

        return pizza;
    }

    return nil;
}

@end
