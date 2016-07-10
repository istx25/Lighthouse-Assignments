//
//  ViewController.m
//  Receipts++
//
//  Created by Willow Belle on 2015-11-12.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "NewReceiptViewController.h"
#import "LHLCoreDataStack+Receipts.h"

static NSString *kCellReuseIdentifier = @"categoriesCell";

@interface NewReceiptViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UIBarButtonItem *cancelButton;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *saveButton;

@property (nonatomic, weak) IBOutlet UITextField *amountTextField;
@property (nonatomic, weak) IBOutlet UITextField *nameTextField;

@property (nonatomic, weak) IBOutlet UITableView *tagTableView;
@property (nonatomic) NSMutableSet *selectedTags;

@property (nonatomic, weak) IBOutlet UIDatePicker *transactionDatePicker;
@property (nonatomic) NSDate *transactionDate;

@end

@implementation NewReceiptViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self.saveButton setEnabled:NO];
    self.transactionDate = [NSDate date];
    self.selectedTags = [NSMutableSet set];
}

#pragma mark - Actions
- (IBAction)transactionDatePickerDidChange:(UIDatePicker *)sender {
    self.transactionDate = sender.date;
}

- (IBAction)cancelButtonPressed:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)saveButtonPressed:(UIBarButtonItem *)sender {
    Receipt *receipt = [NSEntityDescription insertNewObjectForEntityForName:@"Receipt" inManagedObjectContext:self.stack.managedObjectContext];

    receipt.name = self.nameTextField.text;
    receipt.amount = [NSNumber numberWithFloat:[self.amountTextField.text floatValue]];
    receipt.date = self.transactionDate;

    for (NSString *tagName in self.selectedTags) {
        Tag *tag = [self.stack fetchTagWithName:tagName];
        [receipt addTagsObject:tag];

        NSLog(@"%@", tagName);
    }

    [self.stack saveContext];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)textFieldDidChange:(id)sender {
    self.saveButton.enabled = self.nameTextField.text.length > 0 && self.amountTextField.text.length > 0;
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellReuseIdentifier forIndexPath:indexPath];

    NSString *tagNameForRow = [self tagNameForRow:indexPath.row];
    cell.textLabel.text = tagNameForRow;

    if ([self.selectedTags containsObject:tagNameForRow]) {
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    } else {
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *tagNameForRow = [self tagNameForRow:indexPath.row];

    if ([self.selectedTags containsObject:tagNameForRow]) {
        [self.selectedTags removeObject:[self tagNameForRow:indexPath.row]];
    } else {
        [self.selectedTags addObject:[self tagNameForRow:indexPath.row]];
    }

    [self.tagTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationAutomatic)];
}

#pragma mark - Helper
- (NSString *)tagNameForRow:(NSInteger)row {
    switch (row) {
        case 0:
            return @"Home";
        case 1:
            return @"Work";
        case 2:
            return @"Other";
    }

    return @"Something went wrong...";
}

@end