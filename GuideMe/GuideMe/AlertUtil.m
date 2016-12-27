//
//  AlertUtil.m
//  GuideMe
//
//  Created by Ismael Felix Mendonça on 27/12/16.
//  Copyright © 2016 ALUNO. All rights reserved.
//

#import "AlertUtil.h"

@implementation AlertUtil
+(void)showAlertIn: (UIViewController*)viewController WithTitle: (NSString*)title AndMessage: (NSString*)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:actionOk];
    
    [viewController presentViewController:alert animated:YES completion:nil];
}

+(void)showAlertInTable: (UITableViewController*)tableViewController WithTitle: (NSString*)title AndMessage: (NSString*)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:actionOk];
    
    [tableViewController presentViewController:alert animated:YES completion:nil];
}
@end
