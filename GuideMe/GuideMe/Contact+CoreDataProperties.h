//
//  Contact+CoreDataProperties.h
//  GuideMe
//
//  Created by Ismael Felix Mendonça on 27/12/16.
//  Copyright © 2016 ALUNO. All rights reserved.
//

#import "Contact+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Contact (CoreDataProperties)

+ (NSFetchRequest<Contact *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *contactDescription;
@property (nullable, nonatomic, copy) NSString *email;
@property (nonatomic) BOOL getContactNotification;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *phoneNumber;
@property (nullable, nonatomic, retain) User *user;

@end

NS_ASSUME_NONNULL_END
