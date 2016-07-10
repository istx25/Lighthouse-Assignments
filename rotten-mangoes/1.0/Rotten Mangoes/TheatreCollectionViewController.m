//
//  TheatreCollectionViewController.m
//  Rotten Mangoes
//
//  Created by Willow Belle on 2015-11-09.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "TheatreCollectionViewController.h"
#import "MovieDetailViewController.h"
#import "MovieCollectionViewCell.h"
#import "RottenTomatoesAPI.h"
#import "Movie.h"

static NSString * const kReuseIdentifier = @"movieCell";
static NSString * const kDetailSegueIdentifier = @"segueToMovieDetailViewController";

@interface TheatreCollectionViewController ()

@property (nonatomic) NSArray *movies;

@end

@implementation TheatreCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _movies = [NSArray array];

    // Do any additional setup after loading the view.
    [self fetchMoviesFromTheatre];
}

- (void)fetchMoviesFromTheatre {
    [RottenTomatoesAPI fetchMoviesFromTheatreEndpoint:^(NSArray *serializedTheatreArray) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.movies = serializedTheatreArray;
            [self.collectionView reloadData];
        });
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:kDetailSegueIdentifier]) {
        MovieDetailViewController *destinationViewController = [segue destinationViewController];
        NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems] lastObject];
        Movie *movie = self.movies[indexPath.item];
        destinationViewController.movie = movie;
    }
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.movies.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MovieCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kReuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    Movie *movie = self.movies[indexPath.row];
    [cell configureCellWithMovie:movie];

    return cell;
}

@end
