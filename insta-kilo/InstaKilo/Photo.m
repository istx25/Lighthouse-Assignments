//
//  Photo.m
//  InstaKilo
//
//  Created by Willow Belle on 2015-11-04.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "Photo.h"

@implementation Photo

- (instancetype)initWithImage:(UIImage *)image location:(NSString *)location subject:(NSString *)subject {
    self = [super init];

    if (self) {
        _image = image;
        _location = location;
        _subject = subject;
    }

    return self;
}

@end
