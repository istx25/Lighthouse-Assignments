//
//  DeliveryService.h
//  PizzaRestaurant
//
//  Created by Willow Belle on 2015-10-23.
//  Copyright © 2015 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pizza.h"

@interface DeliveryService : NSObject

- (void)deliverPizza:(Pizza *)pizza;
- (NSArray *)pizzaHistory;

@end
