//
//  SoloRecallViewController.m
//  SLU Rank Order
//
//  Created by RYAN on 10/6/12.
//  Copyright (c) 2012 drawkward. All rights reserved.
//

#import "SoloRecallViewController.h"

@interface SoloRecallViewController ()

@property (weak, nonatomic) IBOutlet UINavigationBar *navBarItem;
@property (nonatomic) NSDictionary *titleTextDictionary;
@property (strong, nonatomic) NSMutableArray *committedSolo;

@end

@implementation SoloRecallViewController

@synthesize navBarItem = _navBarItem;
@synthesize titleTextDictionary = _titleTextDictionary;
@synthesize committedSolo = _committedSolo;

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

//method used when passing Solo list from previous view controller to the next
- (void)setDetailItem:(NSMutableArray *)newDetailItem{
    
    if ([newDetailItem lastObject]==@"Solo"){
        _committedSolo = [newDetailItem copy];
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
    // Dispose of any resources that can be recreated.
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
    return [_committedSolo count]-1;
}

//instantiate and configure cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    
    // Configure the cell...
    NSString *cellContent = [_committedSolo objectAtIndex:indexPath.row];
    cell.textLabel.text = cellContent;
    cell.textLabel.font = [UIFont fontWithName:@"Hoefler Text" size:18];
    int itemPosition = [_committedSolo indexOfObject:[_committedSolo objectAtIndex:indexPath.row]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%i", itemPosition+1];
    cell.detailTextLabel.font = [UIFont fontWithName:@"Hoefler Text" size:14];
    return cell;
}

- (void)viewDidUnload {
    [self setNavBarItem:nil];
    [super viewDidUnload];
}
@end
