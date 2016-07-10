//
//  ViewController.m
//  2 Player Math
//
//  Created by Willow Belle on 2015-10-26.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "ViewController.h"
#import "GameModel.h"

@interface ViewController ()

// MARK: - Outlets
@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *displayLabel;

@property (nonatomic, weak) IBOutlet UILabel *playerOnePointsLabel;
@property (nonatomic, weak) IBOutlet UILabel *playerTwoPointsLabel;
@property (nonatomic, weak) IBOutlet UILabel *playerOneLivesLabel;
@property (nonatomic, weak) IBOutlet UILabel *playerTwoLivesLabel;

@property (nonatomic) GameModel *model;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _model = [GameModel new];

    [self setupQuestion];
    [self setupUI];
}

- (void)setupUI {
    self.questionLabel.text = [NSString stringWithFormat:@"%@: %i + %i?", self.model.currentPlayer, self.model.firstValueInEquation, self.model.secondValueInEquation];
    self.playerOnePointsLabel.text = [NSString stringWithFormat:@"P1 Points: %i", self.model.firstPlayer.points];
    self.playerTwoPointsLabel.text = [NSString stringWithFormat:@"P2 Points: %i", self.model.secondPlayer.points];
    self.playerOneLivesLabel.text = [NSString stringWithFormat:@"P1 Lives: %i", self.model.firstPlayer.lives];
    self.playerTwoLivesLabel.text = [NSString stringWithFormat:@"P2 Lives: %i", self.model.secondPlayer.lives];
    self.displayLabel.text = [NSString stringWithFormat:@"Provided Answer: %i", [self.model.displayValue intValue]];

    [self restartGame];
}

- (void)setupQuestion {
    [self.model generateQuestion];
}

- (void)newQuestion {
    [self setupQuestion];
    [self setupUI];
    [self restartGame];
    self.model.displayValue = @"";
}

- (void)newGame {
    [self setupQuestion];
    self.model.firstPlayer.points = 0;
    self.model.secondPlayer.points = 0;
    self.model.firstPlayer.lives = 3;
    self.model.secondPlayer.lives = 3;
    self.model.displayValue = @"";
    [self setupUI];
}

- (void)restartGame {
    if ([self.model isGameOver]) {
        UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Game over" message:@"This game is over." preferredStyle:UIAlertControllerStyleAlert];
        [controller addAction:[UIAlertAction actionWithTitle:@"Start New Game" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self newGame];
        }]];

        [self presentViewController:controller animated:YES completion:nil];
    }
}

- (IBAction)enterButtonAction:(UIButton *)sender {
    [self.model nextPlayer];
    [self.model checkAnswer:[self.model.displayValue intValue]];
    [self newQuestion];
}

- (IBAction)buttonOneAction:(UIButton *)sender {
    [self.model addToDisplayValue:1];
    [self setupUI];
}

- (IBAction)buttonTwoAction:(UIButton *)sender {
    [self.model addToDisplayValue:2];
    [self setupUI];
}

- (IBAction)buttonThreeAction:(UIButton *)sender {
    [self.model addToDisplayValue:3];
    [self setupUI];
}

- (IBAction)buttonFourAction:(UIButton *)sender {
    [self.model addToDisplayValue:4];
    [self setupUI];
}

- (IBAction)buttonFiveAction:(UIButton *)sender {
    [self.model addToDisplayValue:5];
    [self setupUI];
}

- (IBAction)buttonSixAction:(UIButton *)sender {
    [self.model addToDisplayValue:6];
    [self setupUI];
}

- (IBAction)buttonSevenAction:(UIButton *)sender {
    [self.model addToDisplayValue:7];
    [self setupUI];
}

- (IBAction)buttonEightAction:(UIButton *)sender {
    [self.model addToDisplayValue:8];
    [self setupUI];
}

- (IBAction)buttonNineAction:(UIButton *)sender {
    [self.model addToDisplayValue:9];
    [self setupUI];
}

- (IBAction)buttonZeroAction:(UIButton *)sender {
    [self.model addToDisplayValue:0];
    [self setupUI];
}

@end