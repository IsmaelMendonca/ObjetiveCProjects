//
//  ViewController.m
//  Factorial
//
//  Created by ADMINISTRADOR on 28/09/16.
//  Copyright © 2016 ADMINISTRADOR. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *entryNumber;

@property (weak, nonatomic) IBOutlet UILabel *outResult;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)KnowFactorial:(id)sender {
    self.outResult.text = [NSString stringWithFormat:@"Fatorial: %d", [self getFactorialOf: [self.entryNumber.text intValue]]];
}
- (IBAction)fifthFibonacci:(id)sender {
    [self getFifthFibonacci];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (int) getFactorialOf : (int) number {
    if(number == 0)
        return 1;
    
    return number * [self getFactorialOf:(number - 1)];
}

- (IBAction)getOdds:(id)sender {
    int number = [self.entryNumber.text intValue];
    
    NSString *result = [[NSString alloc] init];
    
    int odd = 1;
    
    for (int i=1; i <= number; i++) {
        if(i!=1)
            result = [result stringByAppendingString:@", "];
        
        result = [result stringByAppendingString:[NSString stringWithFormat:@"%d", odd]];
        
        odd += 2;
    }
    
    self.outResult.text = result;
    NSLog(@"%@", result);
}


-(void) getFifthFibonacci {
    NSLog(@"%ld \n", (long)1);
    NSLog(@"%ld \n", (long)1);
    
    long fib = 0;
    long now = 1;
    long before = 1;
    
    for(int i=2; i<=50; i++)
    {
        fib = now + before;
        
        before = now;
        now = fib;
        
        NSLog(@"%ld \n", fib);
    }
}

@end
