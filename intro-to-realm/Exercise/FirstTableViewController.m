//
//  FirstTableViewController.m
//  Exercise
//
//  Created by Willow Belle on 2015-11-13.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "FirstTableViewController.h"
#import "SecondTableViewController.h"
#import "Room.h"

static NSString *kReuseIdentifier = @"roomCell";
static NSString *kSegueToSecondTableViewController = @"segueToSecondTableViewController";

@interface FirstTableViewController ()

@property (nonatomic, weak) IBOutlet UIBarButtonItem *addButton;
@property (nonatomic) RLMRealm *realm;
@property (nonatomic) RLMResults<Room *> *rooms;

@end

@implementation FirstTableViewController

#pragma mark - Controller Lifecycle
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];

    if (self) {
        _realm = [RLMRealm defaultRealm];
        _rooms = [Room allObjects];

    }

    return self;
}

#pragma mark - Actions
- (IBAction)addButtonPressed:(UIBarButtonItem *)sender {
    NSString *message = @"Please provide a name for the new room.";
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Add a room" message:message preferredStyle:UIAlertControllerStyleAlert];

    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Room Name";
    }];

    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Add" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UITextField *textField = alert.textFields[0];
        Room *room = [Room new];

        [room setName:textField.text];
        [self.realm beginWriteTransaction];
        [self.realm addObject:room];
        [self.realm commitWriteTransaction];
        [self reloadDataInMainQueue];
    }]];

    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:kSegueToSecondTableViewController]) {
        SecondTableViewController *secondTableViewController = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Room *room = self.rooms[indexPath.row];
        secondTableViewController.room = room;
    }
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.rooms.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReuseIdentifier forIndexPath:indexPath];

    Room *room = self.rooms[indexPath.row];
    cell.textLabel.text = room.name;

    return cell;
}

#pragma mark - Helper
- (void)reloadDataInMainQueue {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

@end
