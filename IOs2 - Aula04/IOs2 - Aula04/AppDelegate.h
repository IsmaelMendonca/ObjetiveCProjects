//
//  AppDelegate.h
//  IOs2 - Aula04
//
//  Created by ADMINISTRADOR on 05/10/16.
//  Copyright © 2016 ADMINISTRADOR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

