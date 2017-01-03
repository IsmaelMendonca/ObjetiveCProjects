//
//  User+CoreDataProperties.h
//  GuideMe
//
//  Created by Ismael Felix Mendonça on 03/01/17.
//  Copyright © 2017 ALUNO. All rights reserved.
//

#import "User+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface User (CoreDataProperties)

+ (NSFetchRequest<User *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *address;
@property (nullable, nonatomic, copy) NSDate *birthday;
@property (nullable, nonatomic, copy) NSString *email;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *password;
@property (nullable, nonatomic, copy) NSString *phoneNumber;
@property (nullable, nonatomic, retain) NSData *profileImage;
@property (nullable, nonatomic, copy) NSString *userName;
@property (nullable, nonatomic, retain) NSSet<Contact *> *contacts;

@end

@interface User (CoreDataGeneratedAccessors)

- (void)addContactsObject:(Contact *)value;
- (void)removeContactsObject:(Contact *)value;
- (void)addContacts:(NSSet<Contact *> *)values;
- (void)removeContacts:(NSSet<Contact *> *)values;

@end

NS_ASSUME_NONNULL_END
