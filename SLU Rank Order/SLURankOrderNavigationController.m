//
//  SLURankOrderNavigationController.m
//  SLU Rank Order
//
//  Created by RYAN MCNEELY on 9/18/12.
//  Copyright (c) 2012 drawkward. All rights reserved.
//

#import "SLURankOrderNavigationController.h"

@interface SLURankOrderNavigationController ()

@property (nonatomic) NSDictionary *titleTextDictionary;

@end

@implementation SLURankOrderNavigationController

@synthesize titleTextDictionary = _titleTextDictionary;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)setTitleFont{
    _titleTextDictionary = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], UITextAttributeTextColor, [UIFont fontWithName:@"Hoefler Text" size:21.0], UITextAttributeFont, nil];
    [self.navigationBar setTitleTextAttributes:_titleTextDictionary];
    [self.navigationBar setBackgroundColor:[UIColor darkGrayColor]];
    //[self.navigationBar setTintColor:[UIColor darkGrayColor]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitleFont];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
