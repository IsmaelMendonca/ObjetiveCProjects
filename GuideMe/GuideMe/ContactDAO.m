//
//  ContactDAO.m
//  GuideMe
//
//  Created by Ismael Felix Mendonça on 27/12/16.
//  Copyright © 2016 ALUNO. All rights reserved.
//

#import "ContactDAO.h"
#import "UserDAO.h"

@implementation ContactDAO

//Retorna o contexto
+(NSManagedObjectContext*)getContext{
    AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    NSPersistentContainer *container = delegate.persistentContainer;
    NSManagedObjectContext *context = container.viewContext;
    [context setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
    
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

//Cria o objeto Contact
+(Contact*)createContact {
    Contact *contact = [NSEntityDescription insertNewObjectForEntityForName:@"Contact"
                                                   inManagedObjectContext:[self getContext]];

    
    return contact;
}

+(BOOL)removeAndSaveContact: (Contact*) contact {
    [[self getContext] deleteObject:contact];
    
    if(contact.isDeleted){
        [self saveContext];
    }
    
    return contact.isDeleted;
}

+(NSArray*)fetchAllContacts {
    //select * from Contact
    NSFetchRequest *fetch = [NSFetchRequest
                          fetchRequestWithEntityName:@"Contact"];
    
    NSError *fetchError;
    NSArray *result = [[self getContext] executeFetchRequest:fetch
                                                error:&fetchError];
    
    if (fetchError) {
        return nil;
    }
    
    return result;
}

+(NSArray*) fetchByUser : (User*) user {
    
    NSFetchRequest *fetch = [NSFetchRequest
                             fetchRequestWithEntityName:@"Contact"];
    
    // link do ❤️: http://nshipster.com/nspredicate/
    [fetch setPredicate:
     [NSPredicate predicateWithFormat:@"user.userName MATCHES %@", user.userName]];
    
    NSError *fetchError;
    NSArray *result = [[self getContext] executeFetchRequest:fetch
                                                       error:&fetchError];
    
    // order by validade ASC
    [fetch setSortDescriptors:
     @[[NSSortDescriptor sortDescriptorWithKey:@"contactName" ascending:YES]]];
    
    if (fetchError) {
        return nil;
    }
    
    return result;
}

+(BOOL) checkUniquePhoneNumber : (NSString*) phoneNumber ByUser : (User*) user {
    
    NSFetchRequest *fetch = [NSFetchRequest
                             fetchRequestWithEntityName:@"Contact"];
    
    // link do ❤️: http://nshipster.com/nspredicate/
    [fetch setPredicate:
     [NSPredicate predicateWithFormat:@"contactPhoneNumber MATCHES %@ AND user.userName MATCHES %@", phoneNumber, user.userName]];
    
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
