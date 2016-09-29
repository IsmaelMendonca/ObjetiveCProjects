//
//  ViewController.m
//  IOs2 - Aula02
//
//  Created by ADMINISTRADOR on 21/09/16.
//  Copyright © 2016 ADMINISTRADOR. All rights reserved.
//

#import "ViewController.h"
#import "FallBehavior.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *viewScreen;

@property (strong, nonatomic, readonly) UIDynamicAnimator *animator;

@property (strong, nonatomic, readonly) FallBehavior *fall;

@property (strong, nonatomic) NSMutableArray<UIView*>* allSquares;
@end

@implementation ViewController
@synthesize animator = _animator;
@synthesize fall = _fall;

static const CGSize kSquareSize = {40,40};

#pragma mark - IBAction
- (IBAction)explode:(UIButton *)sender {
    if(self.allSquares.count) {
        
        for (UIView *square in self.allSquares) {
            [self.fall removeChildItem:square];
        }
        
        [UIView animateWithDuration:2 animations:^{
            for(UIView *square in self.allSquares) {
                int x = (arc4random() % (int)(self.viewScreen.bounds.size.width * 5));
                x -= self.viewScreen.bounds.size.width * 2;
                
                int y = self.view.bounds.size.height;
                
                square.center = CGPointMake(x, -y);
            }
        } completion:^(BOOL finished) {
            [self.allSquares makeObjectsPerformSelector:@selector(removeFromSuperview)];
            [self.allSquares removeAllObjects];
        }];
    }
}

#pragma mark - IBAction
- (IBAction)square:(UIButton *)sender {
    CGRect frame;  
    frame.origin = CGPointZero;
    frame.size = kSquareSize;
    
    //Settled start point to the square falls
    int x = (arc4random() % (int)self.viewScreen.bounds.size.width);
    x = x / kSquareSize.width;
    frame.origin.x = x * kSquareSize.width;
    
    UIView *square = [[UIView alloc] initWithFrame:frame];
    [square setBackgroundColor:[self getRandomColor]];
    
    [self.viewScreen addSubview:square];
    [self.fall addChildItem:square];
    [self.allSquares addObject:square];
}

-(UIColor *) getRandomColor {
    switch (arc4random() % 5) {
        case 0:
            return [UIColor redColor];
            break;
            
        case 1:
            return [UIColor cyanColor];
            break;
            
        case 2:
            return [UIColor greenColor];
            break;
            
        case 3 :
            return [UIColor yellowColor];
            break;
            
        case 4 :
            return [UIColor blueColor];
            break;
            
        default:
            return [UIColor whiteColor];
            break;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _allSquares = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Lazy Proprieties
-(FallBehavior *) fall {
    if(!_fall) {
        _fall = [[FallBehavior alloc] init];
        [self.animator addBehavior:_fall];
    }
    return _fall;
}

#pragma mark - Lazy Proprieties
-(UIDynamicAnimator *)animator {
    if(!_animator)
    {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.viewScreen];
        
        [_animator setDelegate:self];
    }
    
    return _animator;
}

@end
