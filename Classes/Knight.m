//
//  Knight.m
//  app3
//
//  Created by Jordan Doczy on 3/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Board.h"
#import "Knight.h"
#import "Move.h"

@implementation Knight


- (id) init:(ColorEnum)_color{
	
	super.name = @"Knight";
	[super init: _color];
	return self;
}

- (BOOL) isValidMove:(Move *)move :(Board *)board{
	Piece *to = [board getSquare: move.toColumn :move.toRow];
	
	int rowDistance = abs(move.fromRow - move.toRow);
	int columnDistance = abs(move.fromColumn - move.toColumn);
	
	if ([board isSquareEmpty:move.toColumn :move.toRow] || [self isCaptureAttempt:to]){
		if(rowDistance < 1 || rowDistance > 2) return false;
		if(columnDistance < 1 || columnDistance > 2) return false;
		if(rowDistance + columnDistance == 3) return true;
	}
		
	return false;
}

@end
