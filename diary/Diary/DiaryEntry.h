//
//  DiaryEntry.h
//  Diary
//
//  Created by Willow Belle on 2015-11-07.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

typedef enum int16_t {
    DiaryEntryMoodGood = 0,
    DiaryEntryMoodAverage = 1,
    DiaryEntryMoodBad = 2
} DiaryEntryMood;

@interface DiaryEntry : NSManagedObject

@property (nonatomic) NSTimeInterval date;
@property (nullable, nonatomic, retain) NSString *body;
@property (nullable, nonatomic, retain) NSData *imageData;
@property (nullable, nonatomic, retain) NSString *location;
@property (nonatomic) int16_t mood;

@property (nonatomic, readonly) NSString *sectionName;

@end