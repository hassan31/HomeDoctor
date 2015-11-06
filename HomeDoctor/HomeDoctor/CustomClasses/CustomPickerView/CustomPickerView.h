
#import <UIKit/UIKit.h>
#import "Utility.h"

@class CustomPickerView;
@protocol CustomPickerViewDelegate <NSObject>

@optional

- (void)pickerView:(CustomPickerView *)picker selectedIndex:(NSInteger)index selectedValue:(NSString *)value;
- (void)pickerView:(CustomPickerView *)picker component01Index:(NSInteger)index01 component01Velue:(NSString *)value01 component02Index:(NSInteger)index02 component02Value:(NSString *)value02;

- (void)pickerView:(CustomPickerView *)picker selectedObject:(id)obj;

@end

@interface CustomPickerView : UIView {

    IBOutlet UIPickerView   *pickerView;
    IBOutlet UIButton       *btnSelect;
    IBOutlet UIButton       *btnCancel;

}

@property (nonatomic)           BOOL            isMultiline;
@property (nonatomic)           NSInteger       noOfComponents;
@property (nonatomic, retain)   NSMutableArray  *arrCommponent01;
@property (nonatomic, retain)   NSMutableArray  *arrCommponent02;

@property (nonatomic, assign)   BOOL            isValueObjectType;

@property (nonatomic, retain) id <CustomPickerViewDelegate> delegate;

- (IBAction)btnCancel_action:(UIButton *)sender;
- (IBAction)btnSelect_action:(UIButton *)sender;

@end
