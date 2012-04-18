//
//  King.m
//  app3
//
//  Created by Jordan Doczy on 3/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "King.h"
#import "Move.h"

@implementation King


- (id) init:(ColorEnum)_color{
	
	super.name = @"King";
	[super init: _color];
	return self;
}

- (BOOL) isValidMove:(Move *)move :(Board *)board :(BOOL)isCapture{
	return abs(move.fromColumn - move.toColumn) <= 1 && abs(move.fromRow - move.toRow) <= 1;
}


@end
