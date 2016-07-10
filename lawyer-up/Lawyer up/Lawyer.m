//
//  Lawyer.m
//  Lawyer up
//
//  Created by Willow Belle on 2015-10-22.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "Lawyer.h"

@implementation Lawyer

- (instancetype)init {
    self = [super init];
    if (self) {
        self.clientList = [[NSMutableArray alloc] init];

    }
    return self;
}

- (void)addClient:(Client *)client {
    [self.delegate addClientToClientList:client forLawyer:self];
}

- (int)getPayableAmountForClient:(Client *)client {
    return [self.delegate payableAmountForClient:client forLawyer:self];
}

@end
