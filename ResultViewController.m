//
//  ResultViewController.m
//  ColorWin
//
//  Created by Dipankar Ghosh on 4/26/17.
//  Copyright © 2017 Dipankar Ghosh. All rights reserved.
//
#import "ResultViewController.h"
#import "ColorUtils.h"
#import <UIKit/UIKit.h>

@interface ResultViewController ()

@property (weak, nonatomic) IBOutlet UILabel *scoreRecordText;
@property (weak, nonatomic) IBOutlet UILabel *scoreText;

@end

@implementation ResultViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSInteger highestScore = [ColorUtils getHighestScore];
    if (highestScore < self.score) {
        highestScore = self.score;
        [ColorUtils saveHighestScore:self.score];
    }
    
    self.scoreRecordText.text = [NSString stringWithFormat:@"%d", (int)highestScore];
    self.scoreText.text = [NSString stringWithFormat:@"%d", (int)self.score];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (IBAction)tryAgain:(id)sender {
    [self.navigationController popViewControllerAnimated:TRUE];
}

@end
