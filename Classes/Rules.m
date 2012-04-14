//
//  Rules.m
//  Chess
//
//  Created by Jordan Doczy on 4/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//
#import "Board.h"
#import "History.h"
#import "Move.h"
#import "NullPiece.h"
#import "Piece.h"
#import "Rules.h"

@implementation Rules

History *model;

- (id) init{
	return self;
}
- (id) initWithModel:(History*)history{
	
	model = history;
	return [self init];
}

- (BOOL) isValidMove:(Move *)move{
	Piece *from = [[model currentMove] getSquare:move.fromColumn :move.fromRow];
	
	if(![from isValidMove:move :[model currentMove]]) return false;
	
	return true;
}


// isKingInCheck
// enPassant
// promotePawn
// castle



@end
