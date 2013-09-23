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
@synthesize imageView, secondString, image;

//-(UIImageView *)imageReview {
//    if (_imageReview == nil) _imageReview = [[UIImageView alloc]init];
//    return _imageReview;
//}
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
    self.foo.text = @"apple";
    self.imageView.image = image;
    self.foo.text = secondString;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
