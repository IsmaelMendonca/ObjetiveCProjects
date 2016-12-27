//
//  AlertUtil.h
//  GuideMe
//
//  Created by Ismael Felix Mendonça on 27/12/16.
//  Copyright © 2016 ALUNO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AlertUtil : NSObject
+(void)showAlertIn: (UIViewController*)viewController WithTitle: (NSString*)title AndMessage: (NSString*)message;

+(void)showAlertInTable: (UITableViewController*)tableViewController WithTitle: (NSString*)title AndMessage: (NSString*)message;
@end
