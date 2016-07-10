//
//  SecondTableViewController.m
//  Exercise
//
//  Created by Willow Belle on 2015-11-13.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "SecondTableViewController.h"
#import "Room.h"
#import "Furniture.h"

static NSString *kReuseIdentifier = @"furnitureCell";

@interface SecondTableViewController ()

@property (nonatomic, weak) IBOutlet UIBarButtonItem *addButton;
@property (nonatomic) RLMRealm *realm;
//@property (nonatomic) RLMResults<Furniture *> *furnitureItems;

@end

@implementation SecondTableViewController

#pragma mark - Controller Lifecycle
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];

    if (self) {
        _realm = [RLMRealm defaultRealm];
//        _furnitureItems = self.room.furnitureItems;
    }

    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self setTitle:self.room.name];
}

#pragma mark - Actions
- (IBAction)addButtonPressed:(UIBarButtonItem *)sender {
    NSString *message = @"Please provide a name for the new piece of furniture.";
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Add a furniture item" message:message preferredStyle:UIAlertControllerStyleAlert];

    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Furniture Name";
    }];

    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Add" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UITextField *textField = alert.textFields[0];
        Furniture *furniture = [Furniture new];

        [furniture setName:textField.text];
        [self.realm beginWriteTransaction];
        [self.room.furnitureItems addObject:furniture];
        [self.realm commitWriteTransaction];
        [self reloadDataInMainQueue];
    }]];

    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.room.furnitureItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReuseIdentifier forIndexPath:indexPath];
    
    Furniture *furniture = self.room.furnitureItems[indexPath.row];
    cell.textLabel.text = furniture.name;
    
    return cell;
}

#pragma mark - Helper
- (void)reloadDataInMainQueue {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

@end
