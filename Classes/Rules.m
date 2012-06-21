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
#import "Logger.h"

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

	Piece *from = [[model currentMove] getItemAtSquare:move.fromSquare.column :move.fromSquare.row];
	
	if(![self isCorrectColor :from.color]) return false;
	
	BOOL toSquareEmpty = [self isToEmpty:move];
	BOOL captureAttempt = [self isCaptureAttempt:move];
	
	if(!toSquareEmpty && !captureAttempt) return false;
	if(![from isValidMove:move :[model currentMove] :captureAttempt]) return false;
	if([self isKingInCheck:move]) return false;

	return true;
}

- (BOOL) isCorrectColor:(ColorEnum)color{
	return model.currentIndex%2 == color;
}

- (BOOL) isCaptureAttempt:(Move *)move{
	Piece *from = [[model currentMove] getItemAtSquare:move.fromSquare.column :move.fromSquare.row];
	Piece *to = [[model currentMove] getItemAtSquare:move.toSquare.column :move.toSquare.row];
	
	if([from isKindOfClass:[NullPiece class]]) return false;
	if([to isKindOfClass:[NullPiece class]]) return false;
	if(from.color == to.color) return false;

	return true;
}

- (BOOL) isToEmpty:(Move *)move{
	Piece *to = [[model currentMove] getItemAtSquare:move.toSquare.column :move.toSquare.row];
	return [to isKindOfClass:[NullPiece class]];
}

- (BOOL) isKingInCheck:(Move *)move{
	
	
	Board *board = [model.currentMove copy];
	Piece *from = [board getItemAtSquare:move.fromSquare.column :move.fromSquare.row];
	[board clearSquare:move.fromSquare.column :move.fromSquare.row];
	[board setSquare:move.toSquare.column :move.toSquare.row :from];

	Square *kingPosition = [board getPositionOfKing:from.color];
	
	ColorEnum color;
	if(from.color == White) color = Black;
	else color = White;
	
	NSArray *opposingMoves = [board getPossibleMoves:color];
		
	Piece *piece;
	for (Move *move in opposingMoves){
		if(move.toSquare.row == kingPosition.row && move.toSquare.column == kingPosition.column){
			piece = [board getItemAtSquare:move.fromSquare.column :move.fromSquare.row];
			if([piece isValidMove:move :board :true]) return true;
		}
		
	}
	
	[board release];
	[from release];
	[kingPosition release];
	[opposingMoves release];
	
	return false;
}


// enPassant
// promotePawn
// castle



@end
