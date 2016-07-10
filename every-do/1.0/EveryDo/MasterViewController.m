//
//  MasterViewController.m
//  EveryDo
//
//  Created by Willow Belle on 2015-11-03.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "NewTaskViewController.h"

@interface MasterViewController ()

@property (nonatomic) TaskModel *taskModel;

@end

@implementation MasterViewController

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];

    if (self) {
        _taskModel = [TaskModel new];
    }

    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.tableView reloadData];
}

#pragma mark - Segues
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segueToNewTaskViewController"]) {
        NewTaskViewController *newTaskViewController = [segue destinationViewController];
        newTaskViewController.taskModel = self.taskModel;
    }

    if ([segue.identifier isEqualToString:@"segueToDetailViewController"]) {
        DetailViewController *detailViewController = [segue destinationViewController];
        Task *task = [self.taskModel taskModelArray][self.tableView.indexPathForSelectedRow.row];
        detailViewController.task = task;
    }
}

#pragma mark - Table View
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.taskModel taskModelArray].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    Task *task = [self.taskModel taskModelArray][indexPath.row];
    cell.textLabel.text = task.taskTitle;

    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    // Intentionally blank. Required to use UITableViewRowActions
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *actionButton = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"Delete" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [self.taskModel.taskModelArray removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];

    [actionButton setBackgroundColor:[UIColor redColor]];

    return @[actionButton];
}

@end