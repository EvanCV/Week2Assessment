//
//  CityCustomClass.m
//  Week2Assessment
//
//  Created by Evan Vandenberg on 1/16/15.
//  Copyright (c) 2015 Evan Vandenberg. All rights reserved.
//

#import "CityCustomClass.h"

@implementation CityCustomClass

- (instancetype)initWithName:(NSString *)city :(NSString *)state :(UIImage *)image :(NSString *)web;
{
//    self = [super init];
//    NSLog(@"%@", self);

    if (self)
    {
        self.cityName = city;
        self.stateName = state;
        self.cityImage = image;
        self.webAddress = web;
    }

    return self;
}


@end
