//
//  WebViewController.m
//  Week2Assessment
//
//  Created by Evan Vandenberg on 1/16/15.
//  Copyright (c) 2015 Evan Vandenberg. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadNewWebPage:self.webAddress];
}

- (void)loadNewWebPage:(NSString *)string
{
    NSString *addressString = string;
    NSURL *adddressURL = [NSURL URLWithString:addressString];
    NSURLRequest *addressRequest = [NSURLRequest requestWithURL:adddressURL];
    [self.webView loadRequest:addressRequest];
}

- (IBAction)onBackButtonPressed:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
