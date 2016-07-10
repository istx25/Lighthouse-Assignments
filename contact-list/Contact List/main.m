//
//  main.m
//  Contact List
//
//  Created by Willow Belle on 2015-10-20.
//  Copyright © 2015 Cosmic Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "ContactList.h"
#import "Contact.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        ContactList *contactList = [[ContactList alloc] init];

        while (YES) {

            NSString *prompt = @"\nWhat would you like do next? \n \nnew - Create a new contact \nlist - List all contacts \nquit - Exit \n \n";

            InputCollector *collector = [[InputCollector alloc] init];
            printf("Application >");
            NSString *input = [collector inputForPrompt:prompt];


            if ([input isEqualToString:@"quit"]) {
                NSLog(@"Au revoir!");
                return 0;
            }

            if ([input isEqualToString:@"new"]) {
                Contact *contact = [[Contact alloc] init];

                NSString *nameInput = [collector inputForPrompt:@"Full Name "];
                contact.name = nameInput;

                NSString *emailInput = [collector inputForPrompt:@"Email "];
                contact.email = emailInput;
                
                [contactList addContact:contact];
            }

            if ([input isEqualToString:@"list"]) {
                [contactList listContacts];
            }
        }
        
    }
    
    return 0;
}