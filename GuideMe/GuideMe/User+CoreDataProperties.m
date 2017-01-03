//
//  User+CoreDataProperties.m
//  GuideMe
//
//  Created by Ismael Felix Mendonça on 03/01/17.
//  Copyright © 2017 ALUNO. All rights reserved.
//

#import "User+CoreDataProperties.h"

@implementation User (CoreDataProperties)

+ (NSFetchRequest<User *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"User"];
}

@dynamic address;
@dynamic birthday;
@dynamic email;
@dynamic name;
@dynamic password;
@dynamic phoneNumber;
@dynamic profileImage;
@dynamic userName;
@dynamic contacts;

@end
