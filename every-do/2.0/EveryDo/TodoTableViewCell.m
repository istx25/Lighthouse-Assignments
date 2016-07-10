//
//  TodoTableViewCell.m
//  EveryDo
//
//  Created by Willow Belle on 2015-11-11.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "TodoTableViewCell.h"
#import "Todo.h"

@interface TodoTableViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *todoTaskLabel;

@end

@implementation TodoTableViewCell

- (void)configureCellWithTodo:(Todo *)todo {
    self.todoTaskLabel.text = todo.task;
}

@end
