//
//  NewTodoViewController.m
//  EveryDo
//
//  Created by Willow Belle on 2015-11-11.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "NewTodoViewController.h"
#import "Todo.h"

@interface NewTodoViewController () {
    NSString *_categoryText;
}

@property (nonatomic, weak) IBOutlet UITextField *todoTitleTextField;
@property (nonatomic, weak) IBOutlet UISegmentedControl *categorySegmentedControl;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *addButton;

@end

@implementation NewTodoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
}

- (void)setupUI {
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"default_todo_title_text"]) {
        [self.todoTitleTextField setText:[[NSUserDefaults standardUserDefaults] objectForKey:@"default_todo_title_text"]];
    }

    [self categoryControlDidChange:self.categorySegmentedControl];
    [self.todoTitleTextField becomeFirstResponder];
    [self.addButton setEnabled:NO];
}

- (IBAction)categoryControlDidChange:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            _categoryText = @"Work";
            break;
        case 1:
            _categoryText = @"Home";
        default:
            break;
    }
}

- (IBAction)sliderDidChange:(UISlider *)sender {
    NSUInteger sliderValue;
    sliderValue = lroundf(sender.value);

    [sender setValue:sliderValue animated:YES];
}

- (IBAction)addTaskToEveryDo:(UIBarButtonItem *)sender {
    Todo *todo = [NSEntityDescription insertNewObjectForEntityForName:@"Todo" inManagedObjectContext:self.stack.managedObjectContext];
    todo.task = self.todoTitleTextField.text;
    todo.category = _categoryText;

    [self.stack saveContext];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)editingChanged:(UITextField *)sender {
    [self.addButton setEnabled:sender.text.length > 0];
}

@end
