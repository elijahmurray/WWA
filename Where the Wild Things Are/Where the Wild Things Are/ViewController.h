//
//  ViewController.m
//  Where the Wild Things Are
//
//  Created by Blue Fantail on 9/10/13.
//  Copyright (c) 2013 Blue Fantail. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLLocation *location;

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations;

@end
