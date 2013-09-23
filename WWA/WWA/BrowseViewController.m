//
//  MapViewController.m
//  WWA
//
//  Created by Blue Fantail on 9/13/13.
//  Copyright (c) 2013 Blue Fantail. All rights reserved.
//

#import "BrowseViewController.h"
#import "Annotation.h"
#import "AddDetailsViewController.h"

@interface BrowseViewController ()

@end

@implementation BrowseViewController {
}

@synthesize mapView = _mapView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.mapView.delegate = self;
}

//Add user location, zoom to fit
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);

    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:NO];
    
    //long press gesture
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    longPress.minimumPressDuration = 1.0; //user needs to press for 2 seconds
    [self.mapView addGestureRecognizer:longPress];
}



//what happens when you long press
- (void)handleLongPress:(UIGestureRecognizer *)gestureRecognizer
{

    if (gestureRecognizer.state != UIGestureRecognizerStateBegan) return;
    
    CGPoint touchPoint = [gestureRecognizer locationInView:self.mapView];
    CLLocationCoordinate2D touchMapCoordinate = [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
    
    Annotation *annot = [[Annotation alloc] initWithTitle:@"Spotted Babe" andCoordinates:touchMapCoordinate];

    [self.mapView addAnnotation:annot];
}





- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    // If it's the user location, just return nil so the user location isn't draggable.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    // Handle any custom annotations.
    if ([annotation isKindOfClass:[Annotation class]])
    {
        
        // Try to dequeue an existing pin view first.

        MKPinAnnotationView *pinView = (MKPinAnnotationView*)[mapView
                                                                 dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
        
        if (!pinView)
        {
            // If an existing pin view was not available, create one.
            pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                       reuseIdentifier:@"CustomPinAnnotationView"];
            pinView.pinColor = MKPinAnnotationColorRed;
            pinView.animatesDrop = YES;
            pinView.draggable = YES;
            pinView.canShowCallout = YES;
            
            // Add a detail disclosure button to the callout.
            UIButton* rightButton = [UIButton buttonWithType:
                                     UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self action:@selector(disclosureButton:)
                  forControlEvents:UIControlEventTouchUpInside];
            pinView.rightCalloutAccessoryView = rightButton;
            
        }
        else {
            pinView.annotation = annotation;
        }
        return pinView;
    }

    return nil;
    
}

-(void)disclosureButton:sender {
    [self performSegueWithIdentifier:@"detailViewDisclosureSegue" sender:self];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
