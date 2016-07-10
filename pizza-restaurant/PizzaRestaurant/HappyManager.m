//
//  HappyManager.m
//  PizzaRestaurant
//
//  Created by Willow Belle on 2015-10-23.
//  Copyright © 2015 Lighthouse Labs. All rights reserved.
//

#import "HappyManager.h"

@implementation HappyManager

- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings {
    return YES;
}

- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen {
    return YES;
}

- (void)kitchenDidMakePizza:(Pizza *)pizza {
    NSLog(@"You are fantastic! Thanks for coming in. :)");
    [self.deliveryService deliverPizza:pizza];
}

@end
