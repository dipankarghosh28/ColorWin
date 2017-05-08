//
//  RoundedCornerView.m
//  ColorWin
//
//  Created by Dipankar Ghosh on 4/26/17.
//  Copyright © 2017 Dipankar Ghosh. All rights reserved.
//
#import "RoundedCornerView.h"

@implementation RoundedCornerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
    }
    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder;
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    CALayer *layer = self.layer;
    layer.cornerRadius  = 10.0f;
    layer.masksToBounds = YES;
}


@end
