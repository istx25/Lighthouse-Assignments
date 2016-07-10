//
//  TaskModel.m
//  EveryDo
//
//  Created by Willow Belle on 2015-11-03.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "TaskModel.h"

@interface TaskModel ()

@property (nonatomic) NSMutableArray *tasks;

@end

@implementation TaskModel

- (NSMutableArray *)tasks {
    if (!_tasks) {
        _tasks = [NSMutableArray new];
    }

    return _tasks;
}

- (void)addTask:(Task *)task {
    [self.tasks addObject:task];
}

- (NSMutableArray *)taskModelArray {
    return self.tasks;
}

@end
