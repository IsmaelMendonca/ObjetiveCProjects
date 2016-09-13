//
//  CustomUIViewController.m
//  Aula06
//
//  Created by Hoff Silva on 13/09/16.
//  Copyright © 2016 ADMINISTRADOR. All rights reserved.
//

#import "CustomUIViewController.h"
#import "StarView.h"
#import "PentagonView.h"
#import "CircleView.h"

@interface CustomUIViewController ()

@end

@implementation CustomUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    StarView *star = [[StarView alloc] initWithFrame:CGRectMake(20, 20, 200, 200)];
    PentagonView *pentagon = [[PentagonView alloc] initWithFrame:CGRectMake(20, 230, 200, 200)];
    CircleView *circle = [[CircleView alloc] initWithFrame:CGRectMake(20, 440, 200, 200)];
    
    [self.view addSubview:star];
    [self.view addSubview:pentagon];
    [self.view addSubview:circle];
}

@end
