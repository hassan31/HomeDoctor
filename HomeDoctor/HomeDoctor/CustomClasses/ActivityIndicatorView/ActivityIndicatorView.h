//
//  ActivityIndicatorView.h
//  CreativeConnections
//
//  Created by Faisal Naseer on 21/06/2015.
//  Copyright (c) 2015 Lambda Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityIndicatorView : UIView

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

+ (void)show;
+ (void)dismiss;

@end
