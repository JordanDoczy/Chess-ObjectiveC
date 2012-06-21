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

- (NSMutableArray*) getPossibleMoves:(Board *)board :(ColumnEnum)column :(RowEnum)row{
	
	NSMutableArray *squares = [[NSMutableArray alloc] init];

	
	if (row > One){
		[squares addObject:[[Move alloc] init :column :row :column :row-1]];
	}
	if (row < Eight){
		[squares addObject:[[Move alloc] init :column :row :column :row+1]];
	}
	
	if((int)(column + 1) <= H){
		[squares addObject:[[Move alloc] init :column :row :column+1 :row]];
		if(row > One) [squares addObject:[[Move alloc] init :column :row :column+1 :row-1]];
		if(row < Eight) [squares addObject:[[Move alloc] init :column :row :column+1 :row+1]];
	}
	
	if((int)(column - 1) >= A){
		[squares addObject:[[Move alloc] init :column :row :column-1 :row]];
		if(row > One) [squares addObject:[[Move alloc] init :column :row :column-1 :row-1]];
		if(row < Eight) [squares addObject:[[Move alloc] init :column :row :column-1 :row+1]];
	}

	return squares;
}


@end
