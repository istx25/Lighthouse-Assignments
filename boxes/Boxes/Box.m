//
//  Box.m
//  Boxes
//
//  Created by Willow Belle on 2015-10-20.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "Box.h"

@implementation Box

- (instancetype)initWithHeight: (float)height width: (float)width depth: (float)depth {
    self.height = height;
    self.width = width;
    self.depth = depth;

    return self;
}

- (float)calculateVolume {
    return self.height * self.depth * self.width;
}

- (float)canFitInsideBox: (Box *)otherBox {
    return [self calculateVolume] / [otherBox calculateVolume];
}

@end
