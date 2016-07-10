//
//  TaskModel.h
//  EveryDo
//
//  Created by Willow Belle on 2015-11-03.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"

@interface TaskModel : NSObject

- (void)addTask:(Task *)task;
- (NSMutableArray *)taskModelArray;

@end
