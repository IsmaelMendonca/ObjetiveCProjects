//
//  Pessoa+CoreDataProperties.m
//  IOs2 - Aula05
//
//  Created by ADMINISTRADOR on 19/10/16.
//  Copyright © 2016 ADMINISTRADOR. All rights reserved.
//

#import "Pessoa+CoreDataProperties.h"

@implementation Pessoa (CoreDataProperties)

+ (NSFetchRequest<Pessoa *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Pessoa"];
}

@dynamic nome;
@dynamic dataNascimento;
@dynamic telefone;
@dynamic email;
@dynamic produtos;

@end
