//
//  UserModel.h
//  GuideMe
//
//  Created by Paulo Ferreira on 14/09/16.
//  Copyright © 2016 ALUNO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UserModel : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* phone;
@property (strong, nonatomic) UIImage* photo;

-(instancetype)initWithName:(NSString *) name AndPhone:(NSString *)phone AndPhoto:(NSString*) photo;

@end
