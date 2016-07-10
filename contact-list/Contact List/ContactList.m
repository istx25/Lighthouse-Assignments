//
//  ContactList.m
//  Contact List
//
//  Created by Willow Belle on 2015-10-20.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import "ContactList.h"

@implementation ContactList

- (instancetype)init
{
    self = [super init];
    if (self) {

        self.list = [[NSMutableArray alloc] init];
    }

    return self;
}

- (void)addContact:(Contact *)newContact {
    [self.list addObject:newContact];
}

- (void)listContacts {
    NSUInteger index = 0;
    for (Contact *contact in self.list) {
        NSLog(@"%lu: %@ (%@)", (unsigned long)index, contact.name, contact.email);
        index++;
    }
}

@end
