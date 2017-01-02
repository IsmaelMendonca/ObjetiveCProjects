//
//  UserDAO.h
//  GuideMe
//
//  Created by Ismael Felix Mendonça on 30/12/16.
//  Copyright © 2016 ALUNO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User+CoreDataClass.h"
#import "AppDelegate.h"

@interface UserDAO : NSObject
+(BOOL)saveContext;
+(User*)createUser;
+(BOOL)removeAndSaveUser: (User*) user;
+(NSArray*)fetchAllUsers;
+(User*) fetchUserByUserName : (NSString*) userName AndPassword : (NSString*) password;
+(BOOL) checkUserName : (NSString*) userName;
@end
