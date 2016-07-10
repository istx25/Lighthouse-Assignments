//
//  main.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Kitchen.h"
#import "Pizza.h"

#import "AngryManager.h"
#import "HappyManager.h"
#import "DeliveryService.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        InputCollector *collector = [InputCollector new];
        Kitchen *restaurantKitchen = [Kitchen new];

        AngryManager *angryManager = [AngryManager new];
        HappyManager *happyManager = [HappyManager new];

        DeliveryService *deliveryService = [DeliveryService new];
        happyManager.deliveryService = deliveryService;

        while (YES) {
            NSString *prompt = @"\nWelcome to Pizza Restaurant! \n* pick - Pick your pizza size and toppings. \n* delivery - Information about previous deliveries \n* leave - Exit program. \n";
            NSString *input = [collector inputForPrompt:prompt];

            if ([input isEqualToString:@"leave"] | [input isEqualToString:@"exit"]) {
                NSLog(@"Thanks for visiting Pizza Restaurant. Come again! :)");

                return 0;
            }

            if ([input isEqualToString:@"delivery"]) {
                NSLog(@"Here are all of our previous deliveries!");
                NSLog(@"%@", deliveryService.pizzaHistory);
            }

            if ([input isEqualToString:@"pick"]) {
                NSString *managerPrompt = @"\nPlease pick a manager! \n* angry - He is mad at life. \n* happy - He loves you! \n* none - No manager. \n";
                NSString *managerInput = [collector inputForPrompt:managerPrompt];

                if ([managerInput isEqualToString:@"angry"]) {
                    restaurantKitchen.delegate = angryManager;
                }

                if ([managerInput isEqualToString:@"happy"]) {
                    restaurantKitchen.delegate = happyManager;
                }

                NSString *sizePrompt = @"\nWhat size do you want? (small, medium, large)\n";
                NSString *sizeInput = [collector inputForPrompt:sizePrompt];
                NSString *toppingsPrompt = @"\nWhat toppings would you like on it?\n";
                NSString *toppingsInput = [collector inputForPrompt:toppingsPrompt];

                [toppingsInput stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                [restaurantKitchen makePizzaWithSize:[Pizza getPizzaSizeFromString:sizeInput] toppings:[toppingsInput componentsSeparatedByString:@" "]];
            }
        }
    }

    return 0;
}

