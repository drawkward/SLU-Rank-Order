//
//  PairViewController.m
//  SLU Rank Order
//
//  Created by RYAN MCNEELY on 9/17/12.
//  Copyright (c) 2012 drawkward. All rights reserved.
//

#import "PairViewController.h"
#import "GroupViewController.h"

@interface PairViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *commitButton;

@property (strong, nonatomic) NSMutableArray *rankedSolo;
@property (strong, nonatomic) NSMutableArray *pairItems;

@end

@implementation PairViewController

@synthesize commitButton = _commitButton;
@synthesize rankedSolo = _rankedSolo;
@synthesize pairItems = _pairItems;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

//triggers "ShowGroupView" segue
- (IBAction)commitPressed:(UIBarButtonItem *)sender {
    [self setEditing:NO animated:YES];
    //append the string "Pair" to the array so that it
    //can be identified when It's passed to the next view.
    [_pairItems addObject:@"Pair"];
    [self performSegueWithIdentifier:@"ShowGroupView" sender:self];
}

//method used when passing Solo list from previous view controller to the next
- (void)setDetailItem:(NSMutableArray *)newDetailItem{
    
    if ([newDetailItem lastObject]==@"Solo"){
        _rankedSolo = [newDetailItem copy];
        //NSLog(@"Solo list items successfully transferred");
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    //initialize the table view with the preset ordering of rankable items
    _pairItems = [[NSMutableArray alloc] initWithObjects:@"Carbon Nanotube", @"Billiard Balls",
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
    return [_pairItems count];
}

//instantiate and configure cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    
    // Configure the cell...
    NSString *cellContent = [_pairItems objectAtIndex:indexPath.row];
    cell.textLabel.text = cellContent;
    cell.textLabel.font = [UIFont fontWithName:@"Hoefler Text" size:18];
    cell.showsReorderControl = YES;
    return cell;
}

//disable indentation during editing
- (BOOL)tableView:(UITableView *)tableview shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

//get rid of ugly "delete" circles when in editing mode
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleNone;
}

//Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath{
    
    NSString *itemToMove = [_pairItems objectAtIndex:fromIndexPath.row];
    [_pairItems removeObjectAtIndex:fromIndexPath.row];
    [_pairItems insertObject:itemToMove atIndex:toIndexPath.row];

}


#pragma mark - Table view delegate

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //pass rankedSolo and pairItems arrays to next view controller
    if ([[segue identifier] isEqualToString:@"ShowGroupView"]){

    GroupViewController *detail = [segue destinationViewController];
    [detail setDetailItem:_pairItems];
    [detail setDetailItem:_rankedSolo];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //editing begins when user taps a tableView cell
    [self setEditing:YES animated:YES];
}

@end
