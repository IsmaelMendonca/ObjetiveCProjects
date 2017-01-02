//
//  ContactsHeaderView.m
//  GuideMe
//
//  Created by Ismael Felix Mendonça on 30/12/16.
//  Copyright © 2016 ALUNO. All rights reserved.
//

#import "ContactsHeaderView.h"

@implementation ContactsHeaderView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self) {
        self = [super initWithFrame:frame];
        [self xibSetup];
    }
    
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self) {
        self = [super initWithCoder:aDecoder];
        [self xibSetup];
    }
    
    return self;
}

-(void) xibSetup {
    UIView* view = [self loadViewFromNib];
    view.frame = self.bounds;
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addSubview:view];
}

-(UIView*) loadViewFromNib {
    NSBundle* bundle = [NSBundle bundleForClass:[self class]];
    UINib* nib = [UINib nibWithNibName:@"ContactsHeaderView" bundle:bundle];
    UIView* view = (UIView*)[[nib instantiateWithOwner:self options:nil] objectAtIndex:0];
    
    return view;
}
@end
