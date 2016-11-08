//
//  AppDelegate.h
//  ExerciciosAula06
//
//  Created by Ismael Mendonça on 07/11/16.
//  Copyright © 2016 Ismael Mendonça. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

