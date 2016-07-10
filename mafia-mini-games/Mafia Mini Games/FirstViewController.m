//
//  FirstViewController.m
//  Mafia Mini Games
//
//  Created by Willow Belle on 2015-10-28.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (nonatomic, weak) IBOutlet UILabel *playerTypeLabel;
@property (nonatomic, weak) IBOutlet UILabel *innocentVillagersCountLabel;
@property (nonatomic, weak) IBOutlet UILabel *mafiaMembersCountLabel;

@end

@implementation FirstViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self setupPlayer];
    [self setupUI];
}

- (void)setupUI {
    self.innocentVillagersCountLabel.text = [NSString stringWithFormat:@"Innocent Lives: %i", [self.roles.innocentVillagers intValue]];
    self.mafiaMembersCountLabel.text = [NSString stringWithFormat:@"Mafia Members: %i", [self.roles.mafiaMembers intValue]];
}

- (void)setupPlayer {
    if (self.player.type == PlayerTypeSheriff) {
        self.playerTypeLabel.text = @"You are playing as the Sheriff";
    }

    if (self.player.type == PlayerTypeMafiaMember) {
        self.playerTypeLabel.text = @"You are playing as a Mafia Member";
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
