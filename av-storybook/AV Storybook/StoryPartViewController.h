//
//  ViewController.h
//  AV Storybook
//
//  Created by Willow Belle on 2015-11-06.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@protocol StoryPartViewDelegate <NSObject>

@required
- (void)addAudioAssetForPage:(AVURLAsset *)audioAsset;
- (void)addImageForPage:(UIImage *)image;

@optional
- (AVURLAsset *)getAudioAssetForPage;
- (UIImage *)getImageForPage;

@end

@interface StoryPartViewController : UIViewController

@property (nonatomic, weak) id<StoryPartViewDelegate> delegate;

@end

