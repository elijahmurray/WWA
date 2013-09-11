//
//  ViewController.m
//  Where the Wild Things Are
//
//  Created by Blue Fantail on 9/10/13.
//  Copyright (c) 2013 Blue Fantail. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mapView;
@synthesize userLocation = _userLocation;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mapView.delegate = self;
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLoc {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLoc.coordinate, 800, 800);
    
    //set it globablly
    _userLocation = userLoc;
    
    //focus map on local region
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    //show pin
    [self addAnnotation];
    
}

-(void)addAnnotation {
    //add annotation
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = _userLocation.coordinate;
    point.title = @"TITle";
    point.subtitle = @"ha";
    
    [self.mapView addAnnotation:point];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
