//
//  AddContactTableViewController.m
//  GuideMe
//
//  Created by Ismael Felix Mendonça on 27/12/16.
//  Copyright © 2016 ALUNO. All rights reserved.
//

#import "AddContactTableViewController.h"
#import "ColorUtil.h"
#import "AlertUtil.h"
#import "ContactDAO.h"
#import "SessionData.h"
@import MobileCoreServices;
@import Photos;

@interface AddContactTableViewController () <UITextViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UITextView *contactDescription;
@property (weak, nonatomic) IBOutlet UITextField *contactName;
@property (weak, nonatomic) IBOutlet UITextField *contactPhoneNumber;
@property (weak, nonatomic) IBOutlet UISwitch *contactNotification;
@property (weak, nonatomic) IBOutlet UITextField *contactEmail;

@end

@implementation AddContactTableViewController

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.profileImage.layer.cornerRadius = self.profileImage.frame.size.width / 2.0;
    self.profileImage.clipsToBounds = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.contactDescription.layer.cornerRadius = 9;
    
    self.contactDescription.layer.borderColor = [ColorUtil textFieldBorderColor].CGColor;
    
    self.contactDescription.layer.borderWidth = 1;
    
    self.contactDescription.textColor = [ColorUtil textFieldTextColor];
    
    self.profileImage.userInteractionEnabled = YES;
    
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapRecognizerImage:)];
    
    [self.profileImage addGestureRecognizer:tapGesture];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    self.contactDescription.textColor = [UIColor blackColor];
    self.contactDescription.layer.borderColor = [ColorUtil textFieldBorderColor].CGColor;
    
    if([textView.text isEqualToString:@"Descrição do contato"]) {
        textView.text = @"";
    }
    
    return YES;
}

-(BOOL)textViewShouldEndEditing:(UITextView *)textView {
    if([textView.text isEqualToString:@""]) {
        textView.text = @"Descrição do contato";
        self.contactDescription.textColor = [ColorUtil textFieldTextColor];
    }
    return YES;
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    UIImage *image = (UIImage*) info[UIImagePickerControllerOriginalImage];
    
    [self.profileImage setImage:image];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveContact:(id)sender {
    if (![self validateFields]) {
        return;
    }
    SessionData* session = [SessionData sharedSessionData];
    
    if(!session.loggedUser) {
        return;
    }
    
    if(![ContactDAO checkUniquePhoneNumber:self.contactPhoneNumber.text ByUser:session.loggedUser]) {
        [AlertUtil showAlertInTable:self WithTitle:@"Erro ao salvar!" AndMessage:@"Usuário logado já possui um contato com este número de telefone!"];
        
        return;
    }
    
    Contact* contact = [ContactDAO createContact];
    
    [contact setContactDescription:self.contactDescription.text];
    [contact setContactName:self.contactName.text];
    [contact setContactEmail:self.contactEmail.text];
    [contact setContactPhoneNumber:self.contactEmail.text];
    [contact setContactNotification:[NSNumber numberWithBool:self.contactNotification.isOn]];
    [contact setProfileImage:UIImagePNGRepresentation(self.profileImage.image)];
    [contact setUser:session.loggedUser];
    
    if(![ContactDAO saveContext]) {
        [AlertUtil showAlertInTable:self WithTitle:@"Erro!" AndMessage:@"Erro ao tentar salvar o Contato, por favor tente novamente!"];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(BOOL)validateFields {
    if([[self.contactName.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]length] == 0) {
        
        [AlertUtil showAlertInTable:self WithTitle:@"Campo Vazio!" AndMessage:@"Campo NOME não pode ser vazio!"];
        return false;
    }
    
    if([[self.contactPhoneNumber.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]length] == 0) {
        
        [AlertUtil showAlertInTable:self WithTitle:@"Campo Vazio!" AndMessage:@"Campo TELEFONE não pode ser vazio!"];
        return false;
    }
    
    if([[self.contactEmail.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]length] == 0) {
        
        [AlertUtil showAlertInTable:self WithTitle:@"Campo Vazio!" AndMessage:@"Campo E-MAIL não pode ser vazio!"];
        return false;
    }
    
    if([self.contactDescription.text isEqualToString:@"Descrição do contato"]) {
        
        [AlertUtil showAlertInTable:self WithTitle:@"Campo Vazio!" AndMessage:@"Campo DESCRIÇÃO não pode ser vazio!"];
        return false;
    }

    return true;
}

@end
