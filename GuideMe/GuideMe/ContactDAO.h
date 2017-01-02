//
//  ContactDAO.h
//  GuideMe
//
//  Created by Ismael Felix Mendonça on 27/12/16.
//  Copyright © 2016 ALUNO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact+CoreDataClass.h"
#import "AppDelegate.h"

@interface ContactDAO : NSObject
+(BOOL)saveContext;
+(Contact*)createContact;
+(BOOL)removeAndSaveContact: (Contact*) contact;
+(NSArray*)fetchAllContacts;
+(BOOL) checkUniquePhoneNumber : (NSString*) phoneNumber ByUser : (User*) user;
+(NSArray*) fetchByUser : (User*) user;
@end
