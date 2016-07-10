//
//  LighthouseAPI.h
//  Rotten Mangoes
//
//  Created by Willow Belle on 2015-11-10.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Movie;

@interface LighthouseAPI : NSObject

+ (void)fetchTheatresWithAddress:(NSString *)address andMovie:(Movie *)movie withCompletionHandler:(void (^)(NSArray *))completionHandler;

@end
