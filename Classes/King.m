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
#import "Rook.h"


@implementation King


- (id) init:(ColorEnum)_color{
	
	[super init :_color];
	super.name = @"King";
	return self;
}

- (BOOL) isValidMove:(Move *)move :(Board *)board :(BOOL)isCapture{
	
	if(abs(move.fromSquare.column - move.toSquare.column) == 2){
		Rook *rook;
		
		if(moved) return false;
		if(move.toSquare.column == G){
			if(color == White){
				rook = [board getItemAtSquare :H :One];
				return [rook isValidMove:[[Move alloc] init :H :One :F :One] :board :false];
			}
			else{
				rook = [board getItemAtSquare :H :Eight];
				return [rook isValidMove:[[Move alloc] init :H :Eight :F :Eight] :board :false];
			}
		}
		else if(move.toSquare.column == C) {
			if(color == White){
				rook = [board getItemAtSquare :A :One];
				return [rook isValidMove:[[Move alloc] init :A :One :D :One] :board :false];
			}
			else{
				rook = [board getItemAtSquare :A :Eight];
				return [rook isValidMove:[[Move alloc] init :A :Eight :D :Eight] :board :false];
			}
		}
	}
	
	
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
	
	if(!moved){
		[squares addObject:[[Move alloc] init :square.column :square.row :square.column-2 :square.row]];
		[squares addObject:[[Move alloc] init :square.column :square.row :square.column+2 :square.row]];
	}

	return squares;
}


@end
