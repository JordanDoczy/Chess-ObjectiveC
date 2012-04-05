//
//  GlobalEvents.m
//  Chess
//
//  Created by Jordan Doczy on 3/28/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "GlobalEvents.h"


@implementation GlobalEvents

static NSString *change_event = @"change_event";
static NSString *change_event_data = @"change_event_data";

static NSString *mousedown_event = @"mousedown_event";
static NSString *mousedown_event_data = @"mousedown_event_data";

static NSString *mouseup_event = @"mouseup_event";
static NSString *mouseup_event_data = @"mouseup_event_data";


+ (NSString*) CHANGE_EVENT{
	return change_event;
}
+ (NSString*) CHANGE_EVENT_DATA{
	return change_event_data;
}

+ (NSString*) MOUSEDOWN_EVENT{
	return mousedown_event;
}
+ (NSString*) MOUSEDOWN_EVENT_DATA{
	return mousedown_event_data;
}

+ (NSString*) MOUSEUP_EVENT{
	return mouseup_event;
}
+ (NSString*) MOUSEUP_EVENT_DATA{
	return mouseup_event_data;
}

@end
