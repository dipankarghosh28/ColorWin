//
//  ColorBeatViewController.m
//  ColorWin
//
//  Created by Dipankar Ghosh on 4/26/17.
//  Copyright © 2017 Dipankar Ghosh. All rights reserved.
//
#import "ColorBeatViewController.h"
#import "ResultViewController.h"
#import "RoundedCornerView.h"
#import "ColorUtils.h"
#import <AVFoundation/AVFoundation.h>

@interface ColorBeatViewController ()
@property (weak, nonatomic) IBOutlet UILabel *timerTextView;
@property (weak, nonatomic) IBOutlet UILabel *scoreView;
@property (weak, nonatomic) IBOutlet RoundedCornerView *quizColorView;
@property (weak, nonatomic) IBOutlet UILabel *quizTextView;
@property (weak, nonatomic) IBOutlet UIView *buttonsView;
@property (weak, nonatomic) NSTimer *timer;

@property (nonatomic, strong) AVAudioPlayer* playerPos;
@property (nonatomic, strong) AVAudioPlayer* playerNeg;
@property (nonatomic, strong) AVAudioPlayer* playerGame;

@property (nonatomic) NSInteger count;
@property (nonatomic) CGFloat timerFloat;
@property (nonatomic) BOOL isGameStarted;


@end


@implementation ColorBeatViewController

#define TIMER_COUNT 10.0

#pragma mark Controller

- (void)setCount:(NSInteger)count
{
    _count = count;
    self.scoreView.text = [NSString stringWithFormat:@"%d", (int)count];
    
}

- (void)setTimerFloat:(CGFloat)timerFloat
{
    _timerFloat = timerFloat;
    self.timerTextView.text = [NSString stringWithFormat:@"%.01f", timerFloat];
}

- (void)changePuzzle
{
    // Get Two Random Color
    NSArray *colors = [ColorUtils validColors];
    NSUInteger colorCount = [colors count];
    NSUInteger colorIndex1 = [ColorUtils randomIndex:colorCount];
    NSUInteger colorIndex2 = [ColorUtils randomIndex:colorCount-1];
    if (colorIndex2 == colorIndex1) {
        colorIndex2++;
    }
    
    self.quizColorView.backgroundColor = colors[colorIndex1];
    self.quizTextView.textColor = colors[colorIndex2];
    self.quizTextView.text = [ColorUtils randomColorText];
}

- (void)checkAnswer:(NSUInteger)indexOfButtonIndex
{
    
    NSArray *colorNames = [ColorUtils validColorNames];
    NSUInteger indexOfTextNameInArray = [colorNames indexOfObject:self.quizTextView.text];
    
    if (indexOfTextNameInArray == indexOfButtonIndex)
    {
        [self.playerPos play];
        self.count += 5;
        self.timerFloat += 1.0;
    }
    else
    {
        [self.playerNeg play];
        self.count -= 3;
        self.timerFloat -= 1.0;
    }
}

- (void)updateTimer:(id)sender
{
    if (!self.isGameStarted)
        return;
    
    self.timerFloat -= 0.1;
    if (self.timerFloat <= 0)
    {
        NSLog(@"Entered here");
        [self performSegueWithIdentifier:@"ResultFinal" sender:self];
        self.timerFloat = TIMER_COUNT;
    }
}

- (void)buttonTapped:(UITapGestureRecognizer *)gr {
    RoundedCornerView *buttonView = (RoundedCornerView *)gr.view;
    NSUInteger buttonIndex = [self.buttonsView.subviews indexOfObject:buttonView];
    [self checkAnswer:buttonIndex];
    [self changePuzzle];
    self.isGameStarted = YES;
    
}

- (void)addQuizButtons
{
    
    for (UIView *subView in self.buttonsView.subviews)
    {
        [subView removeFromSuperview];
    }
    
    CGRect frame = self.buttonsView.bounds;
    
    NSArray *colors = [ColorUtils validColors];
    NSUInteger count = [colors count];
    
    CGFloat height = frame.size.height;
    CGFloat gap = 8;
    CGFloat width = (frame.size.width - (count-1) * gap) / count;
    
    for (int i = 0; i < count; i++ ) {
        CGRect buttonFrame = CGRectMake(frame.origin.x + i * gap + i * width
                                        , frame.origin.y, width, height);
        
        RoundedCornerView *buttonView = [[RoundedCornerView alloc] initWithFrame:buttonFrame];
        [buttonView commonInit];
        buttonView.backgroundColor = colors[i];
        
        UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonTapped:)];
        [buttonView addGestureRecognizer:tapGR];
        
        [self.buttonsView addSubview:buttonView];
    }
}

@end
