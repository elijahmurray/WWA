//
//  SuccessViewController.h
//  WWA
//
//  Created by Blue Fantail on 9/19/13.
//  Copyright (c) 2013 Blue Fantail. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuccessViewController : UIViewController {
}
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) UIImage *image;

@property (weak, nonatomic) IBOutlet UILabel *hairColor;
@property (weak,nonatomic) NSString *hairColorString;

@property (weak, nonatomic) NSNumber *ageGroupNumber;
@property (weak, nonatomic) IBOutlet UILabel *ageGroup;

- (IBAction)adjectiveButton:(UIButton *)sender;

@end
