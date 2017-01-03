//
//  SessionData.m
//  GuideMe
//
//  Created by Ismael Felix Mendonça on 01/01/17.
//  Copyright © 2017 ALUNO. All rights reserved.
//

#import "SessionData.h"

@implementation SessionData

@synthesize loggedUser;

#pragma mark Singleton Methods
+ (id)sharedSessionData {
    static SessionData *sharedSessionData = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedSessionData = [[self alloc] init];
    });
    return sharedSessionData;
}

- (id)init {
    if (self = [super init]) {
        loggedUser = nil;
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

@end
