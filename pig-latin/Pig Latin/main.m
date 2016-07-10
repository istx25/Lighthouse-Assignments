//
//  main.m
//  Pig Latin
//
//  Created by Willow Belle on 2015-10-23.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+PigLatinization.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSString *latin = [NSString stringByPigLatinization:@"hello my name is willow"];
        NSLog(@"%@", latin);
    }

    return 0;
}
