//
//  CityCustomClass.h
//  Week2Assessment
//
//  Created by Evan Vandenberg on 1/16/15.
//  Copyright (c) 2015 Evan Vandenberg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CityCustomClass : NSObject

@property NSString *cityName;
@property NSString *stateName;
@property UIImage *cityImage;
@property NSString *webAddress;

- (instancetype)initWithName:(NSString *)city :(NSString *)state :(UIImage *)image :(NSString *)web;


@end
