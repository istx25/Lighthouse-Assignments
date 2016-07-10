//
//  DeliveryService.m
//  PizzaRestaurant
//
//  Created by Willow Belle on 2015-10-23.
//  Copyright © 2015 Lighthouse Labs. All rights reserved.
//

#import "DeliveryService.h"
#import "DeliveryCar.h"

@interface DeliveryService ()

@property (nonatomic) NSMutableArray *pizzaDescriptions;
@property (nonatomic) DeliveryCar *car;

@end

@implementation DeliveryService

- (instancetype)init {
    self = [super init];
    if (self) {
        _car = [DeliveryCar new];
        _pizzaDescriptions = [NSMutableArray new];
    }

    return self;
}

- (void)deliverPizza:(Pizza *)pizza {
    [self.pizzaDescriptions addObject: pizza.description];
    [self.car deliverPizza:pizza];
}

- (NSArray *)pizzaHistory {
    return self.pizzaDescriptions;
}

@end
