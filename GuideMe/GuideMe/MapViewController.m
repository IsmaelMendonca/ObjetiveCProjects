//
//  MapViewController.m
//  GuideMe
//
//  Created by Ismael Felix Mendonça on 04/01/17.
//  Copyright © 2017 ALUNO. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController () <MKMapViewDelegate>

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.map setShowsUserLocation:YES];
    [self.map setUserTrackingMode:MKUserTrackingModeFollow];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)mapViewDidFinishLoadingMap:(MKMapView *)mapView {
    [self.map setShowsUserLocation:YES];
    [self.map setUserTrackingMode:MKUserTrackingModeFollow];
    
    [self.map setRegion:MKCoordinateRegionMake(self.coordinates, MKCoordinateSpanMake(1, 1))];
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
