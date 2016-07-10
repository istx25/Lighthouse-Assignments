//
//  MasterViewController.m
//  EveryDo
//
//  Created by Willow Belle on 2015-11-11.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "TaskListViewController.h"
#import "LHLCoreDataStack.h"
#import "TodoTableViewCell.h"
#import "Todo.h"
#import "DetailViewController.h"
#import "NewTodoViewController.h"

static NSString *kCellReuseIdentifier = @"todoCell";
static NSString *kSegueToDetailViewController = @"segueToDetailViewController";
static NSString *kSegueToNewTodoViewController = @"segueToNewTodoViewController";

@interface TaskListViewController () <NSFetchedResultsControllerDelegate> {
    NSString *_defaultTodoTitleText;
}

@property (nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic) LHLCoreDataStack *stack;

@end

@implementation TaskListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
    [self.fetchedResultsController performFetch:nil];
}

- (IBAction)organiseBarButtonPressed:(UIBarButtonItem *)sender {
    NSString *message = @"This value will populate the text field in the \"New Todo\" section by default.";

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Default Settings" message:message preferredStyle:UIAlertControllerStyleAlert];

    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Default Task Title";
    }];

    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Apply Change" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UITextField *textField = alert.textFields[0];
        [[NSUserDefaults standardUserDefaults] setObject:textField.text forKey:@"default_todo_title_text"];
    }]];

    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:kSegueToNewTodoViewController]) {
        NewTodoViewController *newTodoViewController = [segue destinationViewController];
        newTodoViewController.stack = self.stack;
    }

    if ([segue.identifier isEqualToString:kSegueToDetailViewController]) {
        DetailViewController *detailViewController = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        detailViewController.todo = [self.fetchedResultsController objectAtIndexPath:indexPath];
        detailViewController.stack = self.stack;
    }
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.fetchedResultsController sections] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    id<NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];

    return [sectionInfo name];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id<NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];

    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TodoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellReuseIdentifier forIndexPath:indexPath];

    Todo *todo = [self.fetchedResultsController objectAtIndexPath:indexPath];
    [cell configureCellWithTodo:todo];

    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    Todo *todo = [self.fetchedResultsController objectAtIndexPath:indexPath];
    [[self.stack managedObjectContext] deleteObject:todo];
    [self.stack saveContext];
}

#pragma mark - <UITableViewDelegate>
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

#pragma mark - <NSFetchedResultsControllerDelegate>
- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeUpdate:
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        default:
            break;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        default:
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

@end

#pragma mark - Lazy Instantiation

@implementation TaskListViewController (LazyInstantiation)

- (LHLCoreDataStack *)stack {
    if (!_stack) {
        _stack = [LHLCoreDataStack new];
    }

    return _stack;
}

- (NSFetchRequest *)entryListFetchRequest {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Todo"];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"task" ascending:NO]];

    return fetchRequest;
}

- (NSFetchedResultsController *)fetchedResultsController {
    if (!_fetchedResultsController) {
        NSFetchRequest *fetchRequest = [self entryListFetchRequest];
        _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.stack.managedObjectContext sectionNameKeyPath:@"category" cacheName:nil];
        _fetchedResultsController.delegate = self;

        return _fetchedResultsController;
    }

    return _fetchedResultsController;
}

@end
