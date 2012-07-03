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
- (BOOL) isCaptureAttempt:(Move *)move{
	Piece *from = [[model currentMove] getItemAtSquare:move.fromSquare.column :move.fromSquare.row];
	return [self isCaptureAttempt :move :model.currentMove :from];
}
- (BOOL) isCaptureAttempt:(Move *)move :(Board *)board :(Piece *)from{
	Piece *to = [board getItemAtSquare:move.toSquare.column :move.toSquare.row];
	
	if([from isKindOfClass:[NullPiece class]]) return false;
	if([to isKindOfClass:[NullPiece class]]) return false;
	if(from.color == to.color) return false;

	return true;
}
- (BOOL) isToEmpty:(Move *)move{
	Piece *to = [model.currentMove getItemAtSquare:move.toSquare.column :move.toSquare.row];
	return [to isKindOfClass:[NullPiece class]];
}
- (BOOL) isKingInCheck:(Move *)move{
	Piece *from = [[model currentMove] getItemAtSquare:move.fromSquare.column :move.fromSquare.row];
	return [self isKingInCheck:move :model.currentMove :from];
}
- (BOOL) isKingInCheck:(Move *)move :(Board*)board :(Piece*)piece{
	
	[board clearSquare:move.fromSquare.column :move.fromSquare.row];
	[board setSquare:move.toSquare.column :move.toSquare.row :piece];

	Square *kingPosition = [board getPositionOfKing:piece.color];
	
	ColorEnum color;
	if(piece.color == White) color = Black;
	else color = White;
	
	NSArray *opposingMoves = [board getPossibleMoves:color];
		
	Piece *p;
	for (Move *move in opposingMoves){
		if(move.toSquare.row == kingPosition.row && move.toSquare.column == kingPosition.column){
			p = [board getItemAtSquare:move.fromSquare.column :move.fromSquare.row];
			if([p isValidMove:move :board :true]) return true;
		}
		
	}
	
	[kingPosition release];
	[opposingMoves release];
	
	return false;
}
- (BOOL) isValidCastle:(Move *)move{
	Piece *king = [model.currentMove getItemAtSquare:move.fromSquare.column :move.fromSquare.row];
	return [self isValidCastle :move :model.currentMove :king];
}
- (BOOL) isValidCastle:(Move *)move :(Board*)board :(Piece*)king :(Piece*)rook{
	if(king.moved) return false;
	if(move.toSquare.column != G && move.toSquare.column != C) return false;
	
	Move *rookMove = [board getRookMoveFromCastleAttempt:move :king];
	
	return [rook isValidMove:rookMove :board :false];
}
- (BOOL) isValidCastle:(Move *)move :(Board*)board :(Piece*)king{
	Rook *rook;
	Move *rookMove = [[Move alloc] init];
	
	if(king.moved) return false;
	if(move.toSquare.column != G && move.toSquare.column != C) return false;
	
	
	
	//rookMove.fromSquare = [[Square alloc] init :move.toSquare.column == G ? H : C :king.color == White ? One: Eight];
	
	//rook = [board getItemAtSquare:rookMove.fromSquare.column :rookMove.fromSquare.row];
	//if(rook.moved) return false;
	
	//rookMove.toSquare = [[Square alloc] init :move.toSquare.column == G ? F : D :move.toSquare.row];
	
	
	
	if([rook isValidMove:rookMove :board :false]){  // TODO move to controller
		[board clearSquare:rookMove.fromSquare.column :rookMove.fromSquare.row];
		[board setSquare:rookMove.toSquare.column :rookMove.toSquare.row :rook];
		rook.moved = true;
		return true;
	}
	
	
	return false;
	
}
- (BOOL) isValidMove:(Move *)move{
	Piece *from = [[model currentMove] getItemAtSquare:move.fromSquare.column :move.fromSquare.row];
	return [self isValidMove:move :model.currentMove :from];
}
- (BOOL) isValidMove:(Move *)move :(Board *)board :(Piece *)from{
	
	BOOL toSquareEmpty = [self isToEmpty:move];
	BOOL captureAttempt = [self isCaptureAttempt:move :board :from];
	
	if(!toSquareEmpty && !captureAttempt) return false;
	if(![from isValidMove:move :board :captureAttempt]) return false;
	if([self isKingInCheck:move :board :from]) return false;
	
	return true;
}


// enPassant
// promotePawn
// castle



@end
