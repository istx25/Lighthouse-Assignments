//
//  Patient.h
//  Patient and Doctor
//
//  Created by Willow Belle on 2015-10-22.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Patient : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *gender;
@property int age;

@property BOOL hasHealthCard;
@property (nonatomic) NSArray *symptoms;


- (instancetype)initWithName:(NSString *)name gender: (NSString *)gender age: (int)age hasHealthCard: (BOOL)card symptoms: (NSArray *)symptoms;

@end
