//
//  ViewController.h
//  HomeDoctor
//
//  Created by Muhammad Hassan on 21/07/2015.
//  Copyright (c) 2015 Hassan. All rights reserved.
//

#import <UIKit/UIKit.h>

// Custom class
#import "NSDate+Utilities.h"

// Regular classes
#import "RegisterViewController.h"

@interface MainViewController : UIViewController {
    
    IBOutlet UIView *expireView;
    
    IBOutlet UIButton *btnApply;
    IBOutlet UIButton *btnCall;
    NSTimer         *timer;
    
}

- (IBAction)btnCallNow_action:(UIButton *)sender;
- (IBAction)btnApplyNow_action:(UIButton *)sender;
- (IBAction)btnOpenLink_action:(UIButton *)sender;

@end

