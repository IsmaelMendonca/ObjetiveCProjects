//
//  Contact+CoreDataProperties.h
//  GuideMe
//
//  Created by Ismael Felix Mendonça on 03/01/17.
//  Copyright © 2017 ALUNO. All rights reserved.
//

#import "Contact+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Contact (CoreDataProperties)

+ (NSFetchRequest<Contact *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *contactDescription;
@property (nullable, nonatomic, copy) NSString *contactEmail;
@property (nullable, nonatomic, copy) NSString *contactName;
@property (nonatomic) NSNumber* contactNotification;
@property (nullable, nonatomic, copy) NSString *contactPhoneNumber;
@property (nullable, nonatomic, retain) NSData *profileImage;
@property (nullable, nonatomic, retain) User *user;

@end

NS_ASSUME_NONNULL_END
