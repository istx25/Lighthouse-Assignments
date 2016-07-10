//
//  main.m
//  Boxes
//
//  Created by Willow Belle on 2015-10-20.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Box.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        // Initialise the first box
        Box *firstBox = [[Box alloc] initWithHeight:10.0 width:20.0 depth:40.0];
        NSLog(@"First Box Volume: %f", [firstBox calculateVolume]);

        // Initialise the second box
        Box *secondBox = [[Box alloc] initWithHeight:100.0 width:40.0 depth:60.00];
        NSLog(@"Second Box Volume: %f", [secondBox calculateVolume]);

        // Calculate how many times the first box can fit inside of the second box
        NSLog(@"%f", [firstBox canFitInsideBox:secondBox]);
    }

    return 0;
}
