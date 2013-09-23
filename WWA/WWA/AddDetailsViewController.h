//
//  AddDetailsViewController.h
//  WWA
//
//  Created by Blue Fantail on 9/17/13.
//  Copyright (c) 2013 Blue Fantail. All rights reserved.
//

#import "ViewController.h"

@interface AddDetailsViewController : ViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *age;
@property (weak, nonatomic) IBOutlet UISlider *rating;
@property (weak, nonatomic) IBOutlet UIPickerView *ethnicity;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIPickerView *ethnicityPicker;

- (IBAction)savePerson:(UIButton *)sender;

- (IBAction)takePhoto:(UIButton *)sender;
- (IBAction)choosePhoto:(UIButton *)sender;

@end
