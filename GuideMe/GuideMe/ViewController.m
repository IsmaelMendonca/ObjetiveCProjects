//
//  ViewController.m
//  GuideMe
//
//  Created by ALUNO on 10/08/16.
//  Copyright © 2016 ALUNO. All rights reserved.
//

#import "ViewController.h"
#import "FallBehavior.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController () <UIDynamicAnimatorDelegate>
@property (weak, nonatomic) IBOutlet UIButton *tutorialButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [ViewController setGradientBackground : self];
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
    
    [theViewGradient setName:@"Background"];
    
    //Add gradient to view
    CALayer *layerToRemove = [[[viewController.view.layer sublayers] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"name == %@", @"Background"]] firstObject];
    
    [layerToRemove removeFromSuperlayer];
    
    [viewController.view.layer insertSublayer:theViewGradient atIndex:0];
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    for (CALayer *layer in self.view.layer.sublayers) {
        if([layer isKindOfClass:[CAGradientLayer class]]){
            layer.frame = self.view.bounds;
            [self.view.layer displayIfNeeded];
        }
    }
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(orientationChanged:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
    
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = [NSNumber numberWithFloat:0.0f];
    animation.toValue = [NSNumber numberWithFloat: 2*M_PI];
    animation.duration = 10.0f;
    animation.repeatCount = INFINITY;
    [self.image.layer addAnimation:animation forKey:@"SpinAnimation"];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIDeviceOrientationDidChangeNotification
                                                  object:nil];
    
    [self.image.layer removeAnimationForKey:@"SpinAnimation"];
}

- (void) orientationChanged: (NSNotification *) sender {
    [ViewController setGradientBackground : self];
}
@end
