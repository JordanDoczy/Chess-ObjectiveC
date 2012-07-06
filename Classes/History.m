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
	return [moves objectAtIndex:currentIndex];
}

- (int) currentIndex{
	return currentIndex;
}
- (id) init{
	[self reset];
	return self;
}


- (void) setCurrentIndex:(int)currentIndexValue{
	if(currentIndexValue < 0) return;
	if (currentIndexValue >= [moves count]) return;
	currentIndex = currentIndexValue;
}
- (void) refresh{
	self.currentIndex = self.currentIndex;
}
- (void) reset{
	moves = [[NSMutableArray alloc] init];
}

@end
