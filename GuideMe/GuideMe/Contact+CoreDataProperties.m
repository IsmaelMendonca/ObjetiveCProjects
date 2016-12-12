//
//  Contact+CoreDataProperties.m
//  GuideMe
//
//  Created by ADMINISTRADOR on 12/12/16.
//  Copyright © 2016 ALUNO. All rights reserved.
//

#import "Contact+CoreDataProperties.h"

@implementation Contact (CoreDataProperties)

+ (NSFetchRequest<Contact *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Contact"];
}

@dynamic name;
@dynamic phoneNumber;
@dynamic email;
@dynamic contactDescription;
@dynamic getContactNotification;
@dynamic user;

@end
