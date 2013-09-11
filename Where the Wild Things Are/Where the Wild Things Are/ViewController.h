//
//  ViewController.m
//  Where the Wild Things Are
//
//  Created by Blue Fantail on 9/10/13.
//  Copyright (c) 2013 Blue Fantail. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, strong) IBOutlet MKMapView *mapView;
@property (nonatomic,strong) MKUserLocation *userLocation;

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation;

@end
