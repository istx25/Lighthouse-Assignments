//
//  Room.h
//  Exercise
//
//  Created by Willow Belle on 2015-11-13.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Realm/Realm.h>
#import "Furniture.h"

@interface Room : RLMObject

@property (nonatomic) NSString *name;
@property RLMArray<Furniture *><Furniture> *furnitureItems;

@end

RLM_ARRAY_TYPE(Room)
