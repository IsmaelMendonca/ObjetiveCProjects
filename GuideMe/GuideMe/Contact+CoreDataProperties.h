//
//  Contact+CoreDataProperties.h
//  GuideMe
//
//  Created by ADMINISTRADOR on 12/12/16.
//  Copyright © 2016 ALUNO. All rights reserved.
//

#import "Contact+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Contact (CoreDataProperties)

+ (NSFetchRequest<Contact *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *phoneNumber;
@property (nullable, nonatomic, copy) NSString *email;
@property (nullable, nonatomic, copy) NSString *contactDescription;
@property (nonatomic) BOOL getContactNotification;
@property (nullable, nonatomic, retain) User *user;

@end

NS_ASSUME_NONNULL_END
