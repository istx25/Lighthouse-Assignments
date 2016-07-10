//
//  DrawingView.h
//  FingerPainting
//
//  Created by Willow Belle on 2015-10-30.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FingerPaintingDataSource <NSObject>

- (NSMutableArray *)pathsForDrawing;

@end

@interface FingerPaintingView : UIView

@property (nonatomic, weak) id<FingerPaintingDataSource> delegate;

@end
