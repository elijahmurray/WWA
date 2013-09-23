//
//  Annotation.h
//  WWA
//
//  Created by Blue Fantail on 9/15/13.
//  Copyright (c) 2013 Blue Fantail. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Annotation : NSObject <MKAnnotation> {

}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;

-(id)initWithTitle:(NSString *)t andCoordinates:(CLLocationCoordinate2D)coord;

@end
