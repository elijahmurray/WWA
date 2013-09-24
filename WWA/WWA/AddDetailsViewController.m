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
#import <Parse/Parse.h>

@interface AddDetailsViewController ()
    @property (nonatomic, strong) NSArray *listOfHairColors;
    @property (nonatomic, strong) Person *newPerson;
@end

@implementation AddDetailsViewController

@synthesize hairPicker, ageSegmentController;
@synthesize newPerson = _newPerson;
@synthesize listOfHairColors = _listOfHairColors;

-(Person *)newPerson {
    if (_newPerson == nil) _newPerson = [[Person alloc]init];
    return _newPerson;
}

-(NSArray *)listOfHairColors {
    if (_listOfHairColors == nil) _listOfHairColors = [[NSArray alloc] init];
    return _listOfHairColors;
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

    hairPicker.delegate = self;
    hairPicker.dataSource = self;
    
    self.listOfHairColors = [NSArray arrayWithObjects: @"White", @"Black", @"Asian", nil];
    self.newPerson.hair = [self.listOfHairColors objectAtIndex:0];

    
}




#pragma mark UISegmentedControl for age


- (IBAction)changeSegment:(UISegmentedControl *)sender {
    if (ageSegmentController.selectedSegmentIndex == 0 ) {
        self.newPerson.age = [NSNumber numberWithInt:20];
    }
    else if (ageSegmentController.selectedSegmentIndex == 1) {
        self.newPerson.age   = [NSNumber numberWithInt:30];
    }
    else {
        self.newPerson.age  = [NSNumber numberWithInt:40];
    }
            NSLog(@"Age group is now %@",self.newPerson.age);
}


#pragma mark picker components
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.listOfHairColors count];
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 30.0;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.listOfHairColors objectAtIndex:row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.newPerson.hair = [self.listOfHairColors objectAtIndex:row];
    NSLog(@"hair is now %@", self.newPerson.hair);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





#pragma mark Parse actions
-(void)createParsePerson {
    
    //Get day of week
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [dateFormatter setDateFormat:@"EEEE"];
    NSString *weekDate = [dateFormatter stringFromDate:[NSDate date]];
    
    
    PFObject *parseNewPerson = [PFObject objectWithClassName:@"person"];
    [parseNewPerson setObject:self.newPerson.hair forKey:@"hair"];
    [parseNewPerson setObject:self.newPerson.age forKey:@"ageGroup"];
    [parseNewPerson setObject:weekDate forKey:@"dayOfWeek"];
//    self.imageView.image;
    
    [parseNewPerson saveInBackground];
}
#pragma mark Save and segue
- (IBAction)savePerson:(UIButton *)sender {
    
    NSLog(@"Current hair is %@", self.newPerson.hair);
    self.newPerson.picture = self.imageView.image;
    [self performSegueWithIdentifier:@"saveSegue" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"saveSegue"]) {
        
        SuccessViewController *vc = segue.destinationViewController;
        vc.hairColorString = self.newPerson.hair;
        vc.ageGroupNumber = self.newPerson.age;
        vc.image = self.newPerson.picture;
    }
}

#pragma mark Camera actions
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
