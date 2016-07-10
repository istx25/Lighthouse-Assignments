//
//  DetailViewController.m
//  EveryDo
//
//  Created by Willow Belle on 2015-11-11.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "DetailViewController.h"
#import "Todo.h"

@interface DetailViewController ()

@property (nonatomic, weak) IBOutlet UILabel *todoTaskLabel;
@property (nonatomic, weak) IBOutlet UIButton *todoCompletedButton;
@property (nonatomic, weak) IBOutlet UILabel *todoStatusLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
    [self.todoTaskLabel setText:self.todo.task];

    if (self.todo.status) {
        [self statusChanged];
    }
}

- (IBAction)todoCompletedButtonPressed:(UIButton *)sender {
    self.todo.status = YES;

    [self statusChanged];
    [self.stack saveContext];
}

- (void)statusChanged {
    [self.todoStatusLabel setText:@"The task is completed."];
    [self.todoCompletedButton setHidden:YES];
}

@end
