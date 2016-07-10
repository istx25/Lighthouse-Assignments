//
//  FirstViewController.h
//  Mafia Mini Games
//
//  Created by Willow Belle on 2015-10-28.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"
#import "Roles.h"

@interface FirstViewController : UIViewController

@property (nonatomic) Player *player;
@property (nonatomic) Roles *roles;

@end
