//
//  ViewController.m
//  Bill Splitter
//
//  Created by Willow Belle on 2015-10-31.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UITextField *billValueTextField;
@property (nonatomic, weak) IBOutlet UISlider *peopleSlider;
@property (nonatomic, weak) IBOutlet UILabel *pricePerPersonLabel;
@property (nonatomic, weak) IBOutlet UIButton *calculateButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
}

- (void)setupUI {
    self.calculateButton.enabled = NO;
    self.pricePerPersonLabel.hidden = YES;
}

- (IBAction)peopleSlider:(UISlider *)sender {
    NSUInteger sliderValue;
    sliderValue = lroundf(sender.value);
    [sender setValue:sliderValue animated:YES];
}

- (IBAction)calculateButtonPressed:(id)sender {
    NSDecimalNumber *price = [NSDecimalNumber decimalNumberWithString:self.billValueTextField.text];
    NSDecimalNumber *divisor = [NSDecimalNumber decimalNumberWithMantissa:self.peopleSlider.value exponent:0 isNegative:NO];
    NSDecimalNumber *contribution = [price decimalNumberByDividingBy:divisor];

    self.pricePerPersonLabel.hidden = NO;
    self.pricePerPersonLabel.text = [NSString stringWithFormat:@"Price Per Person: $%@ (%.0f people)", contribution, self.peopleSlider.value];
}

- (IBAction)textFieldDidChange:(id)sender {
    self.calculateButton.enabled = self.billValueTextField.text.length > 0;
}

@end
