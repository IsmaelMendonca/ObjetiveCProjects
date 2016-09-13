//
//  MinhaView.m
//  Aula05
//
//  Created by Pedro Henrique on 24/08/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "MinhaView.h"

@implementation MinhaView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configurar];
    }
    return self;
}

- (void) configurar {
    [self setBackgroundColor:[UIColor yellowColor]];
}

- (void)drawRect:(CGRect)rect {
    
    NSMutableAttributedString *iesb =
    [[NSMutableAttributedString alloc] initWithString:@"I GOT IT!"];
    
    
    [iesb addAttribute:NSFontAttributeName
                 value:[UIFont fontWithName:@"Courier" size:20]
                 range:NSMakeRange(0, iesb.length)];
    
    [iesb addAttribute:NSForegroundColorAttributeName
                 value:[UIColor redColor]
                 range:NSMakeRange(0, 1)];
    
    [iesb drawAtPoint:CGPointMake(0, 0)];
    
    UIBezierPath *path = [UIBezierPath new];
    
    [path moveToPoint:CGPointMake(60, 100)];
    [path addLineToPoint:CGPointMake(120, 100)];
    [path addLineToPoint:CGPointMake(140, 40)];
    [path addLineToPoint:CGPointMake(160, 100)];
    [path addLineToPoint:CGPointMake(220, 100)];
    [path addLineToPoint:CGPointMake(170, 140)];
    [path addLineToPoint:CGPointMake(200, 200)];
    [path addLineToPoint:CGPointMake(140, 160)];
    [path addLineToPoint:CGPointMake(80, 200)];
    [path addLineToPoint:CGPointMake(110, 140)];
    [path closePath];
    
 
    //10, 200, 10
    
    
    UIColor *verdeDoFelipe = [UIColor colorWithRed:10.0/255.0
                                             green:200.0/255.0
                                              blue:10.0/255.0
                                             alpha:1];
    
    
    UIColor *outraCor = [UIColor magentaColor];
    
    [verdeDoFelipe setFill];
    [outraCor setStroke];
    
    [path fill];
    [path stroke];
    
    [path addClip];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self adicionarImage:context rect:rect];
    
}

-(void) adicionarImage : (CGContextRef) context rect: (CGRect) rect {
    CGContextSaveGState(context);
    
    UIImage *mario = [UIImage imageNamed:@"mario"];
    
    [mario drawInRect:rect];
    
    CGContextRestoreGState(context);
}

@end
