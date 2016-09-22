//
//  FallBehavior.m
//  IOs2 - Aula02
//
//  Created by ADMINISTRADOR on 21/09/16.
//  Copyright © 2016 ADMINISTRADOR. All rights reserved.
//

#import "FallBehavior.h"

@interface FallBehavior()

@property (strong, nonatomic, readonly) UIGravityBehavior* gravity;
@property (strong, nonatomic, readonly) UICollisionBehavior* collision;

@end

@implementation FallBehavior
@synthesize gravity = _gravity;
@synthesize collision = _collision;

-(instancetype)init{
    self = [super init];
    if(self) {
        [self addChildBehavior:self.gravity];
        [self addChildBehavior:self.collision];
    }
    return self;
}

-(UIGravityBehavior *) gravity {
    if(!_gravity) {
        _gravity = [[UIGravityBehavior alloc] init];
        [_gravity setMagnitude:0.7];
    }
    
    return _gravity;
}

-(UICollisionBehavior *) collision {
    if(!_collision) {
        _collision = [UICollisionBehavior new]; // == alloc] init]
        [_collision setTranslatesReferenceBoundsIntoBoundary:YES];
    }
    
    return _collision;
}

-(void) addChildItem : (id<UIDynamicItem>) item {
    [self.gravity addItem:item];
    [self.collision addItem:item];
}

-(void) removeChildItem : (id<UIDynamicItem>) item {
    [self.gravity removeItem:item];
    [self.collision removeItem:item];
}

@end
