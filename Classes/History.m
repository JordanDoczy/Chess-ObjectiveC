//
//  History.m
//  Chess
//
//  Created by Jordan Doczy on 4/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Board.h"
#import "GlobalEvents.h"
#import "History.h"


@implementation History

NSMutableArray *moves;
int _currentIndex=0;

- (void) addMove:(Board*)board{
	if(self.currentIndex < [moves count] && [moves count] > 0){
		int loc = self.currentIndex+1;
		int len = [moves count]-self.currentIndex-1;
		[moves removeObjectsInRange:NSMakeRange(loc,len)];
	}
	
	[moves addObject:board];
	self.currentIndex = [moves count]-1;
}
- (Board*) currentMove{
	return [[moves objectAtIndex:_currentIndex] copy];
}

- (int) currentIndex{
	return _currentIndex;
}
- (id) init{
	moves = [[NSMutableArray alloc] init];
	return self;
}
- (void) setCurrentIndex:(int)value{
	if(value < 0) return;
	if (value >= [moves count]) return;
	
	_currentIndex = value;
	[[NSNotificationCenter defaultCenter] postNotificationName:[GlobalEvents CHANGE_EVENT] object:self];	

}


@end
