//
//  LHLOrderedDictionary.m
//
//  Created by Willow Belle on 2015-10-31.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "LHLOrderedDictionary.h"

@interface LHLOrderedDictionary () {
    NSMutableDictionary *ordered;
}

@end

@implementation LHLOrderedDictionary

- (instancetype)orderedDictionaryWithDictionary:(NSDictionary *)dictionary {
    NSMutableArray *entries = [NSMutableArray new];

    for (NSString *key in dictionary) {
        NSString *keyValuePair = [key stringByAppendingString:[NSString stringWithFormat:@"!%@", [dictionary objectForKey:key]]];
        [entries addObject:keyValuePair];
    }

    NSArray *alphabeticallyOrganized = [entries sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString* obj2) {
        char first = [obj1 characterAtIndex:0];
        char second = [obj2 characterAtIndex:0];

        if (first > second) {
            return NSOrderedDescending;
        }

        if (first < second) {
            return NSOrderedAscending;
        }

        return NSOrderedSame;
    }];

    ordered = [NSMutableDictionary new];

    for (NSString *items in alphabeticallyOrganized) {
        NSArray *keyValueArray = [items componentsSeparatedByString:@"!"];
        NSDictionary *keyValueDictionary = @{keyValueArray[0]: keyValueArray[1]};
        [ordered addEntriesFromDictionary:keyValueDictionary];
    }

    return (LHLOrderedDictionary *)ordered;
}

- (void)setObject:(id)object forKey:(NSString *)key{
    return [ordered setObject:object forKey:key];
}

- (id)objectForKey:(NSString *)key {
    return [ordered objectForKey:key];
}

- (NSString *)keyAtIndex:(NSInteger)index {
    __block int i = 0;
    __block NSString *otherKey;

    [ordered enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (i == index) {
            otherKey = [NSString stringWithString:[ordered objectForKey:key]];
        }

        if (i != index) {
            i++;
        }
    }];

    return otherKey;
}

- (NSInteger)indexOfKey:(NSString *)key {
    __block int index = 0;

    [ordered enumerateKeysAndObjectsUsingBlock:^(id blockKey, id obj, BOOL *stop) {
        int temporaryIndex = 0;

        if ([[ordered objectForKey:blockKey] isEqual:key]) {
            index = temporaryIndex;
        }

        if (![[ordered objectForKey:blockKey] isEqual:key]) {
            temporaryIndex++;
        }
    }];

    return index;
}

- (NSUInteger)count {
    __block int index = 0;
    [ordered enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        index++;
    }];

    return index;
}

@end
