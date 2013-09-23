//
//  Person.h
//  WWA
//
//  Created by Blue Fantail on 9/17/13.
//  Copyright (c) 2013 Blue Fantail. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong) NSNumber *age;
@property (nonatomic, strong) NSNumber *rating;
@property (nonatomic, strong) NSString *ethnicity;
@property (nonatomic, strong) UIImage *picture;

@end
