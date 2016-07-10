//
//  LHLCoreDataStack.h
//  EveryDo
//
//  Created by Willow Belle on 2015-11-11.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface LHLCoreDataStack : NSObject

@property (readonly, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
