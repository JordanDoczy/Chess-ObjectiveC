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
	Piece *from = [[model currentMove] getSquare:move.fromSquare.column :move.fromSquare.row];
	
	if(![self isCorrectColor :from.color]) return false;
	
	BOOL toSquareEmpty = [self isToEmpty:move];
	BOOL captureAttempt = [self isCaptureAttempt:move];
	
	if(!toSquareEmpty && !captureAttempt) return false;
	if(![from isValidMove:move :[model currentMove] :captureAttempt]) return false;

	return true;
}

- (BOOL) isCorrectColor:(ColorEnum)color{
	return model.currentIndex%2 == color;
}

- (BOOL) isCaptureAttempt:(Move *)move{
	Piece *from = [[model currentMove] getSquare:move.fromSquare.column :move.fromSquare.row];
	Piece *to = [[model currentMove] getSquare:move.toSquare.column :move.toSquare.row];
	
	if([from isKindOfClass:[NullPiece class]]) return false;
	if([to isKindOfClass:[NullPiece class]]) return false;
	if(from.color == to.color) return false;

	return true;
}

- (BOOL) isToEmpty:(Move *)move{
	Piece *to = [[model currentMove] getSquare:move.toSquare.column :move.toSquare.row];
	return [to isKindOfClass:[NullPiece class]];
}

// isKingInCheck
// enPassant
// promotePawn
// castle



@end
