//
//  Roles.h
//  Mafia Mini Games
//
//  Created by Willow Belle on 2015-10-28.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Roles : NSObject

@property (nonatomic) NSNumber *innocentVillagers;
@property (nonatomic) NSNumber *mafiaMembers;

- (instancetype)initWithMafiaMembers:(NSNumber *)mafiaMembers andInnocentVillagers:(NSNumber *)villagers;

@end
