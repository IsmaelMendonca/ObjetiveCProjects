//
//  User+CoreDataProperties.m
//  GuideMe
//
//  Created by Ismael Felix Mendonça on 30/12/16.
//  Copyright © 2016 ALUNO. All rights reserved.
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
@dynamic phoneNumber;
@dynamic profileImage;
@dynamic userName;
@dynamic password;
@dynamic contacts;

@end
