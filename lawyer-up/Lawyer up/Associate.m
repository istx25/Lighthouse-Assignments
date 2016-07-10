//
//  Associate.m
//  Lawyer up
//
//  Created by Willow Belle on 2015-10-22.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "Associate.h"
#import "Lawyer.h"
#import "Client.h"

@implementation Associate

- (void)addClientToClientList:(Client *)client forLawyer:(Lawyer *)lawyer {
    [lawyer.clientList addObject:client];
}

- (int)payableAmountForClient:(Client *)client forLawyer:(Lawyer *)lawyer {
    if (client.problemDescription.length <= 9) {
        return [lawyer.charge intValue] * 5;
    }

    if (client.problemDescription.length >= 10 && client.problemDescription.length <= 20) {
        return [lawyer.charge intValue] * 10;
    }

    if (client.problemDescription.length > 20) {
        return [lawyer.charge intValue] * 25;
    }

    return 0;
}

@end
