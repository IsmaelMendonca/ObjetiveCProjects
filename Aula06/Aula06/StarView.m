//
//  StarView.m
//  Aula06
//
//  Created by Hoff Silva on 13/09/16.
//  Copyright © 2016 ADMINISTRADOR. All rights reserved.
//

#import "StarView.h"

@implementation StarView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self configurar];
    }
    return self;
}

-(void) configurar {
    [self setBackgroundColor:[UIColor blueColor]];
}

- (CGPoint) pontoDoAngulo: (CGFloat) angulo comRaio: (CGFloat) raio eOffset: (CGPoint) offset {
    return CGPointMake(raio * cos(angulo) + offset.x, raio * sin(angulo) + offset.y);
}

- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath new];
    
    CGFloat extrusao = 50;
    CGPoint center = CGPointMake(rect.size.width/2, rect.size.height/2);
    
    NSUInteger pontasNaEstrela = 5;
    
    CGFloat angulo = (CGFloat) -(M_PI/2);
    CGFloat incrementoAngulo = (CGFloat) (M_PI * 2 / pontasNaEstrela);
    CGFloat raio = rect.size.width/2;
    
    BOOL primeiraPonta = YES;
    
    for (NSUInteger i=0; i<pontasNaEstrela; i++) {
        CGPoint proximoPonto = [self pontoDoAngulo:angulo+incrementoAngulo comRaio:raio eOffset:center];
        CGPoint pontoIntermediario = [self pontoDoAngulo:(angulo+incrementoAngulo/2) comRaio:extrusao eOffset:center];
        
        if (primeiraPonta) {
            primeiraPonta = NO;
            CGPoint ponto = [self pontoDoAngulo:angulo comRaio:raio eOffset:center];
            [path moveToPoint:ponto];
        }
        
        [path addLineToPoint:pontoIntermediario];
        [path addLineToPoint:proximoPonto];
        
        angulo += incrementoAngulo;
    }
    
    [path closePath];
    
    UIColor *corDeFundo = [UIColor colorWithRed:112.0/255.0
                                             green:200.0/255.0
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
