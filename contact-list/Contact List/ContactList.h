//
//  ContactList.h
//  Contact List
//
//  Created by Willow Belle on 2015-10-20.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@interface ContactList : NSObject

@property (nonatomic, retain) NSMutableArray *list;

- (void)addContact:(Contact *)newContact;
- (void)listContacts;

@end
