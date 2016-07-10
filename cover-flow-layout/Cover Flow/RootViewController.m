//
//  ViewController.m
//  Cover Flow
//
//  Created by Willow Belle on 2015-11-05.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return arc4random_uniform(500);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"flowCell" forIndexPath:indexPath];

    [cell setBackgroundColor:[UIColor purpleColor]];

    return cell;
}

@end
