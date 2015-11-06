//
//  SplashViewController.m
//  HomeDoctor
//
//  Created by Muhammad Hassan on 10/08/2015.
//  Copyright (c) 2015 Hassan. All rights reserved.
//

#import "SplashViewController.h"

@interface SplashViewController ()
@end

#pragma mark - View life cycle
@implementation SplashViewController

- (void)viewDidLoad {
    
    [super viewDidLoad]; [self setUpView];

}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];

}

- (void)setUpView {
    
    self.navigationController.navigationBarHidden       = true;
    [UIApplication sharedApplication].statusBarHidden 	= true;
    
    [self performSelector:@selector(goToMainViewController) withObject:nil afterDelay:3.0];
    
}

#pragma mark - Other methods
- (void)goToMainViewController {
    
    MainViewController *mainVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    
    [self.navigationController pushViewController:mainVC animated:false];
    
}

@end
