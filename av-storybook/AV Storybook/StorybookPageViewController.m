//
//  StorybookPageViewController.m
//  AV Storybook
//
//  Created by Willow Belle on 2015-11-06.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "StorybookPageViewController.h"
#import "StoryPartViewController.h"
#import "Story.h"

static NSString *kStoryPartViewControllerIdentifier = @"storyPartViewController";

@interface StorybookPageViewController () <UIPageViewControllerDataSource>

@property (nonatomic, strong) NSArray *controllers;
@property (nonatomic) Story *story;

@end

@implementation StorybookPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.dataSource = self;

    self.story = [Story new];

    StoryPartViewController *storyPart = [self.storyboard instantiateViewControllerWithIdentifier:kStoryPartViewControllerIdentifier];
    StoryPartViewController *secondPage = [self.storyboard instantiateViewControllerWithIdentifier:kStoryPartViewControllerIdentifier];
    StoryPartViewController *thirdPage = [self.storyboard instantiateViewControllerWithIdentifier:kStoryPartViewControllerIdentifier];
//    StoryPartViewController *fourthPage = [self.storyboard instantiateViewControllerWithIdentifier:@"storyPartViewController"];
//    StoryPartViewController *fifthPage = [self.storyboard instantiateViewControllerWithIdentifier:@"storyPartViewController"];

    self.controllers = @[storyPart, secondPage, thirdPage];
    secondPage.delegate = [self.story getCurrentPage];
    [self setViewControllers:@[secondPage] direction:(UIPageViewControllerNavigationDirectionForward) animated:YES completion:nil];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {

    StoryPartViewController *newPart = (StoryPartViewController *)[self.controllers objectAtIndex:1];
    newPart.delegate = [self.story getNextPage];

    return newPart;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {

    // Return nil if we're on the first page
    if ([self.story isCurrentPageFirstPage]) {
        return nil;
    }

    StoryPartViewController *newPart = (StoryPartViewController *)[self.controllers objectAtIndex:0];
    newPart.delegate = [self.story getPreviousPage];

    return newPart;

//    NSInteger index = [self.controllers indexOfObject:viewController];
//    index--;
//
//    if (index < 0) {
//        return nil;
//    }
//
//    return self.controllers[index];
}

@end
