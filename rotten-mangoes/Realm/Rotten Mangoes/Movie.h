//
//  Movie.h
//  Rotten Mangoes
//
//  Created by Willow Belle on 2015-11-09.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Movie : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSURL *posterImageURL;
@property (nonatomic) NSURL *reviewsURL;
@property (nonatomic) UIImage *cachedImage;


- (instancetype)initWithTitle:(NSString *)title andPosterImageURL:(NSURL *)posterImageURL;

@end
