//
//  DiaryEntry.m
//  Diary
//
//  Created by Willow Belle on 2015-11-07.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "DiaryEntry.h"

@implementation DiaryEntry

@dynamic date;
@dynamic body;
@dynamic imageData;
@dynamic location;
@dynamic mood;

- (NSString *)sectionName {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.date];
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"MMM yyyy"];

    return [dateFormatter stringFromDate:date];
}

@end
