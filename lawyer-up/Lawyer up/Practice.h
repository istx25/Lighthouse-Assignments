//
//  Practice.h
//  Lawyer up
//
//  Created by Willow Belle on 2015-10-22.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum: NSUInteger {
    SpecialityFamilyLaw,
    SpecialityPatentLaw,
    SpecialityCriminalLaw,
    SpecialityCorporateLaw
} Speciality;

@interface Practice : NSObject

@property (nonatomic) NSMutableArray *lawyers;
@property (nonatomic) NSDictionary *rates;

- (NSString *)convertSpecialityEnumToString:(Speciality)speciality;

@end
