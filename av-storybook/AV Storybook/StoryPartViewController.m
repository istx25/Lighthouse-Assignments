//
//  ViewController.m
//  AV Storybook
//
//  Created by Willow Belle on 2015-11-06.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "StoryPartViewController.h"
#import "Page.h"

@interface StoryPartViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate, AVAudioPlayerDelegate>

@property (nonatomic, weak) IBOutlet UIImageView *pageImageView;
@property (nonatomic, weak) IBOutlet UIButton *captureImageButton;
@property (nonatomic, weak) IBOutlet UIButton *recordAudioButton;

@property (nonatomic) UIImagePickerController *imagePicker;
@property (nonatomic, strong) AVAudioPlayer *player;
@property (nonatomic) AVAudioRecorder *recorder;
@property (nonatomic) Page *page;

@end

@implementation StoryPartViewController

#pragma mark - Controller Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];

//    self.page = [Page new];
    [self.imagePicker setDelegate:self];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.view setNeedsDisplay];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.player stop];
}

#pragma mark - Lazy Instantiation
- (UIImagePickerController *)imagePicker {
    if (!_imagePicker) {
        _imagePicker = [UIImagePickerController new];
    }

    return _imagePicker;
}

- (AVAudioRecorder *)recorder {
    if (!_recorder) {
        NSArray *pathComponents = [NSArray arrayWithObjects:
                                   [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject],
                                   [NSString stringWithFormat:@"audio-%i", arc4random()], nil];

        NSURL *outputFileURL = [NSURL fileURLWithPathComponents:pathComponents];

        NSMutableDictionary *recordSetting = [[NSMutableDictionary alloc] init];
        [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
        [recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
        [recordSetting setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];

        _recorder = [[AVAudioRecorder alloc] initWithURL:outputFileURL settings:recordSetting error:nil];
        [_recorder prepareToRecord];
    }
    
    return _recorder;
}

#pragma mark - Actions
- (IBAction)captureImageButtonPressed:(UIButton *)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];

    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [alert addAction:[UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self.imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
            [self presentViewController:self.imagePicker animated:YES completion:nil];
        }]];
    }

    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        [alert addAction:[UIAlertAction actionWithTitle:@"Photo Library" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self.imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
            [self presentViewController:self.imagePicker animated:YES completion:nil];
        }]];
    }

    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)recordAudioButtonPressed:(UIButton *)sender {
    if (self.player.isPlaying) {
        [self.player stop];
    }

    if (!self.recorder.isRecording) {
        AVAudioSession *session = [AVAudioSession sharedInstance];
        [session setActive:YES error:nil];
        [self.recorder record];
        [self.recordAudioButton setTitle:@"Stop" forState:UIControlStateNormal];

        return;
    }

    if (self.recorder.isRecording) {
        [self.recorder stop];

        [self.delegate addAudioAssetForPage:[AVURLAsset URLAssetWithURL:self.recorder.url options:nil]];
        [self.recordAudioButton setTitle:@"Record" forState:UIControlStateNormal];

        return;
    }
}

- (IBAction)pageImageViewTapped:(UITapGestureRecognizer *)sender {
    NSLog(@"%@", self.page.audioAsset.URL);
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:[self.delegate getAudioAssetForPage].URL error:nil];
    [self.player setDelegate:self];
    [self.player play];
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [self.imagePicker dismissViewControllerAnimated:YES completion:nil];
    [self.delegate addImageForPage:(UIImage *)info[UIImagePickerControllerOriginalImage]];
    [self.pageImageView setImage:[self.delegate getImageForPage]];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self.imagePicker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - AVAudioPlayerDelegate
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    self.player.numberOfLoops = -1;
    [self.player play];
}

@end
