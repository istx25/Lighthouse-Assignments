//
//  Lawyer.h
//  Lawyer up
//
//  Created by Willow Belle on 2015-10-22.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Associate.h"
#import "Practice.h"
@class Client;

@interface Lawyer : NSObject

@property (nonatomic) NSString *name;
@property Speciality speciality;
@property NSNumber *charge;

@property (nonatomic) NSMutableArray *clientList;
@property id<AssociateDelegate> delegate;

- (void)addClient:(Client *)client;
- (int)getPayableAmountForClient:(Client *)client;

@end
