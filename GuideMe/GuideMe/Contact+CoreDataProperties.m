//
//  Contact+CoreDataProperties.m
//  GuideMe
//
//  Created by Ismael Felix Mendonça on 30/12/16.
//  Copyright © 2016 ALUNO. All rights reserved.
//

#import "Contact+CoreDataProperties.h"

@implementation Contact (CoreDataProperties)

+ (NSFetchRequest<Contact *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Contact"];
}

@dynamic contactDescription;
@dynamic contactEmail;
@dynamic contactName;
@dynamic contactNotification;
@dynamic contactPhoneNumber;
@dynamic profileImage;
@dynamic user;

@end
