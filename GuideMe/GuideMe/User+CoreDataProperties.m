//
//  User+CoreDataProperties.m
//  GuideMe
//
//  Created by ADMINISTRADOR on 12/12/16.
//  Copyright © 2016 ALUNO. All rights reserved.
//

#import "User+CoreDataProperties.h"

@implementation User (CoreDataProperties)

+ (NSFetchRequest<User *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"User"];
}

@dynamic name;
@dynamic phoneNumber;
@dynamic email;
@dynamic address;
@dynamic birthday;
@dynamic contacts;

@end
