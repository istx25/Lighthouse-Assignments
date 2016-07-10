//
//  MovieCollectionViewCell.h
//  Rotten Mangoes
//
//  Created by Willow Belle on 2015-11-09.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Movie;

@interface MovieCollectionViewCell : UICollectionViewCell

- (void)configureCellWithMovie:(Movie *)movie;

@end
