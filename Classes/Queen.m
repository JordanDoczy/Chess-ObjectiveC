//
//  Queen.m
//  app3
//
//  Created by Jordan Doczy on 3/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Board.h"
#import "Move.h"
#import "Queen.h"

@implementation Queen


- (id) init:(ColorEnum)_color{
	
	super.name = @"Queen";
	[super init: _color];
	return self;
}

- (BOOL) isValidMove:(Move *)move :(Board *)board :(BOOL)isCapture{
	if(move.fromColumn == move.toColumn)
		return [board isRowRangeEmpty:move :false :false];
	
	if(move.fromRow == move.toRow)
		return [board isColumnRangeEmpty:move :false :false];
	
	if([board isDiagonal:move])
		return [board isDiagonalRangeEmpty:move :false :false];

	
	return false;
}

@end
