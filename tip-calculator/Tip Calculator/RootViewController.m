//
//  ViewController.m
//  Tip Calculator
//
//  Created by Willow Belle on 2015-10-30.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@property (nonatomic, weak) IBOutlet UITextField *billAmountTextField;
@property (nonatomic, weak) IBOutlet UIButton *calculateTipButton;
@property (nonatomic, weak) IBOutlet UILabel *tipAmountLabel;
@property (nonatomic, weak) IBOutlet UISlider *adjustTipPercentage;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
}

- (void)setupUI {
    self.calculateTipButton.enabled = NO;
    self.tipAmountLabel.hidden = YES;
}

- (IBAction)calculateTipPressed:(id)sender {
    CGFloat calculation = [self.billAmountTextField.text floatValue] * self.adjustTipPercentage.value;
    self.tipAmountLabel.hidden = NO;
    self.tipAmountLabel.text = [NSString stringWithFormat:@"Tip Amount: $%.02f", calculation];
}

- (IBAction)textFieldDidChange:(id)sender {
    self.calculateTipButton.enabled = self.billAmountTextField.text.length > 0;
}

@end
