//
//  ReceiptsTableViewController.m
//  Receipts++
//
//  Created by Willow Belle on 2015-11-12.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "ReceiptsTableViewController.h"
#import "NewReceiptViewController.h"
#import "LHLCoreDataStack+Receipts.h"

static NSString *kCellReuseIdentifier = @"receiptsCell";
static NSString *kSegueToNewReceiptViewController = @"segueToNewReceiptViewController";

@interface ReceiptsTableViewController ()

@property (nonatomic) LHLCoreDataStack *stack;
@property (nonatomic) NSFetchRequest *receiptsFetchRequest;
@property (nonatomic) NSArray<Tag *> *tags;
@property (nonatomic) NSArray<Receipt *> *receipts;

@end

@implementation ReceiptsTableViewController

#pragma mark - Controller Lifecycle
- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];

    if (self) {
        _tags = [NSArray array];
    }

    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self fetchReceipts];
    [self.tableView reloadData];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:kSegueToNewReceiptViewController]) {
        NewReceiptViewController *newReceiptViewController = [segue destinationViewController];
        newReceiptViewController.stack = self.stack;
    }
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.tags.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.tags[section].name;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tags[section].receipts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellReuseIdentifier forIndexPath:indexPath];

    self.receipts = [self sortReceiptsWithUnsortedReceipts:[self.tags[indexPath.section].receipts allObjects]];
    Receipt *receipt = self.receipts[indexPath.row];

    cell.textLabel.text = receipt.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"$%.02f", [receipt.amount floatValue]];

    return cell;
}

#pragma mark - Data
- (void)fetchReceipts {
    NSError *executeFetchRequestError = nil;
    self.tags = [self.stack.managedObjectContext executeFetchRequest:self.receiptsFetchRequest error:&executeFetchRequestError];
}

- (NSArray<Receipt *> *)sortReceiptsWithUnsortedReceipts:(NSArray *)unsortedReceipts {
    return [unsortedReceipts sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"date" ascending:NO]]];
}

@end

@implementation ReceiptsTableViewController (LazyInstantiation)

- (LHLCoreDataStack *)stack {
    if (!_stack) {
        _stack = [LHLCoreDataStack new];
    }

    return _stack;
}

- (NSFetchRequest *)receiptsFetchRequest {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Tag"];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO]];

    return fetchRequest;
}

@end
