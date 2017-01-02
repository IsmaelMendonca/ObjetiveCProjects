//
//  UserDAO.m
//  GuideMe
//
//  Created by Ismael Felix Mendonça on 30/12/16.
//  Copyright © 2016 ALUNO. All rights reserved.
//

#import "UserDAO.h"

@implementation UserDAO

//Retorna o contexto
+(NSManagedObjectContext*)getContext{
    AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    NSPersistentContainer *container = delegate.persistentContainer;
    NSManagedObjectContext *context = container.viewContext;
    [context setMergePolicy:NSErrorMergePolicy];
    
    return context;
}

+(BOOL)saveContext {
    NSManagedObjectContext* context = [self getContext];
    
    NSError *saveError;
    
    if (![context save:&saveError]) {  
        return NO;
    }
    
    return YES;
}

//Cria o objeto User
+(User*)createUser {
    User *user = [NSEntityDescription insertNewObjectForEntityForName:@"User"
                                                     inManagedObjectContext:[self getContext]];
    
    return user;
}

+(BOOL)removeAndSaveUser:(User *)user {
    [[self getContext] deleteObject:user];
    
    if(user.isDeleted){
        [self saveContext];
    }
    
    return user.isDeleted;
}

+(NSArray*)fetchAllUsers {
    //select * from User
    NSFetchRequest *fetch = [NSFetchRequest
                             fetchRequestWithEntityName:@"User"];
    
    NSError *fetchError;
    NSArray *result = [[self getContext] executeFetchRequest:fetch
                                                       error:&fetchError];
    
    if (fetchError) {
        return nil;
    }
    
    return result;
}

+(User*) fetchUserByUserName : (NSString*) userName AndPassword : (NSString*) password {
    //select * from Produto
    NSFetchRequest *fetch = [NSFetchRequest
                          fetchRequestWithEntityName:@"User"];
    
    // link do ❤️: http://nshipster.com/nspredicate/
    [fetch setPredicate:
     [NSPredicate predicateWithFormat:@"userName MATCHES %@ AND password MATCHES %@", userName, password]];
    
    NSError *fetchError;
    NSArray *result = [[self getContext] executeFetchRequest:fetch
                                                       error:&fetchError];
    
    if (fetchError) {
        return nil;
    }
    
    return (User*) [result firstObject];
}

+(BOOL) checkUserName : (NSString*) userName {
    NSFetchRequest *fetch = [NSFetchRequest
                             fetchRequestWithEntityName:@"User"];
    
    // link do ❤️: http://nshipster.com/nspredicate/
    [fetch setPredicate:
     [NSPredicate predicateWithFormat:@"userName MATCHES %@", userName]];
    
    NSError *fetchError;
    NSArray *result = [[self getContext] executeFetchRequest:fetch
                                                       error:&fetchError];
    
    if (fetchError) {
        return NO;
    }
    
    if([result count] > 0) {
        return NO;
    }
    
    return YES;
}
@end
