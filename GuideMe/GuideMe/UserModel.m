//
//  UserModel.m
//  GuideMe
//
//  Created by Paulo Ferreira on 14/09/16.
//  Copyright © 2016 ALUNO. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

-(instancetype)initWithName:(NSString *) name AndPhone:(NSString *)phone AndPhoto:(NSString*) photo{
    self = [super init];
    self.name = name;
    self.phone = phone;
    self.photo = [UIImage imageNamed:photo];
    return self;
}
@end
