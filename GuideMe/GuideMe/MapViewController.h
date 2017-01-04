//
//  MapViewController.h
//  GuideMe
//
//  Created by Ismael Felix Mendonça on 04/01/17.
//  Copyright © 2017 ALUNO. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface MapViewController : ViewController
@property (weak, nonatomic) IBOutlet MKMapView *map;
@property (nonatomic) CLLocationCoordinate2D coordinates;
@end
