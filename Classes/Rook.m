//
//  Rook.m
//  app3
//
//  Created by Jordan Doczy on 3/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Board.h"
#import "Rook.h"
#import "Move.h"


@implementation Rook

- (id) init:(ColorEnum)_color{
	
	super.name = @"Rook";
	[super init: _color];
	return self;
	
}

// TODO
// - fix isRangeEmpty Methods
// - issue: dont include start square
// - issue: end square can be non-empty (enemy piece)


- (BOOL) isValidMove:(Move *)move :(Board *)board :(BOOL)isCapture{
	if(move.fromColumn == move.toColumn)
		return [board isRowRangeEmpty:move :false :false];
	
	if(move.fromRow == move.toRow)
		return [board isColumnRangeEmpty:move :false :false];

	return false;
}


@end
