//
//  LHLCoreDataStack+Receipts.h
//  Receipts++
//
//  Created by Willow Belle on 2015-11-12.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "LHLCoreDataStack.h"
#import "Receipt.h"
#import "Tag.h"

@interface LHLCoreDataStack (Receipts)

- (Tag *)fetchTagWithName:(NSString *)name;

@end
