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
	
	[super init :_color];
	super.name = @"Pawn";
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

		if(move.fromSquare.column != move.toSquare.column) return false;
		if(![board isRowRangeEmpty:move :false :false]) return false;
		if(rowDistance > maxspaces || rowDistance < 1) return false;
	}
	
	return true;
}


- (int) getRowDistance:(Move *)move{
	if(color == White) return move.toSquare.row - move.fromSquare.row;
	else return move.fromSquare.row - move.toSquare.row;
	return 0;
}


- (NSMutableArray*) getPossibleMoves:(Board *)board{
	
	NSMutableArray *squares = [[NSMutableArray alloc] init];
	Square *square = [board getSquare:self];

	int direction = color==White ? 1 : -1;
	
	if(square.row+direction >= One && square.row+direction<=Eight) [squares addObject:[[Move alloc] init :square.column :square.row :square.column :square.row+direction]]; 
	if(!moved) [squares addObject:[[Move alloc] init :square.column :square.row :square.column :square.row+(2*direction)]]; 
	if((int)(square.column+1) <= H) [squares addObject:[[Move alloc] init :square.column :square.row :square.column+1 :square.row+direction]]; 
	if((int)(square.column-1) >= A) [squares addObject:[[Move alloc] init :square.column :square.row :square.column-1 :square.row+direction]]; 
	
	return squares;
}


@end
