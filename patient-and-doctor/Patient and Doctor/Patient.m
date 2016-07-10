//
//  Patient.m
//  Patient and Doctor
//
//  Created by Willow Belle on 2015-10-22.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "Patient.h"

@implementation Patient

- (instancetype)initWithName:(NSString *)name gender: (NSString *)gender age: (int)age hasHealthCard: (BOOL)card symptoms: (NSArray *)symptoms; {
    self.name = name;
    self.gender = gender;
    self.age = age;
    self.hasHealthCard = card;
    self.symptoms = symptoms;

    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Name: %@, Gender: %@, Age: %i", self.name, self.gender, self.age];
}

@end
