//
//  ContactsCell.h
//  GuideMe
//
//  Created by Ismael Felix Mendonça on 30/12/16.
//  Copyright © 2016 ALUNO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *contactProfileImage;
@property (weak, nonatomic) IBOutlet UILabel *contactNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *contactPhoneNumberLabel;

@end
