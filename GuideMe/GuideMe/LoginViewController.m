//
//  LoginViewController.m
//  GuideMe
//
//  Created by Paulo Ferreira on 14/09/16.
//  Copyright © 2016 ALUNO. All rights reserved.
//

#import "LoginViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ViewController.h"
#import "AlertUtil.h"
#import "ColorUtil.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [ViewController setGradientBackground:self];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.barTintColor = [ColorUtil navigationBarBackground];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickedLoginButton:(id)sender {
    if([self validateLoginData]){
        [self performSegueWithIdentifier:@"HomeSegueIdentifier" sender:self];
    }
    else {
        [AlertUtil showAlertIn:self WithTitle:@"Erro ao entrar!" AndMessage:@"Usuário e/ou Senha inválido."];
    }
    
    
}

-(BOOL) validateLoginData{
    
    NSLog(@"%ld", (long)[self.userField.text compare:@"Admin"]);
    
    if([self.userField.text isEqualToString:@"Admin"] && [self.passwordField.text isEqualToString:@"Admin"])
    {
        return YES;
    }
    
    return NO;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(orientationChanged:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIDeviceOrientationDidChangeNotification
                                                  object:nil];
}

- (void) orientationChanged: (NSNotification *) sender {
    [ViewController setGradientBackground : self];
}

@end
