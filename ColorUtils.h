//
//  ColorUtils.h
//  ColorWin
//
//  Created by Dipankar Ghosh on 4/26/17.
//  Copyright © 2017 Dipankar Ghosh. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ColorUtils : NSObject

+ (UIColor *)redColor;
+ (UIColor *)blueColor;
+ (UIColor *)greenColor;
+ (UIColor *)yellowColor;


+ (NSArray *) validColorNames;
+ (NSArray *) validColors;
+ (NSString *)randomColorText;
+ (UIColor *)randomColor:(NSArray *)colors;
+ (NSUInteger)randomIndex:(NSUInteger)colorCount;


+ (void)saveHighestScore:(NSInteger)score;
+ (NSInteger)getHighestScore;
@end
