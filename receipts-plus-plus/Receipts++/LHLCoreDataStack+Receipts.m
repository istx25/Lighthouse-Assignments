//
//  LHLCoreDataStack+Receipts.m
//  Receipts++
//
//  Created by Willow Belle on 2015-11-12.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "LHLCoreDataStack+Receipts.h"

@implementation LHLCoreDataStack (Receipts)

- (Tag *)fetchTagWithName:(NSString *)name {
    return (Tag *)[self fetchObjectWithEntity:@"Tag" key:@"name" andValue:name];
}

@end
