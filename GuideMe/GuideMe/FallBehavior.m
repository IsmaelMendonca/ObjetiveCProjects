//
//  RotateAnimator.m
//  GuideMe
//
//  Created by Ismael Felix Mendonça on 04/01/17.
//  Copyright © 2017 ALUNO. All rights reserved.
//

#import "FallBehavior.h"

@interface FallBehavior ()
@property (strong, nonatomic, readonly) UIGravityBehavior *gravity;
@property (strong, nonatomic, readonly) UICollisionBehavior *collision;
@end

@implementation FallBehavior
@synthesize gravity = _gravity;
@synthesize collision = _collision;

//Override do inicializador padrão
- (instancetype)init {
    self = [super init];
    if (self) {
        [self addChildBehavior:self.gravity];
        [self addChildBehavior:self.collision];
    }
    return self;
}

//Lazy load
- (UIGravityBehavior *)gravity {
    if (!_gravity) {
        _gravity = [[UIGravityBehavior alloc] init];
        [_gravity setMagnitude:0.4];
        [_gravity setAngle:0.5];
        [_gravity setGravityDirection:CGVectorMake(0.5, 0.5)];
    }
    return _gravity;
}

//Lazy load
- (UICollisionBehavior *)collision {
    if (!_collision) {
        _collision = [[UICollisionBehavior alloc] init];
        [_collision setCollisionMode:UICollisionBehaviorModeEverything];
        [_collision setTranslatesReferenceBoundsIntoBoundary:YES];
    }
    return _collision;
}


- (void) addItem:(id<UIDynamicItem>)item {
    [self.gravity addItem:item];
    [self.collision addItem:item];
    
}
- (void) removeItem:(id<UIDynamicItem>)item {
    [self.gravity removeItem:item];
    [self.collision removeItem:item];
}

@end
