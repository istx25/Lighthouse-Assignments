//
//  LoginViewController.m
//  EveryDo
//
//  Created by Willow Belle on 2015-11-11.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "LoginViewController.h"
#import "SSKeychain.h"

static NSString *kServiceName = @"EveryDo";
static NSString *kSegueToEveryDo = @"segueToEveryDo";

static NSString *kUsernameKey = @"username";
static NSString *kPasswordKey = @"password";

@interface LoginViewController ()

@property (nonatomic, weak) IBOutlet UILabel *incorrectCredentialsLabel;
@property (nonatomic, weak) IBOutlet UITextField *usernameTextField;
@property (nonatomic, weak) IBOutlet UITextField *passwordTextField;
@property (nonatomic, weak) IBOutlet UIButton *loginButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.incorrectCredentialsLabel setHidden:YES];
}


- (IBAction)loginButtonPressed:(UIButton *)sender {
    if ([self isCredentialsPairValid]) {
        NSLog(@"Existing user...");
        [self performSegueWithIdentifier:kSegueToEveryDo sender:self];
    }

    [SSKeychain setPassword:self.usernameTextField.text forService:kUsernameKey account:kServiceName];
    [SSKeychain setPassword:self.passwordTextField.text forService:kPasswordKey account:kServiceName];

    [self performSegueWithIdentifier:kSegueToEveryDo sender:self];
}

- (BOOL)isCredentialsPairValid {
    if ([[SSKeychain passwordForService:kUsernameKey account:kServiceName] isEqualToString:self.usernameTextField.text] &&
        [[SSKeychain passwordForService:kPasswordKey account:kServiceName] isEqualToString:self.passwordTextField.text]) {
        return YES;
    }

    return NO;
}

@end
