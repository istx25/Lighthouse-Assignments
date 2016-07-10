//
//  main.m
//  Binary Search
//
//  Created by Willow Belle on 2015-10-20.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

int binarySearch(NSNumber *target, NSUInteger start, NSUInteger end, NSArray *array) {

    NSUInteger min = start;
    NSUInteger max = end;
    NSUInteger mid = (start + end) / 2;

    if (end > array.count) {
        NSLog(@"Value is out of bounds.");
        return -1;
    }

    if ([target intValue] == [array[mid] intValue]) {
        NSLog(@"Index: %lu", (unsigned long)mid);

        return 0;
    }

    if (start == end) {
        NSLog(@"Start is equal to End.");
        return -1;
    }

    if ([target intValue] < [array[mid] intValue]) {
        return binarySearch(target, min, mid - 1, array);
    }

    if ([target intValue] > [array[mid] intValue]) {
        return binarySearch(target, mid + 1, max, array);
    }

    return -1;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSArray *array = @[@1, @2, @3, @4, @5, @6, @7, @8, @9, @10];
        NSNumber *target = @7;

        binarySearch(target, 0, 9, array);
    }
    
    return 0;
}