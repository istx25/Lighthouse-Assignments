//
//  InputCollector.m
//  PizzaRestaurant
//
//  Created by Willow Belle on 2015-10-22.
//  Copyright © 2015 Lighthouse Labs. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector

- (NSString *)inputForPrompt:(NSString *)promptString {
    NSLog(@"%@>", promptString);

    char inputChars[255];
    fgets(inputChars, 255, stdin);

    NSString *inputString = [NSString stringWithUTF8String:inputChars];
    NSString *modifiedInputString = [inputString stringByReplacingOccurrencesOfString:@"\n" withString:@""];

    return modifiedInputString;
}

@end