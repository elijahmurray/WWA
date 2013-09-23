//
//  Annotation.m
//  WWA
//
//  Created by Blue Fantail on 9/15/13.
//  Copyright (c) 2013 Blue Fantail. All rights reserved.
//

#import "Annotation.h"

@implementation Annotation
@synthesize coordinate;
@synthesize title;

-(id)initWithTitle:(NSString *)t andCoordinates:(CLLocationCoordinate2D)coord {
    self = [super init];
    
    if (self) {
        title = t;
        coordinate = coord;
    }
    return self;
}

@end