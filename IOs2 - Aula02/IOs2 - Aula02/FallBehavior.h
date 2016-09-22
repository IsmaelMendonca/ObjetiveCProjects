//
//  FallBehavior.h
//  IOs2 - Aula02
//
//  Created by ADMINISTRADOR on 21/09/16.
//  Copyright © 2016 ADMINISTRADOR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FallBehavior : UIDynamicBehavior
-(void) removeChildItem : (id<UIDynamicItem>) item;
-(void) addChildItem : (id<UIDynamicItem>) item;
@end
