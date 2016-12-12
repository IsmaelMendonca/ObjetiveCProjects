//
//  User+CoreDataProperties.h
//  GuideMe
//
//  Created by ADMINISTRADOR on 12/12/16.
//  Copyright © 2016 ALUNO. All rights reserved.
//

#import "User+CoreDataClass.h"
#import "Contact+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface User (CoreDataProperties)

+ (NSFetchRequest<User *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *phoneNumber;
@property (nullable, nonatomic, copy) NSString *email;
@property (nullable, nonatomic, copy) NSString *address;
@property (nullable, nonatomic, copy) NSDate *birthday;
@property (nullable, nonatomic, retain) Contact *contacts;

@end

NS_ASSUME_NONNULL_END
