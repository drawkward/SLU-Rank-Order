//
//  SoloViewController.m
//  SLU Rank Order
//
//  Created by RYAN MCNEELY on 9/17/12.
//  Copyright (c) 2012 drawkward. All rights reserved.
//

#import "SoloViewController.h"
#import "PairViewController.h"

@interface SoloViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *commitButton;

@property (strong, nonatomic) NSMutableArray *soloItems;

@end

@implementation SoloViewController

@synthesize commitButton = _commitButton;
@synthesize soloItems = _soloItems;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

//exit editing, update subtitle to reflect new indices
- (IBAction)updatePressed:(UIBarButtonItem *)sender {
    if (self.editing){
    [self setEditing:NO animated:YES];
    [self.tableView setNeedsDisplay];
    }
}

//triggers "ShowPairView" segue and transfers re-ordered soloItems array to next view.
- (IBAction)commitPressed:(UIBarButtonItem *)sender {
    if (self.editing){
    [self setEditing:NO animated:YES];
    }
    [_soloItems addObject:@"Solo"];
    [self performSegueWithIdentifier:@"ShowPairView" sender:self];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;

    //populate the soloItems array with out-of-order items to be ranked
    _soloItems = [[NSMutableArray alloc] initWithObjects:@"Carbon Nanotube", @"Billiard Balls",
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    // Return the number of sections.
    return 1;
}

//returns number of rows in a section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_soloItems count];
}

//instantiate and configure the cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    
    // Configure the cell...
    
    NSString *cellContent = [_soloItems objectAtIndex:indexPath.row];
    cell.textLabel.text = cellContent;
    cell.textLabel.font = [UIFont fontWithName:@"Hoefler Text" size:18];
    int itemPosition = [_soloItems indexOfObject:[_soloItems objectAtIndex:indexPath.row]];
    //subtitle text reflects the index of the item
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%i", itemPosition+1];
    cell.detailTextLabel.font = [UIFont fontWithName:@"Hoefler Text" size:14];
    cell.showsReorderControl = YES;
    return cell;
}

//disable indentation during editing
- (BOOL)tableView:(UITableView *)tableview shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

//hide the "delete" circles during editing
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleNone;
}

//support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath{
    
    NSString *itemToMove = [_soloItems objectAtIndex:fromIndexPath.row];
    [_soloItems removeObjectAtIndex:fromIndexPath.row];
    [_soloItems insertObject:itemToMove atIndex:toIndexPath.row];
}


//pass Solo items list to the PairViewController
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([[segue identifier] isEqualToString:@"ShowPairView"]){
        
        PairViewController *detail = [segue destinationViewController];
        [detail setDetailItem:_soloItems];
        //NSLog(@"Successfully sent setDetailItem call to PairViewController");
    }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //touching a row begins editing mode
    [self setEditing:YES animated:YES];

}

@end
