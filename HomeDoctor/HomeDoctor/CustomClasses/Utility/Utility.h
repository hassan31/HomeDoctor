
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import "Reachability.h"


@interface Utility : NSObject

// Network Reachability
+(BOOL)isNetworkAvailable;

+ (BOOL)evaluateEmail:(NSString *)email;

+ (id)getUserDefaultForKey:(NSString *)key;
+ (void)setUserDefaultForKey:(NSString *)key Data:(id)data;

+ (void)setForKey:(NSString *)key Value:(NSString *)value;
+ (void)showAlertView:(NSString *)title Message:(NSString *)message OKText:(NSString *)oKText;

//+ (NSString *)getDeviceUUID;

+ (NSString *)getForKey:(NSString *)key;

+ (NSString *)getDate;

+ (id)getViewController:(NSString *)viewControllerName;

+ (float)getScreenWidth;

+ (void)setImageBounds:(UIImageView *)imageView;

// Cross Dissolve Animation on UIviewController
+ (CATransition *)animationLayer;

// Navigationbar shaddow line color
+ (void)setNavigationBarShaddowLineColor:(UINavigationController *)navigationController withColor:(UIColor *)color;

+ (NSString *)documentDirectory;
+ (NSString *)GobbyWordsDirectory;

+ (void)removeFileAtPath:(NSString *)filePath;

+ (NSDictionary *)getAllCountryCodes;
+ (NSMutableArray *)getAllCountriesList;

@end
