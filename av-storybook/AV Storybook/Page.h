//
//  Page.h
//  AV Storybook
//
//  Created by Willow Belle on 2015-11-06.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "StoryPartViewController.h"

@interface Page : NSObject <StoryPartViewDelegate>

@property (nonatomic) AVURLAsset *audioAsset;
@property (nonatomic) UIImage *image;

@end
