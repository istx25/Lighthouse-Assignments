//
//  ViewController.m
//  InstaKilo
//
//  Created by Willow Belle on 2015-11-04.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "FirstViewController.h"
#import "InstaKiloCollectionViewCell.h"
#import "InstaKiloCollectionHeaderView.h"
#import "Photo.h"

@interface FirstViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic, weak) IBOutlet UISegmentedControl *segmentedControl;
@property (nonatomic) NSArray *photos;

@property (nonatomic) NSMutableDictionary *main;
@property (nonatomic) NSMutableDictionary *locations;
@property (nonatomic) NSMutableDictionary *subjects;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.photos = @[ /* Canada */
                      [[Photo alloc] initWithImage:[UIImage imageNamed:@"Two"] location:@"Canada" subject:@"Home"],
                      [[Photo alloc] initWithImage:[UIImage imageNamed:@"Three"] location:@"Canada" subject:@"Home"],
                      /* America */
                      [[Photo alloc] initWithImage:[UIImage imageNamed:@"One"] location:@"United States of America" subject:@"Foreign"],
                      [[Photo alloc] initWithImage:[UIImage imageNamed:@"Ten"] location:@"United States of America" subject:@"Foreign"],
                      [[Photo alloc] initWithImage:[UIImage imageNamed:@"Six"] location:@"United States of America" subject:@"Foreign"],
                      [[Photo alloc] initWithImage:[UIImage imageNamed:@"Seven"] location:@"United States of America" subject:@"Foreign"],
                      /* England */
                      [[Photo alloc] initWithImage:[UIImage imageNamed:@"Four"] location:@"England" subject:@"Foreign"],
                      [[Photo alloc] initWithImage:[UIImage imageNamed:@"Nine"] location:@"England" subject:@"Foreign"],
                      /* France */
                      [[Photo alloc] initWithImage:[UIImage imageNamed:@"Five"] location:@"France" subject:@"Foreign"],
                      /* Germany */
                      [[Photo alloc] initWithImage:[UIImage imageNamed:@"Eight"] location:@"Germany" subject:@"Foreign"]
                    ];

    [self filterByLocation];
    [self filterBySubject];

    self.main = self.subjects;
}

- (void)filterByLocation {
    self.locations = [NSMutableDictionary dictionary];

    for (Photo *photo in self.photos) {
        NSMutableArray *currentPhotos = [self.locations[photo.location] mutableCopy];

        if (!currentPhotos) {
            currentPhotos = [NSMutableArray array];
        }

        [currentPhotos addObject:photo];
        self.locations[photo.location] = currentPhotos;
    }
}

- (void)filterBySubject {
    self.subjects = [NSMutableDictionary dictionary];

    for (Photo *photo in self.photos) {
        NSMutableArray *currentPhotos = [self.subjects[photo.subject] mutableCopy];
        if (!currentPhotos) {
            currentPhotos = [NSMutableArray array];
        }

        [currentPhotos addObject:photo];
        self.subjects[photo.subject] = currentPhotos;
    }
}

- (IBAction)segmentDidChange:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.main = self.subjects;
            break;
        case 1:
            self.main = self.locations;
            break;
        default:
            break;
    }

    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.main.allKeys.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[self.main allValues][section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    InstaKiloCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"photosCell" forIndexPath:indexPath];
    cell.photo = [self.main allValues][indexPath.section][indexPath.item];

    return cell;
}

#pragma mark - UICollectionViewDelegate
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    InstaKiloCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];


    NSArray *headerTitles = [self.main allKeys];
    switch (self.segmentedControl.selectedSegmentIndex) {
        case 0:
            headerView.titleLabel.text = headerTitles[indexPath.section];
            break;
        case 1:
            headerView.titleLabel.text = headerTitles[indexPath.section];
            break;
    }

    return headerView;
}

@end
