//
//  Practice.m
//  Lawyer up
//
//  Created by Willow Belle on 2015-10-22.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "Practice.h"

@implementation Practice

- (instancetype)init {
    self = [super init];
    if (self) {
        self.rates = @{[self convertSpecialityEnumToString:SpecialityFamilyLaw]: @200.00,
                       [self convertSpecialityEnumToString:SpecialityPatentLaw]: @380.50,
                       [self convertSpecialityEnumToString:SpecialityCriminalLaw]: @405.99,
                       [self convertSpecialityEnumToString:SpecialityCorporateLaw]: @400.00};
    }

    return self;
}

- (NSString *)convertSpecialityEnumToString:(Speciality)speciality {
    if (speciality == SpecialityFamilyLaw) {
        return @"Family Law";
    }

    if (speciality == SpecialityPatentLaw) {
        return @"Patent Law";
    }

    if (speciality == SpecialityCriminalLaw) {
        return @"Criminal Law";
    }

    if (speciality == SpecialityPatentLaw) {
        return @"Corporate Law";
    }

    return @"There was an exception.";
}

@end
