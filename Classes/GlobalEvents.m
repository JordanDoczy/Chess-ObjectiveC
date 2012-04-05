//
//  GlobalEvents.m
//  Chess
//
//  Created by Jordan Doczy on 3/28/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "GlobalEvents.h"


@implementation GlobalEvents

static NSString *change_event_data = @"change_event_data";
static NSString *change_event = @"change_event";

+ (NSString*) CHANGE_EVENT{
	return change_event;
}


+ (NSString*) CHANGE_EVENT_DATA{
	return change_event_data;
}


@end
