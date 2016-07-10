//
//  LPSViewController.h
//  PoliceSketch
//
//  Created by Steven Masuch on 2014-07-20.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LPSViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIImageView *eyesImageView;
@property (nonatomic, weak) IBOutlet UIImageView *noseImageView;
@property (nonatomic, weak) IBOutlet UIImageView *mouthImageView;

- (IBAction)rotateEyesForward:(UIButton *)sender;
- (IBAction)rotateEyesBackward:(UIButton *)sender;

- (IBAction)rotateNoseForward:(UIButton *)sender;
- (IBAction)rotateNoseBackward:(UIButton *)sender;

- (IBAction)rotateMouthForward:(UIButton *)sender;
- (IBAction)rotateMouthBackward:(UIButton *)sender;

@end
