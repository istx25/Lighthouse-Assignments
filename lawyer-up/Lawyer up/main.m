//
//  main.m
//  Lawyer up
//
//  Created by Willow Belle on 2015-10-22.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Practice.h"
#import "Lawyer.h"
#import "Client.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        Associate *firstAssociate = [[Associate alloc] init];
        Associate *secondAssociate = [[Associate alloc] init];

        Practice *gowlings = [[Practice alloc] init];
        Lawyer *firstLawyer = [[Lawyer alloc] init];
        firstLawyer.name = @"Stikeman Elliott";
        firstLawyer.speciality = SpecialityPatentLaw;
        firstLawyer.delegate = firstAssociate;
        firstLawyer.charge = [gowlings.rates objectForKey:[gowlings convertSpecialityEnumToString:SpecialityPatentLaw]];

        Lawyer *secondLawyer = [[Lawyer alloc] init];
        secondLawyer.name = @"Clark Wilson";
        secondLawyer.speciality = SpecialityCriminalLaw;
        secondLawyer.delegate = secondAssociate;
        secondLawyer.charge = [gowlings.rates objectForKey:[gowlings convertSpecialityEnumToString:SpecialityCriminalLaw]];

        [gowlings.lawyers addObjectsFromArray:@[firstLawyer, secondLawyer]];

        Client *firstClient = [[Client alloc] init];
        firstClient.name = @"Willow Belle";
        firstClient.specialityNeeded = SpecialityPatentLaw;
        firstClient.problemDescription = @"I need to have my awesome business idea patented.";

        Client *secondClient = [[Client alloc] init];
        secondClient.name = @"Gary Leon Ridgway";
        secondClient.specialityNeeded = SpecialityCriminalLaw;
        secondClient.problemDescription = @"I murdered 49 people, but I don't want to go away for it.";

        [firstLawyer addClient:firstClient];
        [firstLawyer getPayableAmountForClient:firstClient];
        NSLog(@"The first Client is being charged: %i", [firstLawyer getPayableAmountForClient:firstClient]);
        
        [secondLawyer addClient:secondClient];
        [secondLawyer getPayableAmountForClient:secondClient];
        NSLog(@"The second Client is being charged: %i", [secondLawyer getPayableAmountForClient:secondClient]);
    }

    return 0;
}
