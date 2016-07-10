//
//  LHLCoreDataStack.h
//  Receipts++
//
//  Created by Willow Belle on 2015-11-12.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface LHLCoreDataStack : NSObject

@property (readonly, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
- (NSManagedObject *)fetchObjectWithEntity:(NSString *)entity key:(NSString *)key andValue:(NSString *)value;

@end
