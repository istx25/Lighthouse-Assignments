//
//  Pizza.h
//  PizzaRestaurant
//
//  Created by Willow Belle on 2015-10-22.
//  Copyright © 2015 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum: NSUInteger {
    PizzaSizeSmall,
    PizzaSizeMedium,
    PizzaSizeLarge,
} PizzaSize;

@interface Pizza : NSObject

@property (nonatomic) PizzaSize size;
@property (nonatomic) NSArray *toppings;

- (instancetype)initWithPizzaSize:(PizzaSize)size toppings: (NSArray *)toppings;
+ (PizzaSize)getPizzaSizeFromString:(NSString *)sizeString;


@end
