//
//  Task.h
//  EveryDo
//
//  Created by Willow Belle on 2015-11-03.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

@property (nonatomic) NSString *taskTitle;
@property (nonatomic) NSString *taskDescription;
@property NSUInteger priority;
@property BOOL isCompleted;

- (instancetype)initWithTitle:(NSString *)taskTitle description:(NSString *)taskDescription andPriority:(NSUInteger)priority;

@end
