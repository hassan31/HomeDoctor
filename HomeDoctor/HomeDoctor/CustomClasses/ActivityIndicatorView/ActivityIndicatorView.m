//
//  ActivityIndicatorView.m
//  CreativeConnections
//
//  Created by Faisal Naseer on 21/06/2015.
//  Copyright (c) 2015 Lambda Technologies. All rights reserved.
//

#import "ActivityIndicatorView.h"

@implementation ActivityIndicatorView

static bool isShowing;
static ActivityIndicatorView *actIndView = nil;

+ (id)sharedActivityIndicatorView {
    
    if (!actIndView) {
        
        actIndView = [[[NSBundle mainBundle] loadNibNamed:@"ActivityIndicatorView"
                                                    owner:nil
                                                  options:nil] objectAtIndex:0];
        
    }
    
    return actIndView;
    
}

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
    }
    
    return self;
    
}

- (void)awakeFromNib {
    
    
    
}

// Object methods
- (void)showView {
    
    isShowing           = true;
    
    UIWindow *window    =  [[UIApplication sharedApplication].delegate window];
    self.frame          = window.frame;
    [window             addSubview:self];
    
    self.center         = window.center;
}

- (void)dismissView {
    
    if (!isShowing) {
    
        return;
    
    }
    
    isShowing           = false;
    
    [[ActivityIndicatorView sharedActivityIndicatorView] removeFromSuperview];
    
}

// Class methods
+ (void)show {
    
    if (isShowing) {
        
        return;
        
    }
    
    [[ActivityIndicatorView sharedActivityIndicatorView] showView];
    
}

+ (void)dismiss {
    
    [[ActivityIndicatorView sharedActivityIndicatorView] dismissView];
    
}

@end
