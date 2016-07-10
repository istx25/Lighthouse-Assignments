//
//  Story.h
//  AV Storybook
//
//  Created by Willow Belle on 2015-11-07.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Page;

@interface Story : NSObject

//- (instancetype)initWithPage:(Page *)page;
- (void)addPage:(Page *)page;

- (BOOL)isCurrentPageFirstPage;
- (Page *)getCurrentPage;
- (Page *)getNextPage;
- (Page *)getPreviousPage;

@end
