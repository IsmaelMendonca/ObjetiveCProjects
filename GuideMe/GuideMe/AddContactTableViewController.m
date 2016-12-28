//
//  AddContactTableViewController.m
//  GuideMe
//
//  Created by Ismael Felix Mendonça on 27/12/16.
//  Copyright © 2016 ALUNO. All rights reserved.
//

#import "AddContactTableViewController.h"
#import "ColorUtil.h"
@import MobileCoreServices;
@import Photos;

@interface AddContactTableViewController () <UITextViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UITextView *contactDescription;

@end

@implementation AddContactTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
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
- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    [self.profileImage setImage:image];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}
@end
