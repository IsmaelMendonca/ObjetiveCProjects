//
//  ViewController.h
//  GuideMe
//
//  Created by ALUNO on 10/08/16.
//  Copyright © 2016 ALUNO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
+(void) setGradientBackground : (UIViewController *) viewController;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UIView *mainView;

@end

