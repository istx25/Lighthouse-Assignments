//
//  Photo.h
//  InstaKilo
//
//  Created by Willow Belle on 2015-11-04.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Photo : NSObject

@property (nonatomic) UIImage *image;
@property (nonatomic) NSString *location;
@property (nonatomic) NSString *subject;

- (instancetype)initWithImage:(UIImage *)image location:(NSString *)location subject:(NSString *)subject;

@end
