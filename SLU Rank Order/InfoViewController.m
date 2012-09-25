//
//  InfoViewController.m
//  SLU Rank Order
//
//  Created by RYAN MCNEELY on 9/23/12.
//  Copyright (c) 2012 drawkward. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()
@property (weak, nonatomic) IBOutlet UILabel *instructions;
@property (weak, nonatomic) IBOutlet UIButton *okButton;

@end

@implementation InfoViewController

@synthesize instructions = _instructions;
@synthesize okButton = _okButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)fadeInText{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:2.0];
    [_instructions setAlpha:0.7];
    [_okButton setAlpha:0.6];
    [UIView commitAnimations];
}

- (IBAction)okPressed:(UIButton *)sender {
    [self dismissModalViewControllerAnimated:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self fadeInText];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setInstructions:nil];
    [self setOkButton:nil];
    [super viewDidUnload];
}
@end
