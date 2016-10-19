//
//  Produto+CoreDataProperties.h
//  IOs2 - Aula05
//
//  Created by ADMINISTRADOR on 19/10/16.
//  Copyright © 2016 ADMINISTRADOR. All rights reserved.
//

#import "Produto+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Produto (CoreDataProperties)

+ (NSFetchRequest<Produto *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *nome;
@property (nonatomic) float preco;
@property (nullable, nonatomic, copy) NSString *marca;
@property (nullable, nonatomic, copy) NSDate *validade;

@end

NS_ASSUME_NONNULL_END
