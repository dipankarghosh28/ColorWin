//
//  ColorUtils.m
//  ColorWin
//  ColorUtils.m
//  ColorWin
//
//  Created by Dipankar Ghosh on 4/26/17.
//  Copyright © 2017 Dipankar Ghosh. All rights reserved.
//
#import "ColorUtils.h"
#import <UIKit/UIKit.h>
@implementation ColorUtils

#pragma mark Color

+ (UIColor *)redColor
{
    return [UIColor colorWithRed:244/255.0 green:171/255.0 blue:186/255.0 alpha:1];
}

+ (UIColor *)blueColor
{
     return [UIColor colorWithRed:80/255.0 green:165.0/255.0 blue:230.0/255.0 alpha:1];
}

+ (UIColor *)greenColor
{
    return [UIColor colorWithRed:62/255.0 green:114.0/255.0 blue:29.0/255.0 alpha:1];
}

+ (UIColor *)yellowColor
{
    return [UIColor colorWithRed:255.0/255.0 green:217.0/255.0 blue:131.0/255.0 alpha:1];
}


+ (NSArray *) validColorNames
{
    return @[@"PINK", @"BLUE", @"GREEN", @"YELLOW"];
}

+ (NSArray *) validColors
{
    return @[[ColorUtils redColor], [ColorUtils blueColor], [ColorUtils greenColor], [ColorUtils yellowColor]];
}

+ (NSString *)randomColorText
{
    NSArray *colors = [ColorUtils validColorNames];
    NSUInteger colorCount = [colors count];
    NSUInteger colorIndex = [ColorUtils randomIndex:colorCount];
    return colors[colorIndex];
}

+ (UIColor *)randomColor:(NSArray *)colors
{
    NSUInteger colorCount = [colors count];
    NSUInteger colorIndex = [ColorUtils randomIndex:colorCount];
    return colors[colorIndex];
}

+ (NSUInteger)randomIndex:(NSUInteger)colorCount
{
    return arc4random() % colorCount;
}

#pragma mark Score
#define Score @"ColorTeller.score"
#define HighestScore @"ColorTeller.highestScore"


+ (void)saveHighestScore:(NSInteger)score
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    [standardUserDefaults setInteger:score forKey:HighestScore];
}

+ (NSInteger)getHighestScore
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger score = [standardUserDefaults integerForKey:HighestScore];
    return score;
}

@end
