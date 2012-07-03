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

	[super init :_color];
	super.name = @"Knight";
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

- (NSMutableArray*) getPossibleMoves:(Board *)board{
	
	NSMutableArray *squares = [[NSMutableArray alloc] init];
	Square *square = [board getSquare:self];

	if((int)(square.column-1) >= A){
		if((int)(square.row-2) >= One) [squares addObject:[[Move alloc] init :square.column :square.row :square.column-1 :square.row-2]];
		if((int)(square.row+2) <= Eight) [squares addObject:[[Move alloc] init :square.column :square.row :square.column-1 :square.row+2]];
	}
	
	if((int)(square.column-2) >= A){
		if((int)(square.row-1) >= One) [squares addObject:[[Move alloc] init :square.column :square.row :square.column-2 :square.row-1]];
		if((int)(square.row+1) <= Eight) [squares addObject:[[Move alloc] init :square.column :square.row :square.column-2 :square.row+1]];
	}
	
	if((int)(square.column+1) <= H){
		if((int)(square.row-2) >= One) [squares addObject:[[Move alloc] init :square.column :square.row :square.column+1 :square.row-2]];
		if((int)(square.row+2) <= Eight) [squares addObject:[[Move alloc] init :square.column :square.row :square.column+1 :square.row+2]];
	}
	
	if((int)(square.column+2) <= H){
		if((int)(square.row-1) >= One) [squares addObject:[[Move alloc] init :square.column :square.row :square.column+2 :square.row-1]];
		if((int)(square.row+1) <= Eight) [squares addObject:[[Move alloc] init :square.column :square.row :square.column+2 :square.row+1]];
	}
	
	return squares;
}

@end
