//
//  Contact+CoreDataProperties.m
//  GuideMe
//
//  Created by Ismael Felix Mendonça on 27/12/16.
//  Copyright © 2016 ALUNO. All rights reserved.
//

#import "Contact+CoreDataProperties.h"

@implementation Contact (CoreDataProperties)

+ (NSFetchRequest<Contact *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Contact"];
}

@dynamic contactDescription;
@dynamic email;
@dynamic getContactNotification;
@dynamic name;
@dynamic phoneNumber;
@dynamic user;

@end
