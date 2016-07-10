//
//  Client.h
//  Lawyer up
//
//  Created by Willow Belle on 2015-10-22.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Practice.h"

@interface Client : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *problemDescription;
@property Speciality specialityNeeded;

@end
