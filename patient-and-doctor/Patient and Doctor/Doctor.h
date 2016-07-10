//
//  Doctor.h
//  Patient and Doctor
//
//  Created by Willow Belle on 2015-10-22.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Patient;

@interface Doctor : NSObject

@property (nonatomic) NSString *specialization;
@property (nonatomic) NSString *name;

@property (nonatomic) NSMutableArray *acceptedPatients;
@property (nonatomic) NSDictionary *prescriptions;

- (instancetype)initWithSpecialization:(NSString *)specialization name: (NSString *)name;
- (BOOL)willAcceptPatient:(Patient *)patient;
- (void)requestMedication:(Patient *)patient;

@end
