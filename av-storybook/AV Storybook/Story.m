//
//  Story.m
//  AV Storybook
//
//  Created by Willow Belle on 2015-11-07.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "Story.h"
#import "Page.h"

@interface Story ()

@property (nonatomic) NSMutableArray *pages;
@property int currentPageIndex;

@end

@implementation Story

- (instancetype)init {
    self = [super init];

    if (self) {
        _currentPageIndex = 1;
    }

    return self;
}

- (NSMutableArray *)pages {
    if (!_pages) {
        _pages = [NSMutableArray array];
        [_pages addObject:[Page new]];
    }

    return _pages;
}

- (BOOL)isCurrentPageFirstPage {
    if (self.currentPageIndex == 1) {
        return YES;
    }

    return NO;
}

- (Page *)getCurrentPage {
    if (self.pages.count >= 1) {
        if (self.pages.count >= self.currentPageIndex) {
            NSLog(@"Current Index is greater than the total amount of pages.");
        }

        return [self.pages objectAtIndex:(self.currentPageIndex - 1)];
    }

    Page *newPage = [Page new];
    [self.pages addObject:newPage];

    return newPage;
}

- (Page *)getNextPage {

    if (self.pages.count == self.currentPageIndex) {
        Page *newPage = [Page new];
        [self.pages addObject:newPage];

        self.currentPageIndex++;
    }

    return [self.pages objectAtIndex:(self.currentPageIndex - 1)];
}

- (Page *)getPreviousPage {
    if (self.currentPageIndex == 1) {
        return [self.pages objectAtIndex:(self.currentPageIndex - 1)];
    }

    self.currentPageIndex -= 1;

    return [self.pages objectAtIndex:(self.currentPageIndex - 1)];
}


@end
