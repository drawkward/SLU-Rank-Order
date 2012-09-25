//
//  GroupViewController.m
//  SLU Rank Order
//
//  Created by RYAN MCNEELY on 9/17/12.
//  Copyright (c) 2012 drawkward. All rights reserved.
//

#import "GroupViewController.h"
#import "ScoreViewController.h"

@interface GroupViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *commitButton;

@property (strong, nonatomic) NSMutableArray *rankedSolo;
@property (strong, nonatomic) NSMutableArray *rankedPair;
@property (strong, nonatomic) NSMutableArray *groupItems;

@end

@implementation GroupViewController

@synthesize commitButton = _commitButton;
@synthesize rankedSolo = _rankedSolo;
@synthesize rankedPair = _rankedPair;
@synthesize groupItems = _groupItems;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

//triggers "ShowScoreView" segue and ends editing
- (IBAction)commitPressed:(UIBarButtonItem *)sender {
    [self setEditing:NO animated:YES];
    //append the string "Group" to the array so that it
    //can be identified when It's passed to the next view.
    [_groupItems addObject:@"Group"];
    [self performSegueWithIdentifier:@"ShowScoreView" sender:self];
}

//method used when passing Solo and Pair lists from previous view controller.
//Each of the arrays is identified by the string object appended to it.
- (void)setDetailItem:(NSMutableArray *)newDetailItem{
    
    if ([newDetailItem lastObject]==@"Solo"){
        _rankedSolo = [newDetailItem copy];
        //NSLog(@"Solo list items successfully transferred");
    }
    if ([newDetailItem lastObject]==@"Pair"){
        _rankedPair = [newDetailItem copy];
        //NSLog(@"Pair list items successfully transferred");
    }
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    //initialize the table view with the preset ordering of rankable items
    _groupItems = [[NSMutableArray alloc] initWithObjects:@"Carbon Nanotube", @"Billiard Balls",
                   @"Earth", @"Boeing 747 Fuselage", @"Dime (US Coin)", @"CD", @"Chap Stick", @"Orange",
                   @"Human Hair", @"Ice Cream Cone", @"Large Pizza", @"Aluminum Soda Can (12 Oz.)",
                   @"Pencil", @"Frisbee", @"Human Eyeball", @"Largest Crater on Earth", @"Jupiter",
                   @"Leaning Tower of Pisa", @"Single Strand of Spaghetti", @"Keg of Beer", nil];
}

- (void)viewDidUnload
{
    [self setCommitButton:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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
    return [_groupItems count];
}

//allow reordering of items
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

//instantiate and configure cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    
    // Configure the cell...
    NSString *cellContent = [_groupItems objectAtIndex:indexPath.row];
    cell.textLabel.text = cellContent;
    cell.textLabel.font = [UIFont fontWithName:@"Hoefler Text" size:18];
    cell.showsReorderControl = YES;
    return cell;
}

//disable indentation during editing
- (BOOL)tableView:(UITableView *)tableview shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

//get rid of "delete" circles when in editing mode
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleNone;
}

//Enables rearranging of the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath{
    
    NSString *itemToMove = [_groupItems objectAtIndex:fromIndexPath.row];
    [_groupItems removeObjectAtIndex:fromIndexPath.row];
    [_groupItems insertObject:itemToMove atIndex:toIndexPath.row];
    
}

//send the three newly ordered lists to the ScoreViewController
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowScoreView"]){
    ScoreViewController *detail = [segue destinationViewController];
    [detail setDetailItem:_rankedPair];
    [detail setDetailItem:_rankedSolo];
    [detail setDetailItem:_groupItems];
    }
}

#pragma mark - Table view delegate

//enable editing when user touches a list item.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self setEditing:YES animated:YES];
}

@end
