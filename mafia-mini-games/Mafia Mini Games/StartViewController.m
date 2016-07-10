//
//  StartViewController.m
//  Mafia Mini Games
//
//  Created by Willow Belle on 2015-10-28.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "StartViewController.h"
#import "FirstViewController.h"
#import "Roles.h"

@interface StartViewController ()

@property (nonatomic, weak) IBOutlet UIButton *startAsMafiaMember;
@property (nonatomic, weak) IBOutlet UIButton *startAsSheriff;

@end

@implementation StartViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segueToMiniGameAsSheriff"]) {
        FirstViewController *firstViewController = [segue destinationViewController];
        firstViewController.player = [[Player alloc] initWithPlayerType:PlayerTypeSheriff];
        firstViewController.roles = [[Roles alloc] initWithMafiaMembers:[NSNumber numberWithInt:15] andInnocentVillagers:[NSNumber numberWithInt:30]];
    }

    if ([segue.identifier isEqualToString:@"segueToMiniGameAsMafiaMember"]) {
        FirstViewController *firstViewController = [segue destinationViewController];
        firstViewController.player = [[Player alloc] initWithPlayerType:PlayerTypeMafiaMember];
        firstViewController.roles = [[Roles alloc] initWithMafiaMembers:[NSNumber numberWithInt:15] andInnocentVillagers:[NSNumber numberWithInt:30]];;
    }
}

@end
