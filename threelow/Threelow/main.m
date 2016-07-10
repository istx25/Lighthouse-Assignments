//
//  main.m
//  Threelow
//
//  Created by Willow Belle on 2015-10-21.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "GameController.h"
#import "Dice.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        GameController *controller = [[GameController alloc] init];
        InputCollector *collector = [[InputCollector alloc] init];

        while (YES) {

            NSString *prompt = @"\nWelcome to Threelow! \n* roll - Roll the dice. \n* reset - Reset the held dice. \n* quit - Exit program. \n";
            NSString *input = [collector inputForPrompt:prompt];

            if ([input isEqualToString:@"reset"]) {
                NSLog(@"The heldDice array has been reset.");
                [controller resetDice];
            }

            if ([input isEqualToString:@"quit"]) {
                NSLog(@"Good bye.");

                return 0;
            }

            if ([input isEqualToString:@"roll"]) {
                [controller rollDice];
//                [controller rollDice];

                NSString *nextPrompt = @"\nEnter an index of a die (0-4) to hold it in the next roll.\n";
                NSString *nextInput = [collector inputForPrompt:nextPrompt];
                [controller holdDie:nextInput.intValue];
            }
        }
    }
    
    return 0;
}
