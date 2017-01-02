//
//  AddUserTableViewController.m
//  GuideMe
//
//  Created by Ismael Felix Mendonça on 30/12/16.
//  Copyright © 2016 ALUNO. All rights reserved.
//

#import "AddUserTableViewController.h"
#import "AlertUtil.h"
#import "UserDAO.h"

@interface AddUserTableViewController () <UITextViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIGestureRecognizerDelegate>

@end

@implementation AddUserTableViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.userProfile.layer.cornerRadius = self.userProfile.frame.size.width / 2.0;
    self.userProfile.clipsToBounds = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.userProfile.userInteractionEnabled = YES;
    
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapRecognizerImage:)];
    
    [self.userProfile addGestureRecognizer:tapGesture];
}

-(IBAction)tapRecognizerImage:(id) sender {
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Adicionar Foto"
                                  message:@"Selecione como deseja adicionar a foto"
                                  preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* pickerFromAlbum = [UIAlertAction
                                      actionWithTitle:@"Álbum"
                                      style:UIAlertActionStyleDefault
                                      handler:^(UIAlertAction * action)
                                      {
                                          UIImagePickerController *picker = [UIImagePickerController new];
                                          [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
                                          
                                          [picker setDelegate:self];
                                          
                                          [self presentViewController:picker animated:YES completion:nil];
                                          
                                          [alert dismissViewControllerAnimated:YES completion:nil];
                                          
                                      }];
    UIAlertAction* takePhoto = [UIAlertAction
                                actionWithTitle:@"Câmera"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action)
                                {
                                    UIImagePickerController *picker = [UIImagePickerController new];
                                    [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
                                    
                                    [picker setDelegate:self];
                                    
                                    [self presentViewController:picker animated:YES completion:nil];
                                    
                                    [alert dismissViewControllerAnimated:YES completion:nil];
                                }];
    
    
    [alert addAction:pickerFromAlbum];
    [alert addAction:takePhoto];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    UIImage *image = (UIImage*) info[UIImagePickerControllerOriginalImage];
    
    [self.userProfile setImage:image];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveUser:(id)sender {
    if (![self validateFields]) {
        return;
    }
    
    if(![UserDAO checkUserName:self.userName.text]) {
        [AlertUtil showAlertInTable:self WithTitle:@"Erro ao salvar!" AndMessage:@"Usuário já cadastrado, por favor tente outro nome de usuário."];
        
        return;
    }
    
    User* user = [UserDAO createUser];
    
    [user setName:self.name.text];
    [user setAddress:self.address.text];
    [user setEmail:self.email.text];
    [user setPhoneNumber:self.phoneNumber.text];
    [user setPassword:self.password.text];
    [user setUserName:self.userName.text];
    [user setProfileImage:UIImagePNGRepresentation(self.userProfile.image)];
    
    
    if(![UserDAO saveContext]) {
        [AlertUtil showAlertInTable:self WithTitle:@"Erro!" AndMessage:@"Erro ao tentar salvar o Usuário, por favor tente novamente!"];
        
        return;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)validateFields {
    if([[self.name.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]length] == 0) {
        
        [AlertUtil showAlertInTable:self WithTitle:@"Campo Vazio!" AndMessage:@"Campo NOME não pode ser vazio!"];
        return false;
    }
    
    if([[self.userName.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]length] == 0) {
        
        [AlertUtil showAlertInTable:self WithTitle:@"Campo Vazio!" AndMessage:@"Campo NOME DE USUÁRIO não pode ser vazio!"];
        return false;
    }
    
    if([[self.password.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]length] == 0) {
        
        [AlertUtil showAlertInTable:self WithTitle:@"Campo Vazio!" AndMessage:@"Campo SENHA não pode ser vazio!"];
        return false;
    }
    
    if([[self.address.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]length] == 0) {
        
        [AlertUtil showAlertInTable:self WithTitle:@"Campo Vazio!" AndMessage:@"Campo ENDEREÇO não pode ser vazio!"];
        return false;
    }
    
    if([[self.email.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]length] == 0) {
        
        [AlertUtil showAlertInTable:self WithTitle:@"Campo Vazio!" AndMessage:@"Campo E-MAIL não pode ser vazio!"];
        return false;
    }
    
    if([[self.phoneNumber.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]length] == 0) {
        
        [AlertUtil showAlertInTable:self WithTitle:@"Campo Vazio!" AndMessage:@"Campo TELEFONE não pode ser vazio!"];
        return false;
    }
    
    if([[self.birthday.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]length] == 0) {
        
        [AlertUtil showAlertInTable:self WithTitle:@"Campo Vazio!" AndMessage:@"Campo DATA DE NASCIMENTO não pode ser vazio!"];
        return false;
    }
    
    return true;
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
