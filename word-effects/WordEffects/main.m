//
//  main.m
//  WordEffects
//
//  Created by Willow Belle on 2015-10-19.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        while(YES) {

            char inputChars[255];
            char functionChars[255];

            // Let the program know which function you want to use...
            printf("Type in a function: ");
            fgets(functionChars, 255, stdin);

            // Convert the functionChar into something Objective-C can play with...
            NSString *functionString = [NSString stringWithUTF8String:functionChars];
            NSString *modifiedFunctionString = [functionString stringByReplacingOccurrencesOfString:@"\n" withString:@""];

            // Provide the program an input to work with...
            printf("Input a string: ");
            fgets(inputChars, 255, stdin);

            // Convert the inputChar into something Objective-C can play with...
            NSString *inputString = [NSString stringWithUTF8String:inputChars];
            NSString *modifiedInputString = [inputString stringByReplacingOccurrencesOfString:@"\n" withString:@""];

            NSLog(@"Original input was: %@", modifiedInputString);

            // Run a switch to find which function we're using
            switch ([modifiedFunctionString intValue]) {
                case 1:
                    NSLog(@"Capitalised output is: %@", [modifiedInputString uppercaseString]);
                    break;
                case 2:
                    NSLog(@"Lowercased output was: %@", [modifiedInputString lowercaseString]);
                    break;
                case 3:
                    NSLog(@"Int output is: %d", [modifiedInputString intValue]);
                    break;
                case 4:
                    NSLog(@"Canadianized output is: %@", [modifiedInputString stringByAppendingString:@", eh?"]);
                    break;
                case 5:

                    if ([modifiedInputString hasSuffix:@"?"]) {
                        NSLog(@"I don't know.");
                    }

                    if ([modifiedInputString hasSuffix:@"!"]) {
                        NSLog(@"Whoa, calm down!");
                    }

                    break;
                case 6:
                    NSLog(@"De-space-it output is: %@", [modifiedInputString stringByReplacingOccurrencesOfString:@" " withString:@"-"]);
                    break;
                default:
                    break;
            }
        }
    }
    
    return 0;
}