//
//  PairRecallViewController.m
//  SLU Rank Order
//
//  Created by RYAN on 10/6/12.
//  Copyright (c) 2012 drawkward. All rights reserved.
//

#import "PairRecallViewController.h"

@interface PairRecallViewController ()

@property (nonatomic) NSDictionary *titleTextDictionary;
@property (weak, nonatomic) IBOutlet UINavigationBar *navBarItem;

@property (strong, nonatomic) NSMutableArray *committedPair;

@end

@implementation PairRecallViewController

@synthesize titleTextDictionary = _titleTextDictionary;
@synthesize navBarItem = _navBarItem;
@synthesize committedPair = _committedPair;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)xPressed:(UIBarButtonItem *)sender {
    [self dismissModalViewControllerAnimated:YES];
}

//method used when passing Solo list from previous view controller to the current one
- (void)setDetailItem:(NSMutableArray *)newDetailItem{
    
    if ([newDetailItem lastObject]==@"Pair"){
        _committedPair = [newDetailItem copy];
        //NSLog(@"Solo list items successfully transferred");
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitleFont];

}

-(void)setTitleFont{
    _titleTextDictionary = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], UITextAttributeTextColor, [UIFont fontWithName:@"Hoefler Text" size:21.0], UITextAttributeFont, nil];
    [self.navBarItem setTitleTextAttributes:_titleTextDictionary];
    [self.navBarItem setBackgroundColor:[UIColor darkGrayColor]];
    //[self.navigationBar setTintColor:[UIColor darkGrayColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
    return [_committedPair count]-1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    
    // Configure the cell...
    NSString *cellContent = [_committedPair objectAtIndex:indexPath.row];
    cell.textLabel.text = cellContent;
    cell.textLabel.font = [UIFont fontWithName:@"Hoefler Text" size:18];
    //subtitle reflects listed object's index
    int itemPosition = [_committedPair indexOfObject:[_committedPair objectAtIndex:indexPath.row]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%i", itemPosition+1];
    cell.detailTextLabel.font = [UIFont fontWithName:@"Hoefler Text" size:14];
    return cell;
}

- (void)viewDidUnload {
    [self setNavBarItem:nil];
    [super viewDidUnload];
}
@end
