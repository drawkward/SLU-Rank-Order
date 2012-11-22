//
//  CorrectRankViewController.m
//  SLU Rank Order
//
//  Created by RYAN on 10/7/12.
//  Copyright (c) 2012 drawkward. All rights reserved.
//

#import "CorrectRankViewController.h"

@interface CorrectRankViewController ()

@property (weak, nonatomic) IBOutlet UINavigationBar *navBarItem;
@property (nonatomic) NSDictionary *titleTextDictionary;
@property (strong, nonatomic) NSMutableArray *correctRanking;

@end

@implementation CorrectRankViewController

@synthesize navBarItem = _navBarItem;
@synthesize titleTextDictionary = _titleTextDictionary;
@synthesize correctRanking = _correctRanking;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}
- (IBAction)xPressed:(UIBarButtonItem *)sender {
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitleFont];
    
    _correctRanking = [[NSMutableArray alloc] initWithObjects:@"Carbon Nanotube", @"Human Hair",
                            @"Single Strand of Spaghetti", @"Pencil", @"Chap Stick", @"Dime (US Coin)", @"Human Eyeball",
                            @"Ice Cream Cone", @"Billiard Balls", @"Aluminum Soda Can (12 Oz.)", @"Orange", @"CD",
                            @"Frisbee", @"Large Pizza", @"Keg of Beer", @"Boeing 747 Fuselage", @"Leaning Tower of Pisa",
                            @"Largest Crater on Earth", @"Earth", @"Jupiter", nil];
        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)setTitleFont{
    _titleTextDictionary = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], UITextAttributeTextColor, [UIFont fontWithName:@"Hoefler Text" size:21.0], UITextAttributeFont, nil];
    [self.navBarItem setTitleTextAttributes:_titleTextDictionary];
    [self.navBarItem setBackgroundColor:[UIColor darkGrayColor]];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_correctRanking count];
}

//instantiate and configure cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    
    // Configure the cell...
    NSString *cellContent = [_correctRanking objectAtIndex:indexPath.row];
    cell.textLabel.text = cellContent;
    cell.textLabel.font = [UIFont fontWithName:@"Hoefler Text" size:18];
    int itemPosition = [_correctRanking indexOfObject:[_correctRanking objectAtIndex:indexPath.row]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%i", itemPosition+1];
    cell.detailTextLabel.font = [UIFont fontWithName:@"Hoefler Text" size:14];
    return cell;
}

@end
