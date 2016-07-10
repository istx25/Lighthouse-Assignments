//
//  Box.h
//  Boxes
//
//  Created by Willow Belle on 2015-10-20.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Box : NSObject

@property float height;
@property float width;
@property float depth;

- (instancetype)initWithHeight: (float)height width: (float)width depth: (float)depth;

- (float)calculateVolume;
- (float)canFitInsideBox: (Box *)otherBox;

@end
