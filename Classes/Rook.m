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

- (BOOL) isValidMove:(Move *)move :(Board *)board :(BOOL)isCapture{
	if(move.fromSquare.column == move.toSquare.column)
		return [board isRowRangeEmpty:move :false :false];
	
	if(move.fromSquare.row == move.toSquare.row)
		return [board isColumnRangeEmpty:move :false :false];
	return false;
}

- (NSMutableArray*) getPossibleMoves:(Board *)board{
	
	return [Rook getPossibleMoves:board];
}

+ (NSMutableArray*) getPossibleMoves:(Board *)board{
	
	NSMutableArray *squares = [[NSMutableArray alloc] init];
	Square *square = [board getSquare:self];

	int r = square.row;
	int c = square.column;
	
	if(square.row != One){
		for (r=square.row-1; r>=One; r--) {
			[squares addObject:[[Move alloc] init :square.column :square.row :square.column :r]]; 
		}
	}
	if(square.row != Eight){
		for (r=square.row+1; r<=Eight; r++) {
			[squares addObject:[[Move alloc] init :square.column :square.row :square.column :r]]; 
		}
	}
	if(square.column != A){
		for (c=square.column-1; c>=A; c--) {
			[squares addObject:[[Move alloc] init :square.column :square.row :c :square.row]]; 
		}
	}
	if(square.column != H){
		for (c=square.column+1; c<=H; c++) {
			[squares addObject:[[Move alloc] init :square.column :square.row :c :square.row]]; 
		}
	}
	
	return squares;
}


@end
