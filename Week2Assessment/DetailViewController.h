//
//  CityViewController.h
//  Week2Assessment
//
//  Created by Evan Vandenberg on 1/16/15.
//  Copyright (c) 2015 Evan Vandenberg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CityCustomClass.h"
#import "RootViewController.h"
#import "WebViewController.h"

@protocol DetailViewDelegate <NSObject>

- (void) titleButtonPressed :(NSString *)name;


@end

@interface DetailViewController : UIViewController

@property CityCustomClass *cityInfo;
//@property WebViewController *webInfo;

@property (nonatomic, weak) id <DetailViewDelegate> delegate;

@end
