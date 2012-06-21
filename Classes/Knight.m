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

- (BOOL) isValidMove:(Move *)move :(Board *)board :(BOOL)isCapture{
	
	int rowDistance = abs(move.fromSquare.row - move.toSquare.row);
	int columnDistance = abs(move.fromSquare.column - move.toSquare.column);
	
	if(rowDistance < 1 || rowDistance > 2) return false;
	if(columnDistance < 1 || columnDistance > 2) return false;
	if(rowDistance + columnDistance == 3) return true;
	return false;
}

- (NSMutableArray*) getPossibleMoves:(Board *)board :(ColumnEnum)column :(RowEnum)row{
	
	NSMutableArray *squares = [[NSMutableArray alloc] init];
	
	if((int)(column-1) >= A){
		if((int)(row-2) >= One) [squares addObject:[[Move alloc] init :column :row :column-1 :row-2]];
		if((int)(row+2) <= Eight) [squares addObject:[[Move alloc] init :column :row :column-1 :row+2]];
	}
	
	if((int)(column-2) >= A){
		if((int)(row-1) >= One) [squares addObject:[[Move alloc] init :column :row :column-2 :row-1]];
		if((int)(row+1) <= Eight) [squares addObject:[[Move alloc] init :column :row :column-2 :row+1]];
	}
	
	if((int)(column+1) <= H){
		if((int)(row-2) >= One) [squares addObject:[[Move alloc] init :column :row :column+1 :row-2]];
		if((int)(row+2) <= Eight) [squares addObject:[[Move alloc] init :column :row :column+1 :row+2]];
	}
	
	if((int)(column+2) <= H){
		if((int)(row-1) >= One) [squares addObject:[[Move alloc] init :column :row :column+2 :row-1]];
		if((int)(row+1) <= Eight) [squares addObject:[[Move alloc] init :column :row :column+2 :row+1]];
	}
	
	return squares;
}

@end
