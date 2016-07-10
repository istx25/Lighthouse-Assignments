//
//  Manager.m
//  PizzaRestaurant
//
//  Created by Willow Belle on 2015-10-23.
//  Copyright © 2015 Lighthouse Labs. All rights reserved.
//

#import "AngryManager.h"

@implementation AngryManager

- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings {
    
    if ([toppings containsObject:@"anchovies"]) {
        NSLog(@"Ew. I don't make pizzas with anchovies on them. Get out!");
        
        return NO;
    }

    return YES;
}

- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen {
    return NO;
}

@end
