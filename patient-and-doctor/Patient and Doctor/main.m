//
//  main.m
//  Patient and Doctor
//
//  Created by Willow Belle on 2015-10-22.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Doctor.h"
#import "Patient.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Doctor *doctor = [[Doctor alloc] initWithSpecialization:@"Hematologist" name:@"Dr. David B. Dix"];
        Patient *patient = [[Patient alloc] initWithName:@"Willow" gender:@"pineapple" age:17 hasHealthCard:YES symptoms:@[@"cold"]];
        [doctor willAcceptPatient:patient];
        [doctor requestMedication:patient];
    }
    
    return 0;
}
