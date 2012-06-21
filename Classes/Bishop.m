//
//  Bishop.m
//  app3
//
//  Created by Jordan Doczy on 3/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Bishop.h"
#import "Board.h"
#import "Move.h"

@implementation Bishop


- (id) init:(ColorEnum)_color{
	
	super.name = @"Bishop";
	[super init: _color];
	return self;
}

- (BOOL) isValidMove:(Move *)move :(Board *)board :(BOOL)isCapture{
	
	if(![board isDiagonal:move]) return false;
		return [board isDiagonalRangeEmpty:move :false :false];
	
	return false;
}

- (NSMutableArray*) getPossibleMoves:(Board *)board{
	return [Bishop getPossibleMoves :board :self];
}

+ (NSMutableArray*) getPossibleMoves:(Board *)board :(Piece *)piece{

	NSMutableArray *squares = [[NSMutableArray alloc] init];
	Square *square = [board getSquare:piece];

	int r = square.row;
	int c = square.column;
	
	while(r < Eight && c < H){
		r++;
		c++;
		[squares addObject:[[Move alloc] init :square.column :square.row :c :r]]; 
	}
	
	r = square.row;
	c = square.column;
	
	while(r < Eight && c > A){
		r++;
		c--;
		[squares addObject:[[Move alloc] init :square.column :square.row :c :r]]; 
	}
	
	r = square.row;
	c = square.column;
	
	while(r > One && c > A){
		r--;
		c--;
		[squares addObject:[[Move alloc] init :square.column :square.row :c :r]]; 
	}
	
	r = square.row;
	c = square.column;
	
	while(r > One && c < H){
		r--;
		c++;
		[squares addObject:[[Move alloc] init :square.column :square.row :c :r]]; 
	}
	
	return squares;
}

@end
