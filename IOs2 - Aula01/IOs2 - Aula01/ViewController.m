//
//  ViewController.m
//  IOs2 - Aula01
//
//  Created by ADMINISTRADOR on 14/09/16.
//  Copyright © 2016 ADMINISTRADOR. All rights reserved.
//

#import "ViewController.h"

typedef int (^BLOCK_RECEIVING_TWO_INT_RETURN_INT) (int a, int b);

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
//    Primeira Animação
//    __weak typeof(self) weakSelf = self;
    
//    [UIView animateWithDuration:3 animations:^{
//        CGRect frame = weakSelf.myLabel.frame;
//        frame.origin = CGPointMake(30, 30);
//        
//        [weakSelf.myLabel setFrame:frame];
//    }];

//    Segunda Animação
//    UILabel *newLabel = [[UILabel alloc] initWithFrame:_myLabel.frame];
//    
//    [newLabel setText:@"Palmeiras 2 x 0 Flamengo"];
//    [newLabel setBackgroundColor:[UIColor greenColor]];
//    [newLabel setTextColor:[UIColor whiteColor]];
//    [newLabel sizeToFit];
//    
//    [UIView transitionFromView:self.myLabel toView:newLabel duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
//        if(finished) {
//            NSLog(@"Terminou!");
//        }
//    }];
    
    [UIView animateWithDuration:2 animations:[self returnBlock]];
}

-(void (^) (void)) returnBlock {
    __weak typeof(self) weakSelf = self;
    
    void (^changePositionBlock) (void) = ^{
        [weakSelf.myLabel setCenter:CGPointMake(50, 50)];
    };
    
    return changePositionBlock;
}

-(void) executeBlock: (void (^)(void)) block {
    block();
}

- (void) doCalculation {
    
    BLOCK_RECEIVING_TWO_INT_RETURN_INT sumBlock = ^(int x, int y) {
        return x+y;
    };
}

-(void) sum: (int) a with: (int) b usingBlock: (BLOCK_RECEIVING_TWO_INT_RETURN_INT) block {
    
    block (a,b);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
