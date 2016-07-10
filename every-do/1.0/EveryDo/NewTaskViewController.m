//
//  NewTaskViewController.m
//  EveryDo
//
//  Created by Willow Belle on 2015-11-03.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "NewTaskViewController.h"
#import "Task.h"

@interface NewTaskViewController ()

@property (nonatomic, weak) IBOutlet UITextField *taskTitleTextField;
@property (nonatomic, weak) IBOutlet UITextField *taskDescriptionTextField;
@property (nonatomic, weak) IBOutlet UISlider *prioritySlider;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *addButton;

@end

@implementation NewTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI {
    [self.taskTitleTextField becomeFirstResponder];
    [self.addButton setEnabled:NO];
}

- (IBAction)sliderDidChange:(UISlider *)sender {
    NSUInteger sliderValue;
    sliderValue = lroundf(sender.value);
    
    [sender setValue:sliderValue animated:YES];
}

- (IBAction)addTaskToEveryDo:(UIBarButtonItem *)sender {
    Task *task = [[Task alloc] initWithTitle:self.taskTitleTextField.text
                                 description:self.taskDescriptionTextField.text
                                 andPriority:self.prioritySlider.value];

    [self.taskModel addTask:task];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)editingChanged:(UITextField *)sender {
    [self.addButton setEnabled:sender.text.length > 0];
}

@end
