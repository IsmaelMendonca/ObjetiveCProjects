//
//  ViewController.m
//  GuideMe
//
//  Created by ALUNO on 10/08/16.
//  Copyright © 2016 ALUNO. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *tutorialButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [ViewController setGradientBackground : self];
    
    [ViewController setButtonBorder:self.tutorialButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+(void) setGradientBackground : (UIViewController *) viewController{
    // Create the colors
    UIColor *bottomColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:255.0/255.0 alpha:1.0];
    UIColor *topColor = [UIColor colorWithRed:135.0/255.0 green:206.0/255.0 blue:250.0/255.0 alpha:1.0];
    
    // Create the gradient
    CAGradientLayer *theViewGradient = [CAGradientLayer layer];
    theViewGradient.colors = [NSArray arrayWithObjects: (id)topColor.CGColor, (id)bottomColor.CGColor, nil];
    theViewGradient.frame = viewController.view.bounds;
    
    //Add gradient to view
    [viewController.view.layer insertSublayer:theViewGradient atIndex:0];
}

+(void) setButtonBorder : (UIButton *) button{
    [[button layer] setBorderWidth:2.0f];
    [[button layer] setBorderColor:[UIColor blueColor].CGColor];
}
@end
