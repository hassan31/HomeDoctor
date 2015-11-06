//
//  RegisterViewController.m
//  HomeDoctor
//
//  Created by Muhammad Hassan on 21/07/2015.
//  Copyright (c) 2015 Hassan. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@end

@implementation RegisterViewController

#pragma mark - View life cycle
- (void)viewDidLoad {
    
    [super viewDidLoad]; [self setUpView];

}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];

}

- (void)setUpView {
    
    // Navigation settings
    self.navigationController.navigationBar.translucent = false;
    
    self.navigationItem.title                           = @"Book Online";
    
    // Initialize arrays
    arrGender = [[NSMutableArray alloc] initWithObjects:@"Male", @"Female", @"Other", nil];
    
    arrStates = [[NSMutableArray alloc] initWithObjects:@"Australian Capital Territory", @"New South Wales", @"Northern Territory", @"Queensland", @"Tasmania", @"Westren Australia", nil];
    
    arrHearAboutUs = [[NSMutableArray alloc] initWithObjects:@"Google", @"Friend or Colleague", @"Facebook", @"My Regular Doctor or Practice", @"Other Social Media", @"TV", @"Radio", @"News or Current affairs", @"Other", nil];
    
    btnGender.layer.cornerRadius                        = 5.0f;
    btnGender.layer.borderColor                         = [UIColor lightGrayColor].CGColor;
    btnGender.layer.borderWidth                         = 0.5;
    
    btnState.layer.cornerRadius                         = 5.0f;
    btnState.layer.borderColor                          = [UIColor lightGrayColor].CGColor;
    btnState.layer.borderWidth                      	= 0.5;
    
    btnHearAbout.layer.cornerRadius                     = 5.0f;
    btnHearAbout.layer.borderColor                      = [UIColor lightGrayColor].CGColor;
    btnHearAbout.layer.borderWidth                      = 0.5;
    
    btnSubmit.layer.cornerRadius                        = 5.0f;
    btnSubmit.layer.borderColor                         = [UIColor blackColor].CGColor;
    btnSubmit.layer.borderWidth                      	= 1.0;
    
    // Create date picker
    datePickerView                  = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 44, 0, 0)];
    datePickerView.datePickerMode   = UIDatePickerModeDate;
    datePickerView.tag              = 20000;
    datePickerView.date             = [NSDate date];
    datePickerView.maximumDate      = [NSDate date];
    
    [datePickerView                 addTarget:self action:@selector(updateDate_action:) forControlEvents:UIControlEventValueChanged];
    
    tf_dateOFBirth.inputView        = datePickerView;
    
    // Create date picker
    datePickerView                  = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 44, 0, 0)];
    datePickerView.datePickerMode   = UIDatePickerModeDate;
    datePickerView.tag              = 21000;
    datePickerView.date             = [NSDate date];
    
    [datePickerView                 addTarget:self action:@selector(updateDate_action:) forControlEvents:UIControlEventValueChanged];
    
    tf_medicareExpiry.inputView     = datePickerView;
    
}

#pragma mark - UITextField delegate methods
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
}

#pragma mark - Other methods
- (void)updateDate_action:(UIDatePicker *)datePicker {
    
    NSDate *selectedDate        = [datePickerView date];
    NSDateFormatter *formatter  = [[NSDateFormatter alloc]init];
    
    if (datePicker.tag == 20000) {
        
        [formatter              setDateFormat:@"dd/MM/YYYY"];
        tf_dateOFBirth.text     = [formatter stringFromDate:selectedDate];
        
    } else {
        
        [formatter              setDateFormat:@"MM/YYYY"];
        tf_medicareExpiry.text  = [formatter stringFromDate:selectedDate];
        
    }
}

#pragma mark - IBAction methods
- (IBAction)btnPopVC_action:(id)sender {
    
    [self.navigationController popViewControllerAnimated:true];
    
}

