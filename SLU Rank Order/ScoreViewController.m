//
//  ScoreViewController.m
//  SLU Rank Order
//
//  Created by RYAN MCNEELY on 9/17/12.
//  Copyright (c) 2012 drawkward. All rights reserved.
//

#import "ScoreViewController.h"

@interface ScoreViewController ()

//array of objects which are ranked by radius, from
//smallest to largest.
@property (strong, nonatomic) NSArray *properlyRankedItems;

//these will display the scores calculated by the "calculateDelta" method.
@property (weak, nonatomic) IBOutlet UILabel *soloScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *pairScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *groupScoreLabel;

//arrays of ranked items transferred to this view controller
@property (nonatomic, strong) NSMutableArray *rankedSolo;
@property (nonatomic, strong) NSMutableArray *rankedPair;
@property (nonatomic, strong) NSMutableArray *rankedGroup;

//integer representations of scores
@property (nonatomic) int soloScore;
@property (nonatomic) int pairScore;
@property (nonatomic) int groupScore;

@end

@implementation ScoreViewController

@synthesize properlyRankedItems = _properlyRankedItems;

@synthesize soloScoreLabel = _soloScoreLabel;
@synthesize pairScoreLabel = _pairScoreLabel;
@synthesize groupScoreLabel = _groupScoreLabel;

@synthesize rankedSolo = _rankedSolo;
@synthesize rankedPair = _rankedPair;
@synthesize rankedGroup = _rankedGroup;

@synthesize soloScore = _soloScore;
@synthesize pairScore = _pairScore;
@synthesize groupScore = _groupScore;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

//receives the three re-ordered arrays from the previous view controller.
- (void)setDetailItem:(NSMutableArray *)newDetailItem{
    
    if ([newDetailItem lastObject]==@"Solo"){
        _rankedSolo = newDetailItem;
        //NSLog(@"Solo list items successfully transferred");
    }
    if (([newDetailItem lastObject]==@"Pair")) {
        _rankedPair = newDetailItem;
        //NSLog(@"Pair list items successfully transferred");
    }
    if (([newDetailItem lastObject]==@"Group")) {
        _rankedGroup = newDetailItem;
        //NSLog(@"Group list items successfully transferred");
    }
}

//pleasantly animates the scores' entrance.
-(void)fadeInScores{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:2.0];
    [_soloScoreLabel setAlpha:0.6];
    [_pairScoreLabel setAlpha:0.6];
    [_groupScoreLabel setAlpha:0.6];
    [UIView commitAnimations];
}

//compare an NSMutableArray object to the array called properlyRankedItems,
//returns the number of objects whose indexes are different than those contained in
//the properlyRankedItems array.
-(int)calculateDelta:(NSMutableArray *)rankedList{

    int delta = 0;
    for (int i = 0; i < [rankedList count]-1; ++i){
        if ([rankedList objectAtIndex:i] != [_properlyRankedItems objectAtIndex:i]){
            delta += 1;
            //NSLog(@"incremented delta by 1");
        }
    }
    //NSLog(@"successfully calculated delta");
    return delta;
}

//calls calculateDelta method on each of the three transferred arrays
-(void)getScores{
    _soloScore = [self calculateDelta:_rankedSolo];
    _pairScore = [self calculateDelta:_rankedPair];
    _groupScore = [self calculateDelta:_rankedGroup];
}

//update score label text to reflect the integer value returned
//when calculateDelta method is called.
-(void)updateScoreLabels{
    _soloScoreLabel.text = [NSString stringWithFormat:@"%i", _soloScore];
    //NSLog([NSString stringWithFormat:@"%i", _soloScore]);
    _pairScoreLabel.text = [NSString stringWithFormat:@"%i", _pairScore];
    //NSLog([NSString stringWithFormat:@"%i", _pairScore]);
    _groupScoreLabel.text = [NSString stringWithFormat:@"%i", _groupScore];
    //NSLog([NSString stringWithFormat:@"%i", _groupScore]);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //initialize the array with the items ordered by radius,
    //from smallest to largest.
    _properlyRankedItems = [[NSMutableArray alloc] initWithObjects:@"Carbon Nanotube", @"Human Hair",
                            @"Single Strand of Spaghetti", @"Pencil", @"Chap Stick", @"Dime (US Coin)", @"Human Eyeball",
                            @"Ice Cream Cone", @"Billiard Balls", @"Aluminum Soda Can (12 Oz.)", @"Orange", @"CD",
                            @"Frisbee", @"Large Pizza", @"Keg of Beer", @"Boeing 747 Fuselage", @"Leaning Tower of Pisa",
                            @"Largest Crater on Earth", @"Earth", @"Jupiter", nil];
    
    [self getScores];
    [self updateScoreLabels];
    [self fadeInScores];
}

- (void)viewDidUnload
{
    [self setSoloScoreLabel:nil];
    [self setPairScoreLabel:nil];
    [self setGroupScoreLabel:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
