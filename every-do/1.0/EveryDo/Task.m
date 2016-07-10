//
//  Task.m
//  EveryDo
//
//  Created by Willow Belle on 2015-11-03.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "Task.h"

@implementation Task

- (instancetype)initWithTitle:(NSString *)taskTitle description:(NSString *)taskDescription andPriority:(NSUInteger)priority {
    self = [super init];

    if (self) {
        _taskTitle = taskTitle;
        _taskDescription = taskDescription;
        _priority = priority;
        _isCompleted = NO;
    }

    return self;
}

@end
