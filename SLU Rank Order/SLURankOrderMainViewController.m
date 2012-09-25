//
//  SLURankOrderMainViewController.m
//  SLU Rank Order
//
//  Created by RYAN MCNEELY on 9/17/12.
//  Copyright (c) 2012 drawkward. All rights reserved.
//

#import "SLURankOrderMainViewController.h"
#import "SoloViewController.h"

@interface SLURankOrderMainViewController ()

@property (weak, nonatomic) IBOutlet UIButton *beginButton;

@end

@implementation SLURankOrderMainViewController

@synthesize beginButton = _beginButton;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//triggers "ShowSoloView" segue
- (IBAction)beginPressed:(UIButton *)sender {
    [self performSegueWithIdentifier:@"ShowSoloView" sender:self];
}

//triggers "ShowInfoView" segue
- (IBAction)infoPressed:(UIButton *)sender {
    [self performSegueWithIdentifier:@"ShowInfoView" sender:self];
}

//cause go button to fade in and out three times
-(void)animateGoButton{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationRepeatCount:3.0];
    [UIView setAnimationRepeatAutoreverses:YES];
    [_beginButton setAlpha:0.6];
    [UIView commitAnimations];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self animateGoButton];
}

- (void)viewDidUnload
{
    [self setBeginButton:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end