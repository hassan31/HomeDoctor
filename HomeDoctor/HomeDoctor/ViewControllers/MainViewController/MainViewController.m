//
//  ViewController.m
//  HomeDoctor
//
//  Created by Muhammad Hassan on 21/07/2015.
//  Copyright (c) 2015 Hassan. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@end

#pragma mark - View life cycle
@implementation MainViewController

- (void)viewDidLoad {
    
    [super viewDidLoad]; [self setUpView];

}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];

}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = true;
    
}

- (void)setUpView {

    btnApply.layer.cornerRadius = 5.0f;
    btnCall.layer.cornerRadius  = 5.0f;
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleExpirePeriod) name:@"ShowExpireView" object:nil];
    
//    [self handleExpirePeriod];
    
//    timer = [NSTimer scheduledTimerWithTimeInterval:10.0f target:self selector:@selector(handleExpirePeriod) userInfo:self repeats:true];
    
}

#pragma mark - Other methods
- (void)handleExpirePeriod {
    
    NSDate *today = [NSDate date];
    
    NSString *targetDateStr = @"08/15/2015";
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"MM/dd/yyyy"];
    
    NSDate *targetDate = [formatter dateFromString:targetDateStr];
    
    if ([targetDate isEqualToDateIgnoringTime:today] || [targetDate isEarlierThanDate:today]) {
        
        expireView.hidden = false;
        
        if (timer != nil) {
            
            [timer 	invalidate];
            timer 	= nil;
            
        }
        
    } else {
        
        expireView.hidden = true;
        
    }
}

#pragma mark - IBActions methods
- (IBAction)btnCallNow_action:(UIButton *)sender {
    
    NSString *phoneNumber = @"139999";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@",phoneNumber]]];
    
}

- (IBAction)btnApplyNow_action:(UIButton *)sender {
    
    RegisterViewController *registerVC = [self.storyboard instantiateViewControllerWithIdentifier:@"RegisterViewController"];
    
    [self.navigationController pushViewController:registerVC animated:true];
    
}

- (IBAction)btnOpenLink_action:(UIButton *)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://%@", sender.titleLabel.text]]];
    
}

@end
