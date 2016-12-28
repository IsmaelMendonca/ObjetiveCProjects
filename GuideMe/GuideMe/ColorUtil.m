//
//  ColorUtil.m
//  GuideMe
//
//  Created by Ismael Felix Mendonça on 28/12/16.
//  Copyright © 2016 ALUNO. All rights reserved.
//

#import "ColorUtil.h"

@implementation ColorUtil
+(UIColor*) navigationBarBackground {
    return [UIColor colorWithRed:138/255.0 green:207/255.0 blue:248/255.0 alpha:1];
}

+(UIColor*) navigationBarTintColor {
    return [UIColor colorWithRed:11/255.0 green:36/255.0 blue:248/255.0 alpha:1];
}

+(UIColor*) textFieldBorderColor {
    return [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
}

+(UIColor*) textFieldTextColor {
    return [UIColor colorWithRed:0.70 green:0.70 blue:0.72 alpha:1.00];
}

@end
