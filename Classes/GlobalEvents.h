//
//  GlobalEvents.h
//  Chess
//
//  Created by Jordan Doczy on 3/28/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GlobalEvents : NSObject {

}


+ (NSString*) CHANGE_EVENT;
+ (NSString*) CHANGE_EVENT_DATA;
+ (NSString*) MOUSEDOWN_EVENT;
+ (NSString*) MOUSEDOWN_EVENT_DATA;
+ (NSString*) MOUSEUP_EVENT;
+ (NSString*) MOUSEUP_EVENT_DATA;


@end
