//
//  Associate.h
//  Lawyer up
//
//  Created by Willow Belle on 2015-10-22.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Lawyer;
@class Client;

@protocol AssociateDelegate <NSObject>

- (void)addClientToClientList:(Client *)client forLawyer:(Lawyer *)lawyer;
- (int)payableAmountForClient:(Client *)client forLawyer:(Lawyer *)lawyer;

@end

@interface Associate : NSObject <AssociateDelegate>

@end
