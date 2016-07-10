//
//  Page.m
//  AV Storybook
//
//  Created by Willow Belle on 2015-11-06.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "Page.h"
#import "StoryPartViewController.h"
#import <AVFoundation/AVFoundation.h>

@implementation Page

- (void)addAudioAssetForPage:(AVURLAsset *)audioAsset {
    self.audioAsset = audioAsset;
}

- (AVURLAsset *)getAudioAssetForPage {
    return self.audioAsset;
}

- (void)addImageForPage:(UIImage *)image {
    self.image = image;
}

- (UIImage *)getImageForPage {
    return self.image;
}


@end
