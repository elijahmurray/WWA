//
//  MapViewController.h
//  WWA
//
//  Created by Blue Fantail on 9/13/13.
//  Copyright (c) 2013 Blue Fantail. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface BrowseViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, strong) IBOutlet MKMapView *mapView;

- (IBAction)disclosureButton:(id)sender;

@end