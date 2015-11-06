
#import "CustomPickerView.h"

@interface CustomPickerView ()
@end

@implementation CustomPickerView

@synthesize delegate, isMultiline, noOfComponents, arrCommponent01, arrCommponent02, isValueObjectType;

#pragma MARK - VIEW LIFE CYCLE
- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
    }
    
    return self;
    
}

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
}

#pragma mark - UIPICKERVIEW DELEGATE METHODS
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return noOfComponents;
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return component == 0 ? [arrCommponent01 count] : [arrCommponent02 count];
    
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    
    return isMultiline ? 60 : 40;
    
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    UILabel *lblRowTitle = [[UILabel alloc] initWithFrame:(noOfComponents == 1) ? CGRectMake(20.0f, 0.0f, [Utility getScreenWidth] - 40.0f, isMultiline ? 60.0f : 40.0f) : CGRectMake(component == 0 ? 0.0f : ([Utility getScreenWidth] / 2), 0.0f, ([Utility getScreenWidth] / 2), isMultiline ? 60.0f : 40.0f)];
    
    lblRowTitle.backgroundColor     = [UIColor clearColor];
    lblRowTitle.textColor           = [UIColor blackColor];

    lblRowTitle.textAlignment       = NSTextAlignmentCenter;
    lblRowTitle.font                = [UIFont fontWithName:@"HelveticaNeue-Light" size:isMultiline ? 14.0f : 18.0f];

    if (isValueObjectType) {
        
//        NSString *value = @"";
//        
//        id obj = [arrCommponent01 objectAtIndex:row];
//        
//        if ([obj isKindOfClass:[UserTypes class]]) {
//            
//            UserTypes *userTypesOBJ     = (UserTypes *)obj;
//            value                       = userTypesOBJ.userTypesTitle;
//            
//            
//        } else if ([obj isKindOfClass:[RentDuration class]]) {
//            
//            RentDuration *rentUserOBJ   = (RentDuration *)obj;
//            value                       = rentUserOBJ.rentDurationTitle;
//            
//        }
//        
//        lblRowTitle.text = value;
        
    } else {
        
        lblRowTitle.text = component == 0 ? [arrCommponent01 objectAtIndex:row] : [arrCommponent02 objectAtIndex:row];
        
    }
    
//    lblRowTitle.text = component == 0 ? [arrCommponent01 objectAtIndex:row] : [arrCommponent02 objectAtIndex:row];
    
    lblRowTitle.numberOfLines = isMultiline ? 2 : 1;

    return lblRowTitle;

}

#pragma MARK - UIBUTTON ACTION METHODS
- (IBAction)btnCancel_action:(UIButton *)sender {
    
    [self removeFromSuperview];
    
}

- (IBAction)btnSelect_action:(UIButton *)sender {
    
    if (noOfComponents == 1) {
    
        if (isValueObjectType) {
        
            if ([self.delegate respondsToSelector:@selector(pickerView:selectedObject:)]) {
                
                [self.delegate pickerView:self selectedObject:[arrCommponent01 objectAtIndex:[pickerView selectedRowInComponent:0]]];
                
            }
        
        } else {
        
            if ([self.delegate respondsToSelector:@selector(pickerView:selectedIndex:selectedValue:)]) {
                
                [self.delegate pickerView:self selectedIndex:(int)[pickerView selectedRowInComponent:0] selectedValue:[arrCommponent01 objectAtIndex:[pickerView selectedRowInComponent:0]]];
                
            }
        
        }
     
    } else if (noOfComponents == 2) {
    
        if ([self.delegate respondsToSelector:@selector(pickerView:component01Index:component01Velue:component02Index:component02Value:)]) {
            
            [self.delegate pickerView:self component01Index:[pickerView selectedRowInComponent:0] component01Velue:[arrCommponent01 objectAtIndex:[pickerView selectedRowInComponent:0]] component02Index:[pickerView selectedRowInComponent:1] component02Value:[arrCommponent02 objectAtIndex:[pickerView selectedRowInComponent:1]]];
            
        }
        
    
    }
    
    [self removeFromSuperview];
    
}

@end
