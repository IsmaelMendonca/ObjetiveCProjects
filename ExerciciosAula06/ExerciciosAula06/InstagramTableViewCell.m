//
//  InstagramTableViewCell.m
//  ExerciciosAula06
//
//  Created by Ismael Mendonça on 07/11/16.
//  Copyright © 2016 Ismael Mendonça. All rights reserved.
//

#import "InstagramTableViewCell.h"

@implementation InstagramTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.profileAranha.layer.cornerRadius = self.profileAranha.frame.size.width / 2.0;
    self.profileAranha.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
