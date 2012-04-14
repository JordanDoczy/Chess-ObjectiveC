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
#import "Rules.h"

@implementation Pawn


- (id) init:(ColorEnum)_color{
	
	super.name = @"Pawn";
	[super init: _color];
	return self;
}

/*
 Rules

 - if has not moved can move 1 or 2 spaces
	- both spaces must be clear

 - if has moved can only move 1 space
	- space must be clear
 
 - if capture attempt
	- space must be 1 space away
	- must be an adjacent column
 
 - 
 
 
*/

- (BOOL) isValidMove:(Move *)move :(Board *)board{
	Piece *to = [board getSquare: move.toColumn :move.toRow];

	int maxspaces = 2;
	if(moved) maxspaces = 1;
	
	if(move.fromColumn == move.toColumn){
		if(color == White){
			if((move.toRow - move.fromRow) > maxspaces) return false;
		}
		else{
			if((move.fromRow - move.toRow) > maxspaces) return false;
		}
	}
	if(abs(move.fromColumn - move.toColumn) == 1){
		if([to isKindOfClass:[Piece class]] && self.color != to.color){
			if(color == White){
				if((move.toRow - move.fromRow) > 1) return false;
			}
			else{
				if((move.fromRow - move.toRow) > 1) return false;
			}
		}
		else return false;
	}	
	
	return true;
}


@end
