//
//  CoverFlowLayout.m
//  Cover Flow
//
//  Created by Willow Belle on 2015-11-05.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "CoverFlowLayout.h"

@implementation CoverFlowLayout

- (void)prepareLayout {
    [super prepareLayout];

    [self setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [self setMinimumInteritemSpacing:0.0];
    [self setMinimumLineSpacing:0.0];
    [self setItemSize:CGSizeMake(250.0, 300.0)];
    [self setSectionInset:UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)];
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    NSMutableArray *attributesCopy = [NSMutableArray array];

    CGRect visibleRegion;
    visibleRegion.origin = self.collectionView.contentOffset;
    visibleRegion.size = self.collectionView.bounds.size;

    CGFloat halfFrame = self.collectionView.frame.size.width / 2;
    CGFloat visibleRegionCenter = halfFrame + visibleRegion.origin.x;

    // Modify the layout attributes as needed here
    for (UICollectionViewLayoutAttributes *attribute in attributes) {
        UICollectionViewLayoutAttributes *attributeCopy = [attribute copy];

        CGFloat distance = CGRectGetMidX(visibleRegion) - attributeCopy.center.x;
        CGFloat normalizedDistance = distance / halfFrame;

        attributeCopy.alpha = 1.0 - fabs(normalizedDistance);
        attributeCopy.alpha = 0.3 + (attributeCopy.alpha * 0.7);

        CGFloat x = 1.0 - fabs((attributeCopy.center.x - visibleRegionCenter) / (visibleRegion.size.width / 2));
        x = 0.7 + (x * 0.3);
        attributeCopy.transform3D = CATransform3DScale(CATransform3DIdentity, x, x, 1.0);

        CGFloat y = (attributeCopy.center.x - visibleRegionCenter) / (visibleRegion.size.width / 2);
        CATransform3D modifiedRotationTransform = attributeCopy.transform3D;

        if (y <= 0.0) {
            modifiedRotationTransform.m34 = 1.0 / 500.0;
        } else {
            modifiedRotationTransform.m34 = 1.0 / -500.0;
        }

        attributeCopy.transform3D = CATransform3DRotate(modifiedRotationTransform, M_PI_4 * fabs(y), 0.0, 1.0, 0.0);
        [attributesCopy addObject:attributeCopy];
    }

    return attributesCopy;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

@end
