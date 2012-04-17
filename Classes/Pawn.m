//
//  Pawn.m
//  app3
//
//  Created by Jordan Doczy on 3/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Board.h"
#import "Move.h"
#import "Pawn.h"

@implementation Pawn


- (id) init:(ColorEnum)_color{
	
	super.name = @"Pawn";
	[super init: _color];
	return self;
}

- (BOOL) isValidMove:(Move *)move :(Board *)board :(BOOL)isCapture{
	if(isCapture){
		if(![board isAdjacentColumn:move]) return false;
		if([self getRowDistance:move] != 1) return false;
		
		return true;
	}
	else{
		int maxspaces = 2;
		if(moved) maxspaces = 1;
		int rowDistance = [self getRowDistance:move];

		if(move.fromColumn != move.toColumn) return false;
		if(![board isRowRangeEmpty:move :false :false]) return false;
		if(rowDistance > maxspaces || rowDistance < 1) return false;
	}
	
	return true;
}


- (int) getRowDistance:(Move *)move{
	if(color == White) return move.toRow - move.fromRow;
	else return move.fromRow - move.toRow;
}


@end
