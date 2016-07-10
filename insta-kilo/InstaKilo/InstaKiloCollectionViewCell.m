//
//  InstaKiloCollectionViewCell.m
//  InstaKilo
//
//  Created by Willow Belle on 2015-11-04.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "InstaKiloCollectionViewCell.h"

@interface InstaKiloCollectionViewCell ()

@property (nonatomic, weak) IBOutlet UIImageView *photoImageView;

@end

@implementation InstaKiloCollectionViewCell

- (void)setPhoto:(Photo *)photo {
    _photo = photo;

    [self configure];
}

- (void)configure {
    self.photoImageView.image = self.photo.image;
}

@end
