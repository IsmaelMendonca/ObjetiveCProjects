//
//  MyScrollViewController.m
//  IOs2 - Aula04
//
//  Created by ADMINISTRADOR on 05/10/16.
//  Copyright © 2016 ADMINISTRADOR. All rights reserved.
//

#import "MyScrollViewController.h"

@interface MyScrollViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *myScroll;
@property (nonatomic) UIImageView *imageV;
@end

@implementation MyScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    __weak typeof (self) weakSelf = self;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(queue, ^{
        NSURL *url = [NSURL URLWithString:@"https://axeetech.com/wp-content/uploads/2014/09/4k-wallpaper.jpg"];
        
        NSData *bytes = [NSData dataWithContentsOfURL:url];
        
        UIImage *image = [UIImage imageWithData:bytes];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImageView *iv = [[UIImageView alloc] initWithImage:image];
            [iv sizeToFit];
            self.imageV = iv;
            [weakSelf.myScroll setContentSize:image.size];
            [weakSelf.myScroll addSubview:iv];
            
            weakSelf.myScroll.scrollEnabled = YES;
            
            weakSelf.myScroll.minimumZoomScale = 0.1;
            weakSelf.myScroll.maximumZoomScale = 2.0;
            weakSelf.myScroll.delegate = weakSelf;
            
            [weakSelf setTitle:@"Mountain"];
            
            [weakSelf.myScroll setZoomScale:0.1];
        });
    });
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return  self.imageV;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
