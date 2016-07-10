//
//  DetailViewController.m
//  EveryDo
//
//  Created by Willow Belle on 2015-11-03.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (nonatomic, weak) IBOutlet UILabel *taskTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *taskDescriptionLabel;
@property (nonatomic, weak) IBOutlet UILabel *taskStatusLabel;
@property (nonatomic, weak) IBOutlet UILabel *priorityLabel;
@property (nonatomic, weak) IBOutlet UIButton *completedButton;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.taskTitleLabel.text = self.task.taskTitle;
    self.taskDescriptionLabel.text = self.task.taskDescription;
    self.taskStatusLabel.text = @"The task is pending completion.";

    if (self.task.isCompleted) {
        self.taskStatusLabel.text = @"The task is completed.";
    }

    self.priorityLabel.text = [NSString stringWithFormat:@"Level %lu Priority", (unsigned long)self.task.priority];
}

- (IBAction)completedButtonPressed:(UIButton *)sender {
    self.task.isCompleted = YES;
    self.taskStatusLabel.text = @"The task is completed.";
}

@end
