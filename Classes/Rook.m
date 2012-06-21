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
	if(move.fromColumn == move.toColumn)
		return [board isRowRangeEmpty:move :false :false];
	
	if(move.fromRow == move.toRow)
		return [board isColumnRangeEmpty:move :false :false];

	return false;
}

- (NSMutableArray*) getPossibleMoves:(Board *)board :(ColumnEnum)column :(RowEnum)row{
	
	return [Rook getPossibleMoves:board :column :row];
}

+ (NSMutableArray*) getPossibleMoves:(Board *)board :(ColumnEnum)column :(RowEnum)row{
	
	NSMutableArray *squares = [[NSMutableArray alloc] init];
	
	int r = row;
	int c = column;
	
	if(row != One){
		for (r=row-1; r>=One; r--) {
			[squares addObject:[[Move alloc] init :column :row :column :r]]; 
		}
	}
	if(row != Eight){
		for (r=row+1; r<=Eight; r++) {
			[squares addObject:[[Move alloc] init :column :row :column :r]]; 
		}
	}
	if(column != A){
		for (c=column-1; c>=A; c--) {
			[squares addObject:[[Move alloc] init :column :row :c :row]]; 
		}
	}
	if(column != H){
		for (c=column+1; c<=H; c++) {
			[squares addObject:[[Move alloc] init :column :row :c :row]]; 
		}
	}
	
	return squares;
}


@end
