//
//  DetailViewController.h
//  EveryDo
//
//  Created by Willow Belle on 2015-11-11.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHLCoreDataStack.h"

@class Todo;

@interface DetailViewController : UIViewController

@property (nonatomic) LHLCoreDataStack *stack;
@property (nonatomic) Todo *todo;

@end

