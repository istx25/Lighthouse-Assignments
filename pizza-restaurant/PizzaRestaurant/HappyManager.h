//
//  HappyManager.h
//  PizzaRestaurant
//
//  Created by Willow Belle on 2015-10-23.
//  Copyright © 2015 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KitchenDelegate.h"
#import "DeliveryService.h"
@class Kitchen;

@interface HappyManager : NSObject <KitchenDelegate>

@property (nonatomic) DeliveryService *deliveryService;

@end
