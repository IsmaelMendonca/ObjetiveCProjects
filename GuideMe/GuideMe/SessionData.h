//
//  SessionData.h
//  GuideMe
//
//  Created by Ismael Felix Mendonça on 01/01/17.
//  Copyright © 2017 ALUNO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User+CoreDataClass.h"

@interface SessionData : NSObject {
    User* loggedUser;
}

@property (nonatomic, retain) User* loggedUser;
+ (id)sharedSessionData;
@end
