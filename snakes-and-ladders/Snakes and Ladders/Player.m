//
//  Player.m
//  Snakes and Ladders
//
//  Created by Willow Belle on 2015-10-24.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "Player.h"
#import "InputCollector.h"

@implementation Player

- (int)receiveDiceValue {
    InputCollector *collector = [InputCollector new];
    NSString *prompt = @"\nPlease provide the number you received while rolling the dice.\n";
    NSString *input = [collector inputForPrompt:prompt];

    return [input intValue];
}

@end
