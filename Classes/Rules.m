//
//  Rules.m
//  Chess
//
//  Created by Jordan Doczy on 4/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//
#import "Board.h"
#import "History.h"
#import "King.h"
#import "Move.h"
#import "NullPiece.h"
#import "Piece.h"
#import "Rook.h"
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

- (BOOL) isCorrectColor:(ColorEnum)color{
	return model.currentIndex%2 == color;
}

- (BOOL) isValidMove:(Move *)move{

	Piece *from = [[model currentMove] getItemAtSquare:move.fromSquare.column :move.fromSquare.row];
	
	BOOL toSquareEmpty = [self isToEmpty:move];
	BOOL captureAttempt = [self isCaptureAttempt:move];
	
	if(!toSquareEmpty && !captureAttempt) return false;
	if(![from isValidMove:move :[model currentMove] :captureAttempt]) return false;
	if([self isKingInCheck:move]) return false;
	
	return true;
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

- (BOOL) isValidCastle:(Move *)move{
	
	
	Piece *king = [model.currentMove getItemAtSquare:move.fromSquare.column :move.fromSquare.row];
	Rook *rook;
	Move *rookMove = [[Move alloc] init];
	ColumnEnum column;

	if(king.moved) return false;
	
	if(move.toSquare.column == G){
		if(king.color == White) rookMove.fromSquare = [[Square alloc] init :H :One];
		else rookMove.fromSquare = [[Square alloc] init :H :Eight];
	}
	else if(move.toSquare.column == C){
		if(king.color == White) rookMove.fromSquare = [[Square alloc] init :A :One];
		else rookMove.fromSquare = [[Square alloc] init :A :Eight];
	}
	else return false;
	
	rook = [model.currentMove getItemAtSquare:rookMove.fromSquare.column :rookMove.fromSquare.row];
	if(rook.moved) return false;
	
	column = move.toSquare.column == G ? F : D;
	rookMove.toSquare = [[Square alloc] init :column :move.toSquare.row];
	
	if([rook isValidMove:rookMove :model.currentMove :false]){
		[[model currentMove] clearSquare:rookMove.fromSquare.column :rookMove.fromSquare.row];
		[[model currentMove] setSquare:rookMove.toSquare.column :rookMove.toSquare.row :rook];
		rook.moved = true;
		return true;
	}
	
	
	return false;
	
}


// enPassant
// promotePawn
// castle



@end
