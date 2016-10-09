//
//  ViewController.m
//  Bus Buddy
//
//  Created by Tejas Deshpande on 10/8/16.
//  Copyright © 2016 Tejas Deshpande. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSString *homeAddress;
@property (nonatomic, strong) NSString *workSchoolAddress;

@property (nonatomic, assign) BOOL isGettingHomeAddress;

@property (nonatomic, assign) BOOL isGettingWorkAddress;
@property (weak, nonatomic) IBOutlet UILabel *homeAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *schoolWorkAddressLabel;
@property (weak, nonatomic) IBOutlet UIButton *goButton;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.isGettingHomeAddress = NO;
    self.isGettingWorkAddress = NO;
//    self.goButton.enabled = YES; //DEBUG
}

- (IBAction)selectHomeAddress:(id)sender {
    self.isGettingHomeAddress = YES;
    self.isGettingWorkAddress = NO;
    
    [self showAutocompleteDialog];
}


- (IBAction)selectWorkAddress:(id)sender {
    self.isGettingHomeAddress = NO;
    self.isGettingWorkAddress = YES;
    
    [self showAutocompleteDialog];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showAutocompleteDialog {
    GMSAutocompleteViewController *acController = [[GMSAutocompleteViewController alloc] init];
    acController.delegate = self;
    [self presentViewController:acController animated:YES completion:nil];
}

// Handle the user's selection.
- (void)viewController:(GMSAutocompleteViewController *)viewController
didAutocompleteWithPlace:(GMSPlace *)place {
    [self dismissViewControllerAnimated:YES completion:nil];
    // Do something with the selected place.
    
    if (self.isGettingHomeAddress) {
        self.homeAddress = place.formattedAddress;
        self.homeAddressLabel.text = place.formattedAddress;
    }
    
    if (self.isGettingWorkAddress) {
        self.workSchoolAddress = place.formattedAddress;
        self.schoolWorkAddressLabel.text = place.name;
    }
    
//    NSLog(@"Place name %@", place.name);
//    NSLog(@"Place address %@", place.formattedAddress);
//    NSLog(@"Place attributions %@", place.attributions.string);
    
    self.goButton.enabled = self.workSchoolAddress && self.homeAddress;
}

- (void)viewController:(GMSAutocompleteViewController *)viewController
didFailAutocompleteWithError:(NSError *)error {
    [self dismissViewControllerAnimated:YES completion:nil];
    // TODO: handle the error.
    NSLog(@"Error: %@", [error description]);
}

// User canceled the operation.
- (void)wasCancelled:(GMSAutocompleteViewController *)viewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

// Turn the network activity indicator on and off again.
- (void)didRequestAutocompletePredictions:(GMSAutocompleteViewController *)viewController {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)didUpdateAutocompletePredictions:(GMSAutocompleteViewController *)viewController {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

@end
