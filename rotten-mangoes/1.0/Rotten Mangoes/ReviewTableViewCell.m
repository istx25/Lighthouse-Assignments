//
//  ReviewTableViewCell.m
//  Rotten Mangoes
//
//  Created by Willow Belle on 2015-11-10.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "ReviewTableViewCell.h"
#import "Review.h"

@interface ReviewTableViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *criticLabel;
@property (nonatomic, weak) IBOutlet UILabel *publicationLabel;
@property (nonatomic, weak) IBOutlet UILabel *quoteTextLabel;
@property (nonatomic, weak) IBOutlet UILabel *freshnessTypeLabel;

- (NSString *)stringForFreshnessType:(Review *)review;

@end

@implementation ReviewTableViewCell

- (void)configureCellWithReview:(Review *)review {
    [self.criticLabel setText:review.critic];
    [self.publicationLabel setText:review.publication];
    [self.quoteTextLabel setText:review.quote];
    [self.freshnessTypeLabel setText:[NSString stringWithFormat:@"Rating: %@", [self stringForFreshnessType:review]]];
}

- (NSString *)stringForFreshnessType:(Review *)review {
    if (review.freshnessType == FreshnessTypeFresh) {
        return @"Fresh";
    }

    if (review.freshnessType == FreshnessTypeRotten) {
        return @"Rotten";
    }

    return @"Something went wrong...";
}

@end
