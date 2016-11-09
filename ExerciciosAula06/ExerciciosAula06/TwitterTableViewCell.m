//
//  TwitterTableViewCell.m
//  ExerciciosAula06
//
//  Created by Ismael Mendonça on 09/11/16.
//  Copyright © 2016 Ismael Mendonça. All rights reserved.
//

#import "TwitterTableViewCell.h"

@implementation TwitterTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.profileImage.layer.cornerRadius = self.profileImage.frame.size.width * 0.1;
    self.profileImage.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
