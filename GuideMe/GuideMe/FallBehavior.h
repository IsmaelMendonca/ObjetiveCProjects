//
//  RotateAnimator.h
//  GuideMe
//
//  Created by Ismael Felix Mendonça on 04/01/17.
//  Copyright © 2017 ALUNO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FallBehavior : UIDynamicBehavior
- (void) addItem: (id<UIDynamicItem>) item;
- (void) removeItem: (id<UIDynamicItem>) item;
@end
