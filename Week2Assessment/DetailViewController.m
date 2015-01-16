//
//  CityViewController.m
//  Week2Assessment
//
//  Created by Evan Vandenberg on 1/16/15.
//  Copyright (c) 2015 Evan Vandenberg. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UITextField *cityText;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UITextField *stateText;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //Set name label to SHOW
    self.cityText.hidden = YES;
    self.cityLabel.hidden = NO;

    //Set description label to SHOW
    self.stateText.hidden = YES;
    self.stateLabel.hidden = NO;

    //Set initial name and description
    self.cityLabel.text = self.cityInfo.cityName;
    self.stateLabel.text = self.cityInfo.stateName;
    self.backgroundImageView.image = self.cityInfo.cityImage;
}

- (IBAction)button:(UIButton *)sender
{
    [self.delegate titleButtonPressed:self.cityInfo.cityName];
    self.title = self.cityInfo.cityName;
}

//- (IBAction)onTap:(UITapGestureRecognizer *)sender
//{
//}


- (IBAction)onEditButtonPressed:(UIBarButtonItem *)sender
{
    //Edit mode actions
    if ([self.editButton.title isEqualToString:@"Edit"])
    {
        [self reloadInputViews];
        self.cityText.hidden = NO;
        self.stateText.hidden = NO;
        self.cityLabel.hidden = YES;
        self.stateLabel.hidden = YES;
        self.cityText.text = self.cityLabel.text;
        self.stateText.text = self.stateLabel.text;
        self.editButton.title = @"Done";
    }
    //Disable edit mode
    else
    {
        [self.editButton.title isEqualToString:@"Edit"];
        self.cityText.hidden = YES;
        self.stateText.hidden = YES;
        self.stateLabel.hidden = NO;
        self.cityLabel.hidden = NO;
        self.cityLabel.text = self.cityText.text;
        self.stateLabel.text = self.stateText.text;
        self.cityInfo.cityName = self.cityText.text;
        self.cityInfo.stateName = self.stateText.text;
    }
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WebViewController *vc = segue.destinationViewController;
    vc.webAddress = self.cityInfo.webAddress;
}



@end
