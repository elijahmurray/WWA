//
//  SuccessViewController.m
//  WWA
//
//  Created by Blue Fantail on 9/19/13.
//  Copyright (c) 2013 Blue Fantail. All rights reserved.
//

#import "SuccessViewController.h"

@interface SuccessViewController ()

@end

@implementation SuccessViewController
@synthesize imageView, hairColorString, image, hairColor, ageGroup, ageGroupNumber;


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
    
    //passed in attributes from previous controller
    
    self.imageView.image = self.image;
    self.hairColor.text = hairColorString;
    self.ageGroup.text = [NSString stringWithFormat:@"%@",ageGroupNumber];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)adjectiveButton:(id)sender {
}
@end
