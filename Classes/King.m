//
//  King.m
//  app3
//
//  Created by Jordan Doczy on 3/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "King.h"
#import "Move.h"
#import "Board.h"

@implementation King


- (id) init:(ColorEnum)_color{
	
	super.name = @"King";
	[super init: _color];
	return self;
}

- (BOOL) isValidMove:(Move *)move :(Board *)board :(BOOL)isCapture{
	return abs(move.fromSquare.column - move.toSquare.column) <= 1 && abs(move.fromSquare.row - move.toSquare.row) <= 1;
}

- (NSMutableArray*) getPossibleMoves:(Board *)board{
	
	NSMutableArray *squares = [[NSMutableArray alloc] init];
	Square *square = [board getSquare:self];

	
	if (square.row > One){
		[squares addObject:[[Move alloc] init :square.column :square.row :square.column :square.row-1]];
	}
	if (square.row < Eight){
		[squares addObject:[[Move alloc] init :square.column :square.row :square.column :square.row+1]];
	}
	
	if((int)(square.column + 1) <= H){
		[squares addObject:[[Move alloc] init :square.column :square.row :square.column+1 :square.row]];
		if(square.row > One) [squares addObject:[[Move alloc] init :square.column :square.row :square.column+1 :square.row-1]];
		if(square.row < Eight) [squares addObject:[[Move alloc] init :square.column :square.row :square.column+1 :square.row+1]];
	}
	
	if((int)(square.column - 1) >= A){
		[squares addObject:[[Move alloc] init :square.column :square.row :square.column-1 :square.row]];
		if(square.row > One) [squares addObject:[[Move alloc] init :square.column :square.row :square.column-1 :square.row-1]];
		if(square.row < Eight) [squares addObject:[[Move alloc] init :square.column :square.row :square.column-1 :square.row+1]];
	}

	return squares;
}


@end
