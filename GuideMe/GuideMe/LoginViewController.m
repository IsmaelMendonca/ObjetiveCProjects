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
#import "UserDAO.h"
#import "SessionData.h"

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
    self.userField.text = @"";
    self.passwordField.text = @"";
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
    
    User* user = [UserDAO fetchUserByUserName:self.userField.text AndPassword:self.passwordField.text];
    SessionData *session = [SessionData sharedSessionData];
    
    if(user){
        [session setLoggedUser:user];
        return YES;
    }
    [session setLoggedUser:nil];
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
