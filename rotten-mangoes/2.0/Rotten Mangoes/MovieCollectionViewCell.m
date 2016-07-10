//
//  MovieCollectionViewCell.m
//  Rotten Mangoes
//
//  Created by Willow Belle on 2015-11-09.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "MovieCollectionViewCell.h"
#import "Movie.h"

@interface MovieCollectionViewCell ()

@property (nonatomic, weak) IBOutlet UIImageView *posterImageView;
@property (nonatomic) NSURLSessionDataTask *task;

@end

@implementation MovieCollectionViewCell

- (void)configureCellWithMovie:(Movie *)movie {

    if (movie.cachedImage) {
        [self.posterImageView setImage:movie.cachedImage];

        return;
    }

    NSURLRequest *request = [NSURLRequest requestWithURL:movie.posterImageURL];
    NSURLSession *session = [NSURLSession sharedSession];

    self.task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {

        if (error) {
            NSLog(@"Image Download Error: %@", error);

            return;
        }

        UIImage *posterImage = [UIImage imageWithData:data];
        movie.cachedImage = posterImage;

        dispatch_async(dispatch_get_main_queue(), ^{
            [self.posterImageView setImage:posterImage];
        });
    }];

    [self.task resume];
}

- (void)prepareForReuse {
    [super prepareForReuse];

    [self.task cancel];
    [self.posterImageView setImage:nil];
}

@end
