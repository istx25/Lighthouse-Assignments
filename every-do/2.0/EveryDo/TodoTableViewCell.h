//
//  TodoTableViewCell.h
//  EveryDo
//
//  Created by Willow Belle on 2015-11-11.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Todo;

@interface TodoTableViewCell : UITableViewCell

- (void)configureCellWithTodo:(Todo *)todo;

@end
