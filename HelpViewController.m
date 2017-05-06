//
//  HelpViewController.m
//  ColorWin
//
//  Created by Dipankar Ghosh on 4/26/17.
//  Copyright © 2017 Dipankar Ghosh. All rights reserved.
//
#import "HelpViewController.h"

@interface HelpViewController ()
@property (weak, nonatomic) IBOutlet UIView *imageView;

@end

@implementation HelpViewController

- (void) updateImage
{
    for (UIView *view in self.imageView.subviews) {
        [view removeFromSuperview];
    }
    
    UIImageView *imageSubView = [[UIImageView alloc] initWithFrame:self.imageView.bounds];
    imageSubView.image = [UIImage imageNamed:@"screenshot2"];
    [self.imageView addSubview:imageSubView];
}


- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self updateImage];
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self updateImage];
    
    
}
- (IBAction)backGame:(id)sender {
    [self.navigationController popViewControllerAnimated:TRUE];
}

@end
