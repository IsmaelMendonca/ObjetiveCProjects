//
//  Produto+CoreDataProperties.m
//  IOs2 - Aula05
//
//  Created by ADMINISTRADOR on 19/10/16.
//  Copyright © 2016 ADMINISTRADOR. All rights reserved.
//

#import "Produto+CoreDataProperties.h"

@implementation Produto (CoreDataProperties)

+ (NSFetchRequest<Produto *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Produto"];
}

@dynamic nome;
@dynamic preco;
@dynamic marca;
@dynamic validade;

@end