- (IBAction)btnRegister_action:(UIButton *)sender {
    
    if (tf_firstName.text.length == 0 || tf_suburb.text.length == 0 || tf_firstName.text.length == 0 || tf_lastName.text.length == 0 || tf_phone.text.length == 0 || tf_medicareNo.text.length == 0) {
        
        [[[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Please fill all the mandatory fields first." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        
        return;
        
    }
    
    [self sendEMAIL];
}

- (IBAction)btnState_action:(UIButton *)sender {
    
    [self.view endEditing:true];
    
    CustomPickerView *custPickerView    = [[[NSBundle mainBundle] loadNibNamed:@"CustomPickerView" owner:self options:nil] objectAtIndex:0];
    
    custPickerView.frame                = self.navigationController.view.frame;
    custPickerView.isMultiline          = false;
    custPickerView.noOfComponents       = 1;
    custPickerView.arrCommponent01      = [arrStates mutableCopy];
    custPickerView.delegate             = self;
    custPickerView.tag                  = 10000;
    
    [self.navigationController.view addSubview:custPickerView];
    
}

- (IBAction)btnGender_action:(UIButton *)sender {
    
    [self.view endEditing:true];
    
    CustomPickerView *custPickerView    = [[[NSBundle mainBundle] loadNibNamed:@"CustomPickerView" owner:self options:nil] objectAtIndex:0];
    
    custPickerView.frame                = self.navigationController.view.frame;
    custPickerView.isMultiline          = false;
    custPickerView.noOfComponents       = 1;
    custPickerView.arrCommponent01      = [arrGender mutableCopy];
    custPickerView.delegate             = self;
    custPickerView.tag                  = 11000;
    
    [self.navigationController.view addSubview:custPickerView];
    
}

- (IBAction)btnHearAbout_action:(UIButton *)sender {
    
    [self.view endEditing:true];
    
    CustomPickerView *custPickerView    = [[[NSBundle mainBundle] loadNibNamed:@"CustomPickerView" owner:self options:nil] objectAtIndex:0];
    
    custPickerView.frame                = self.navigationController.view.frame;
    custPickerView.isMultiline          = false;
    custPickerView.noOfComponents       = 1;
    custPickerView.arrCommponent01      = [arrHearAboutUs mutableCopy];
    custPickerView.delegate             = self;
    custPickerView.tag                  = 12000;
    
    [self.navigationController.view addSubview:custPickerView];
    
}

#pragma mark - CustomPickerView delegate methods
- (void)pickerView:(CustomPickerView *)picker selectedIndex:(NSInteger)index selectedValue:(NSString *)value {
    
    if (picker.tag == 10000) {
        
        [btnState setTitle:value forState:UIControlStateNormal];
        [btnState setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
    } else if (picker.tag == 11000) {
        
        [btnGender setTitle:value forState:UIControlStateNormal];
        [btnGender setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
    } else {
        
        [btnHearAbout setTitle:value forState:UIControlStateNormal];
        [btnHearAbout setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    
}

-(void)sendEMAIL{
    
    SKPSMTPMessage *testMsg = [[SKPSMTPMessage alloc] init];
    
    testMsg.fromEmail       = @"dial.homedoctor@gmail.com";
    
//    testMsg.toEmail         = @"zafardialhome@gmail.com";
//    testMsg.toEmail         = @"zaffar@zaffarkhan.com";
//    testMsg.ccEmail         = @"tech.awais@gmail.com";
    
//    testMsg.toEmail         = @"info.hassan31@gmail.com";
    
//    testMsg.toEmail         = @"tech.awais@gmail.com";
//    testMsg.ccEmail         = @"info.hassan31@gmail.com";
    
    testMsg.toEmail         = @"cc@dahd.com.au";
    testMsg.ccEmail         = @"zaffar@zaffarkhan.com";
    
    testMsg.relayHost       = @"smtp.gmail.com";
    
    testMsg.requiresAuth    = YES;
    
    testMsg.login           = @"dial.homedoctor@gmail.com";
    testMsg.pass            = @"123pkg123@";
    
    testMsg.subject         = @"Book Online Request";
    
    testMsg.wantsSecure     = YES;
    
    NSString *firstName     = [NSString stringWithFormat:@"First Name: %@", tf_firstName.text];
    NSString *lastName      = [NSString stringWithFormat:@"Last Name: %@", tf_lastName.text];
    NSString *email         = [NSString stringWithFormat:@"Email: %@", tf_email.text];
    NSString *phoneNo       = [NSString stringWithFormat:@"Phone NO: %@", tf_phone.text];
    NSString *address       = [NSString stringWithFormat:@"Residential Address: %@", tf_address.text];
    NSString *suburb        = [NSString stringWithFormat:@"Subrub: %@", tf_suburb.text];
    NSString *postCode      = [NSString stringWithFormat:@"PostCode: %@", tf_postCode.text];
    NSString *streetAdd     = [NSString stringWithFormat:@"Cross Street Address: %@", tf_crossStreet.text];
    NSString *state         = [NSString stringWithFormat:@"State: %@", btnState.titleLabel.text];
    NSString *dateOfBirth   = [NSString stringWithFormat:@"Date of Birth: %@", tf_dateOFBirth.text];
    NSString *gender        = [NSString stringWithFormat:@"Gender: %@", btnGender.titleLabel.text];
    NSString *medicareNo    = [NSString stringWithFormat:@"Medicare NO: %@", tf_medicareNo.text];
    NSString *referenceNo   = [NSString stringWithFormat:@"Medicare Reference: %@", tf_medicareReference.text];
    NSString *expiryDate    = [NSString stringWithFormat:@"Medicare Expiry: %@", tf_medicareExpiry.text];
    NSString *practice      = [NSString stringWithFormat:@"Regular Practice: %@", tf_regularPractice.text];
    NSString *symptoms      = [NSString stringWithFormat:@"Symptoms: %@", tf_symptoms.text];
    NSString *hearAbout     = [NSString stringWithFormat:@"How Did you hear about us?: %@", btnHearAbout.titleLabel.text];
    
    
    
    NSString *sendmsg       = [[NSString alloc]initWithFormat:@"%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n",firstName, lastName, email, phoneNo, address, suburb, postCode, streetAdd, state, dateOfBirth, gender, medicareNo, referenceNo, expiryDate, practice, symptoms, hearAbout];
    
    testMsg.delegate        = self;
    
    NSDictionary *plainPart = [NSDictionary dictionaryWithObjectsAndKeys:@"text/plain; charset=UTF-8",kSKPSMTPPartContentTypeKey,
                               sendmsg, kSKPSMTPPartMessageKey,@"8bit",kSKPSMTPPartContentTransferEncodingKey,nil];
    
    testMsg.parts           = [NSArray arrayWithObjects:plainPart, nil];
    
    if ([Utility isNetworkAvailable]) {
        
        [ActivityIndicatorView show];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            [testMsg send];
        });
        
    } else {
        
        [Utility showAlertView:@"Network Problem" Message:@"There is no internet connecton. Please reset your internet connection." OKText:@"OK"];
    }
    
}

-(void)messageSent:(SKPSMTPMessage *)message{
    
    [ActivityIndicatorView dismiss];
    
    UIAlertView *alert  = [[UIAlertView alloc] initWithTitle:@"Thank You!" message:@"Thank you for booking with Dial a Home Doctor. We undertake to use our best endeavours to get back to you promptly however if you have not received a call back to confirm to confirm your appointment by 6:00 PM. Please call our call center on 13 99 99" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    alert.tag           = 10000;
    [alert              show];

}

-(void)messageFailed:(SKPSMTPMessage *)message error:(NSError *)error{
    
    [ActivityIndicatorView dismiss];
    
    [[[UIAlertView alloc] initWithTitle:@"Failure!" message:@"Please try agian." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
    
}

#pragma mark - UIAlertView delegate methods
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (alertView.tag == 10000) {
        
        [self.navigationController popViewControllerAnimated:true];
        
    }
    
}

@end
