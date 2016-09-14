//
//  HelpMeOneViewController.m
//  GuideMe
//
//  Created by ALUNO on 10/08/16.
//  Copyright © 2016 ALUNO. All rights reserved.
//

#import "HelpMeOneViewController.h"
#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface HelpMeOneViewController ()

@end

@implementation HelpMeOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [ViewController setGradientBackground : self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
