//
//  RandomImageCollectionViewController.h
//  GuideMe
//
//  Created by Ismael Felix Mendonça on 02/01/17.
//  Copyright © 2017 ALUNO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RandomImageCollectionViewController : UICollectionViewController
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property(nonatomic) UIImage* imageSelected;
@end
