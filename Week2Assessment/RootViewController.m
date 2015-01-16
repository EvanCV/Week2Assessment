//
//  ViewController.m
//  Week2Assessment
//
//  Created by Evan Vandenberg on 1/16/15.
//  Copyright (c) 2015 Evan Vandenberg. All rights reserved.
//

#import "RootViewController.h"
#import "CityCustomClass.h"
#import "DetailViewController.h"

@interface RootViewController () <UITableViewDataSource, UITableViewDelegate, DetailViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSIndexPath *indexPath;
@property (nonatomic, weak) DetailViewController *detailViewProp;



@end

@implementation RootViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    CityCustomClass *city1 = [[CityCustomClass alloc]initWithName:@"Miami" :@"Florida" :[UIImage imageNamed:@"miami_pic"] :@"http://en.wikipedia.org/wiki/Miami"];
    CityCustomClass *city2 = [[CityCustomClass alloc]initWithName:@"Denver" :@"Colorado" :[UIImage imageNamed:@"denver_pic"] :@"http://en.wikipedia.org/wiki/Denver"];
    CityCustomClass *city3 = [[CityCustomClass alloc]initWithName:@"Phoenix" :@"Arizona" :[UIImage imageNamed:@"phoenix_pic"] :@"http://en.wikipedia.org/wiki/Phoenix,_Arizona"];
    CityCustomClass *city4 = [[CityCustomClass alloc]initWithName:@"Seattle" :@"Washington" :[UIImage imageNamed:@"seattle_pic"] :@"http://en.wikipedia.org/wiki/Seattle"];

    self.citiesArray = [[NSMutableArray alloc]initWithObjects:city1,city2,city3,city4,nil];
    
    [self.tableView reloadData];

    self.detailViewProp.delegate = self;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    CityCustomClass *cell1 = [self.citiesArray objectAtIndex:indexPath.row];
    NSLog(@"%@",cell1);
    self.indexPath = indexPath;
    cell.textLabel.text = cell1.cityName;
    cell.imageView.image = cell1.cityImage;
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.citiesArray.count;
}

//NEED this to make sure the tableview updates after edits are made to the creatures details/name
- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

//DetailViewController delegate method being called
- (void) titleButtonPressed: (NSString *)name
{
    NSLog(@"Delegate Called");
    self.navigationItem.title = name;
//    [self.tableView reloadData];


}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    DetailViewController *vc = segue.destinationViewController;
    vc.cityInfo = [self.citiesArray objectAtIndex:path.row];
    vc.delegate = self;
    self.title = @"";
}



@end
