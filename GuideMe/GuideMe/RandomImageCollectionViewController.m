//
//  RandomImageCollectionViewController.m
//  GuideMe
//
//  Created by Ismael Felix Mendonça on 02/01/17.
//  Copyright © 2017 ALUNO. All rights reserved.
//

#import "RandomImageCollectionViewController.h"
#import "ImageCollectionViewCell.h"
#import "AddUserTableViewController.h"

@interface RandomImageCollectionViewController ()
@property(nonatomic) NSMutableArray<UIImage *>* imagesCollection;
@property(nonatomic) int countRequest;
@end

@implementation RandomImageCollectionViewController

static NSString * const reuseIdentifier = @"ImageCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.activityIndicator startAnimating];
    self.activityIndicator.hidesWhenStopped = YES;
    
    self.imagesCollection = [NSMutableArray new];
    
    for (int i=0; i<20; i++) {
        _countRequest++;
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
        
        dispatch_async(queue, ^{
            NSURL *url = [NSURL URLWithString:@"http://lorempixel.com/640/480"];
            
            NSData *bytes = [NSData dataWithContentsOfURL:url];
            
            UIImage *image = [UIImage imageWithData:bytes];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if(image) {
                    [self.imagesCollection addObject:image];
                    [self.collectionView reloadData];
                    _countRequest--;
                    if (_countRequest == 0) {
                        [self.activityIndicator stopAnimating];
                        [self.activityIndicator setHidden:YES];
                    }
                    
                }
            });
        });
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imagesCollection.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
     ImageCollectionViewCell *cell = (ImageCollectionViewCell*) [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    [cell.collectionImage setImage:[self.imagesCollection objectAtIndex:indexPath.row]];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.imageSelected = [self.imagesCollection objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"SelectUserImageIdentifier" sender:self];
}

@end
