//
//  CircleView.m
//  Aula06
//
//  Created by Hoff Silva on 13/09/16.
//  Copyright © 2016 ADMINISTRADOR. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self configurar];
    }
    return self;
}

-(void) configurar {
    [self setBackgroundColor:[UIColor redColor]];
}

- (CGPoint) pontoDoAngulo: (CGFloat) angulo comRaio: (CGFloat) raio eOffset: (CGPoint) offset {
    return CGPointMake(raio * cos(angulo) + offset.x, raio * sin(angulo) + offset.y);
}

- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath new];
    
    int customRadius;
    
    if(rect.size.width > rect.size.height)
        customRadius = rect.size.height/2;
    else
        customRadius = rect.size.width/2;
    
    [path addArcWithCenter:CGPointMake(rect.size.width/2, rect.size.height/2) radius:customRadius startAngle:0 endAngle:360 clockwise:YES];
    
    UIColor *corDeFundo = [UIColor colorWithRed:150.0/255.0
                                          green:10.0/255.0
                                           blue:150.0/255.0
alpha:1];
    
    
    UIColor *outraCor = [UIColor magentaColor];
    
    [corDeFundo setFill];
    [outraCor setStroke];
    [path setLineWidth:3];
    [path fill];
    [path stroke];
}

@end
