//
//  Person.m
//  WWA
//
//  Created by Blue Fantail on 9/17/13.
//  Copyright (c) 2013 Blue Fantail. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize picture = _picture;

-(UIImage *)picture {
    if (_picture == nil) {
        _picture = [[UIImage alloc] init];
        
    }
    return _picture;
}

@end
