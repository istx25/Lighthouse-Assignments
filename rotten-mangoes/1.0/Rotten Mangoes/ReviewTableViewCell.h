//
//  ReviewTableViewCell.h
//  Rotten Mangoes
//
//  Created by Willow Belle on 2015-11-10.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Review;

@interface ReviewTableViewCell : UITableViewCell

- (void)configureCellWithReview:(Review *)review;

@end
