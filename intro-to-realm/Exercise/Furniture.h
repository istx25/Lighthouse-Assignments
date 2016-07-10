//
//  Furniture.h
//  Exercise
//
//  Created by Willow Belle on 2015-11-13.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Realm/Realm.h>

@interface Furniture : RLMObject

@property (nonatomic) NSString *name;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Furniture>
RLM_ARRAY_TYPE(Furniture)
