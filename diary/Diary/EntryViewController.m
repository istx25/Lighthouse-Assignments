//
//  NewEntryViewController.m
//  Diary
//
//  Created by Willow Belle on 2015-11-07.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "EntryViewController.h"
#import "CoreDataStack.h"
#import "DiaryEntry.h"

@interface EntryViewController ()

@property (nonatomic, weak) IBOutlet UITextField *bodyTextField;

@end

@implementation EntryViewController

#pragma mark - Controller Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    if (self.entry) {
        self.bodyTextField.text = self.entry.body;
    }
}

#pragma mark - Actions
- (IBAction)cancelButtonWasPressed:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)doneButtonWasPressed:(UIBarButtonItem *)sender {
    if (!self.entry) {
        [self insertNewDiaryEntry];
    } else {
        [self updateExistingDiaryEntry];
    }

    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Data
- (void)insertNewDiaryEntry {
    CoreDataStack *coreDataStack = [CoreDataStack defaultStack];
    DiaryEntry *entry = [NSEntityDescription insertNewObjectForEntityForName:@"DiaryEntry" inManagedObjectContext:coreDataStack.managedObjectContext];
    entry.body = self.bodyTextField.text;
    entry.date = [[NSDate date] timeIntervalSince1970];

    [coreDataStack saveContext];
}

- (void)updateExistingDiaryEntry {
    CoreDataStack *coreDataStack = [CoreDataStack defaultStack];
    self.entry.body = self.bodyTextField.text;
    [coreDataStack saveContext];
}

@end
