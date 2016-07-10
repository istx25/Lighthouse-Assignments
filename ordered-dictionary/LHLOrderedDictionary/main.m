//
//  main.m
//  LHLOrderedDictionary
//
//  Created by Willow Belle on 2015-10-31.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LHLOrderedDictionary.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDictionary *dictionary = @{@"ZZZ": @"Object4", @"GGG": @"Object 2", @"JJJ": @"Object 3", @"AAA" : @"Object 1"};
        LHLOrderedDictionary *orderedDictionary = [[LHLOrderedDictionary alloc] orderedDictionaryWithDictionary:dictionary];
        NSLog(@"Dictionary: %@", orderedDictionary);
    }

    return 0;
}
