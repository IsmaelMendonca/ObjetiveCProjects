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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickedLoginButton:(id)sender {
    if([self validateLoginData]){
        [self performSegueWithIdentifier:@"HomeSegueIdentifier" sender:self];
    }
    else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Erro ao entrar!" message:@"Usuário e/ou Senha inválido." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        
        [alert addAction:actionOk];
        
        [self presentViewController:alert animated:YES completion:nil];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
