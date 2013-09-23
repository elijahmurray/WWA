//
//  AddDetailsViewController.m
//  WWA
//
//  Created by Blue Fantail on 9/17/13.
//  Copyright (c) 2013 Blue Fantail. All rights reserved.
//

#import "AddDetailsViewController.h"
#import "Person.h"
#import "SuccessViewController.h"

@interface AddDetailsViewController ()
    @property (nonatomic, strong) NSArray *listOfEthnicities;
    @property (nonatomic, strong) Person *newPerson;
@end

@implementation AddDetailsViewController

@synthesize ethnicityPicker;
@synthesize newPerson = _newPerson;
@synthesize listOfEthnicities = _listOfEthnicities;

-(Person *)newPerson {
    if (_newPerson == nil) _newPerson = [[Person alloc]init];
    return _newPerson;
}

-(NSArray *)listOfEthnicities {
    if (_listOfEthnicities == nil) _listOfEthnicities = [[NSArray alloc] init];
    return _listOfEthnicities;
}

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

    ethnicityPicker.delegate = self;
    ethnicityPicker.dataSource = self;
    
    self.listOfEthnicities = [NSArray arrayWithObjects: @"White", @"Black", @"Asian", @"Semen colored", nil];
    self.newPerson.ethnicity = [self.listOfEthnicities objectAtIndex:0];
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.listOfEthnicities count];
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 30.0;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.listOfEthnicities objectAtIndex:row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.newPerson.ethnicity = [self.listOfEthnicities objectAtIndex:row];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma Save and segue
- (IBAction)savePerson:(UIButton *)sender {
    
    NSLog(@"Current ethnicity is %@", self.newPerson.ethnicity);
    self.newPerson.picture = self.imageView.image;
    [self performSegueWithIdentifier:@"savedPersonSegue" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"savedPersonSegue"]) {
        
        SuccessViewController *vc = segue.destinationViewController;
        vc.secondString = self.newPerson.ethnicity;
        vc.image  = self.newPerson.picture;
    }
}

#pragma -Camera actions
- (IBAction)takePhoto:(id)sender {
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            UIAlertView *noCameraAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"You don't have a camera for this device" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [noCameraAlert show];
        }
        else {
            UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
            imagePicker.delegate = self;
            imagePicker.allowsEditing = YES;
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            
            [self presentViewController:imagePicker animated:YES completion:NULL];
        }
    }

- (IBAction)choosePhoto:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate         = self;
    picker.allowsEditing    = YES;
    picker.sourceType       = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *pickedImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = pickedImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}
@end
