//
//  Todo+CoreDataProperties.h
//  EveryDo
//
//  Created by Willow Belle on 2015-11-11.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Todo.h"

NS_ASSUME_NONNULL_BEGIN

@interface Todo (CoreDataProperties)

@property (nonatomic) BOOL status;
@property (nullable, nonatomic, retain) NSString *task;
@property (nullable, nonatomic, retain) NSString *category;

@end

NS_ASSUME_NONNULL_END
