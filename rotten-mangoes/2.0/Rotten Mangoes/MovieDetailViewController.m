//
//  MovieDetailViewController.m
//  Rotten Mangoes
//
//  Created by Willow Belle on 2015-11-10.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "MovieMapViewController.h"
#import "RottenTomatoesAPI.h"
#import "ReviewTableViewCell.h"
#import "Movie.h"
#import "Review.h"

static NSString * const kReuseIdentifier = @"reviewCell";
static NSString * const kMapSegueIdentifier = @"segueToMovieMapViewController";

@interface MovieDetailViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UIImageView *posterImageView;
@property (nonatomic, weak) IBOutlet UILabel *movieTitleLabel;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic) NSArray *reviews;

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _reviews = [NSArray array];

    [self setTitle:self.movie.title];
    [self.tableView setEstimatedRowHeight:100];
    [self.tableView setRowHeight:UITableViewAutomaticDimension];
    [self.posterImageView setImage:self.movie.cachedImage];
    [self fetchReviewsForMovie];
}

- (void)fetchReviewsForMovie {
    [RottenTomatoesAPI fetchReviewsForMovie:self.movie withCompletionHandler:^(NSArray *serializedReviewsArray) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.reviews = serializedReviewsArray;
            [self.tableView reloadData];
        });
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:kMapSegueIdentifier]) {
        MovieMapViewController *destinationViewController = [segue destinationViewController];
        destinationViewController.movie = self.movie;
    }
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.reviews.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ReviewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReuseIdentifier forIndexPath:indexPath];

    Review *review = self.reviews[indexPath.row];
    [cell configureCellWithReview:review];

    return cell;
}

@end
