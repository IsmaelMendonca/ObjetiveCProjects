//
//  ContactDAO.m
//  GuideMe
//
//  Created by Ismael Felix Mendonça on 27/12/16.
//  Copyright © 2016 ALUNO. All rights reserved.
//

#import "ContactDAO.h"

@implementation ContactDAO

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
        NSException* saveException = [NSException
                                      exceptionWithName:@"SaveException"
                                      reason:[NSString stringWithFormat:@"Erro ao salvar o contexto: %@", saveError]
                                      userInfo:nil];
        @throw saveException;
        
        return NO;
    }
    
    return YES;
}

//Cria o objeto Contact
+(Contact*)createAndSaveContact {
    Contact *contact = [NSEntityDescription insertNewObjectForEntityForName:@"Contact"
                                                   inManagedObjectContext:[self getContext]];
    @try {
        [self saveContext];
    } @catch (NSException *exception) {
        @throw exception;
    }
    return contact;
}

+(BOOL)removeAndSaveContact: (Contact*) contact {
    [[self getContext] deleteObject:contact];
    
    if(contact.isDeleted){
        @try {
            [self saveContext];
        } @catch (NSException *exception) {
            @throw exception;
        }
    }
    
    return contact.isDeleted;
}

+(NSArray*)fetchAllContacts {
    //select * from Contacts
    NSFetchRequest *fetch = [NSFetchRequest
                          fetchRequestWithEntityName:@"Contact"];
    
    NSError *fetchError;
    NSArray *result = [[self getContext] executeFetchRequest:fetch
                                                error:&fetchError];
    
    if (fetchError) {
        NSException* fetchException = [NSException
                                       exceptionWithName:@"FetchException"
                                       reason:@"Erro ao buscar os contatos, por favor tente novamente!"
                                       userInfo:nil];
        @throw fetchException;
    }
    
    return result;
}
@end
