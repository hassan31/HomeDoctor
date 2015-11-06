//
//  RegisterViewController.h
//  HomeDoctor
//
//  Created by Muhammad Hassan on 21/07/2015.
//  Copyright (c) 2015 Hassan. All rights reserved.
//

#import <UIKit/UIKit.h>

// Utility class
#import "Utility.h"

// Custom classes
#import "SKPSMTPMessage.h"
#import "CustomPickerView.h"
#import "ActivityIndicatorView.h"

@interface RegisterViewController : UIViewController <SKPSMTPMessageDelegate, CustomPickerViewDelegate, UIAlertViewDelegate> {
    
    IBOutlet UIScrollView   *scrollView;
    
    IBOutlet UITextField    *tf_suburb;
    IBOutlet UITextField    *tf_firstName;
    IBOutlet UITextField    *tf_lastName;
    IBOutlet UITextField    *tf_phone;
    IBOutlet UITextField    *tf_medicareNo;
    IBOutlet UITextField    *tf_email;
    IBOutlet UITextField    *tf_address;
    IBOutlet UITextField    *tf_postCode;
    IBOutlet UITextField    *tf_crossStreet;
    IBOutlet UITextField    *tf_state;
    IBOutlet UITextField    *tf_dateOFBirth;
    IBOutlet UITextField    *tf_gender;
    IBOutlet UITextField    *tf_medicareReference;
    IBOutlet UITextField    *tf_medicareExpiry;
    IBOutlet UITextField    *tf_regularPractice;
    IBOutlet UITextField    *tf_symptoms;
    IBOutlet UITextField    *tf_hearAbout;
    
    IBOutlet UIButton       *btnState;
    IBOutlet UIButton       *btnGender;
    IBOutlet UIButton       *btnHearAbout;
    IBOutlet UIButton       *btnSubmit;
    
    UIDatePicker            *datePickerView;
    
    NSMutableArray          *arrGender;
    NSMutableArray          *arrStates;
    NSMutableArray          *arrHearAboutUs;
    
}
- (IBAction)btnPopVC_action:(id)sender;

- (IBAction)btnRegister_action:(UIButton *)sender;
- (IBAction)btnState_action:(UIButton *)sender;
- (IBAction)btnGender_action:(UIButton *)sender;
- (IBAction)btnHearAbout_action:(UIButton *)sender;


@end
