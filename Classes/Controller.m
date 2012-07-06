//
//  Controller.m
//  Chess
//
//  Created by Jordan Doczy on 3/27/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Board.h"
#import "BoardView.h"
#import "Controller.h"
#import "ColorEnum.h"
#import "ColumnEnum.h"
#import "Constants.h"
#import "GlobalEvents.h"
#import "GlobalFunctions.h"
#import "History.h"
#import "King.h"
#import "Move.h"
#import "Piece.h"
#import "PieceFactory.h"
#import "PieceView.h"
#import "RowEnum.h"
#import "Rules.h"
#import "Square.h"


@implementation Controller

History *model;
Rules *rules;
Move *move;


- (id) init{
	move = [[Move alloc] init];
	return self;
}
- (id) initWithModel:(History*)history{
	model = history;
	rules = [[Rules alloc] initWithModel:history];
	return [self init];
}
- (void) movePiece:(Move *)move{
	Board *board = [model.currentMove copy];
	Piece *currentPiece = [[board getItemAtSquare:move.fromSquare.column :move.fromSquare.row] retain];

	if([rules isCorrectColor:currentPiece.color]){
		if ([rules isCastleAttempt: move :board :currentPiece]){
			Piece *rook = [[board getRookFromCastleAttempt:move :currentPiece] retain];
			
			if([rules isValidCastle:move :board :currentPiece :rook]){
				
				[board clearSquare:move.fromSquare.column :move.fromSquare.row];
				[board setSquare:move.toSquare.column :move.toSquare.row :currentPiece];
				currentPiece.moved = true;
			
				Move *rookMove = [board getRookMoveFromCastleAttempt:move :currentPiece];
				[board clearSquare:rookMove.fromSquare.column :rookMove.fromSquare.row];
				[board setSquare:rookMove.toSquare.column :rookMove.toSquare.row :rook];
				rook.moved = true;
				[rook release];
			
				[model addMove:board];
			}
		}
		else if ([rules isValidMove:move :board :currentPiece]){
			[board clearSquare:move.fromSquare.column :move.fromSquare.row];
			[board setSquare:move.toSquare.column :move.toSquare.row :currentPiece];
			currentPiece.moved = true;
			[model addMove:board];
		}
	}
	
	[model refresh];
	[board release];
	[currentPiece release];
	
}

- (void) setUpBoard{
	
	Board *board = [[Board alloc] init];
	
	// white pieces
	[board setSquare:A :One :[PieceFactory createPiece:RookPiece   :White]];
	[board setSquare:B :One :[PieceFactory createPiece:KnightPiece :White]];
	[board setSquare:C :One :[PieceFactory createPiece:BishopPiece :White]];
	[board setSquare:D :One :[PieceFactory createPiece:QueenPiece  :White]];
	[board setSquare:E :One :[PieceFactory createPiece:KingPiece   :White]];
	[board setSquare:F :One :[PieceFactory createPiece:BishopPiece :White]];
	[board setSquare:G :One :[PieceFactory createPiece:KnightPiece :White]];
	[board setSquare:H :One :[PieceFactory createPiece:RookPiece   :White]];
	[board setSquare:A :Two :[PieceFactory createPiece:PawnPiece   :White]];
	[board setSquare:B :Two :[PieceFactory createPiece:PawnPiece   :White]];
	[board setSquare:C :Two :[PieceFactory createPiece:PawnPiece   :White]];
	[board setSquare:D :Two :[PieceFactory createPiece:PawnPiece   :White]];
	[board setSquare:E :Two :[PieceFactory createPiece:PawnPiece   :White]];
	[board setSquare:F :Two :[PieceFactory createPiece:PawnPiece   :White]];
	[board setSquare:G :Two :[PieceFactory createPiece:PawnPiece   :White]];
	[board setSquare:H :Two :[PieceFactory createPiece:PawnPiece   :White]];

	// black pieces
	[board setSquare:A :Eight :[PieceFactory createPiece:RookPiece   :Black]];
	[board setSquare:B :Eight :[PieceFactory createPiece:KnightPiece :Black]];
	[board setSquare:C :Eight :[PieceFactory createPiece:BishopPiece :Black]];
	[board setSquare:D :Eight :[PieceFactory createPiece:QueenPiece  :Black]];
	[board setSquare:E :Eight :[PieceFactory createPiece:KingPiece   :Black]];
	[board setSquare:F :Eight :[PieceFactory createPiece:BishopPiece :Black]];
	[board setSquare:G :Eight :[PieceFactory createPiece:KnightPiece :Black]];
	[board setSquare:H :Eight :[PieceFactory createPiece:RookPiece   :Black]];
	[board setSquare:A :Seven :[PieceFactory createPiece:PawnPiece   :Black]];
	[board setSquare:B :Seven :[PieceFactory createPiece:PawnPiece   :Black]];
	[board setSquare:C :Seven :[PieceFactory createPiece:PawnPiece   :Black]];
	[board setSquare:D :Seven :[PieceFactory createPiece:PawnPiece   :Black]];
	[board setSquare:E :Seven :[PieceFactory createPiece:PawnPiece   :Black]];
	[board setSquare:F :Seven :[PieceFactory createPiece:PawnPiece   :Black]];
	[board setSquare:G :Seven :[PieceFactory createPiece:PawnPiece   :Black]];
	[board setSquare:H :Seven :[PieceFactory createPiece:PawnPiece   :Black]];
	
	[model addMove:board];
	
}

- (void)reset:(UIButton*)button{
	[self reset];
}
- (void)reset{
	[model reset];
	[move reset];
	[self setUpBoard];
}
- (void)redo:(UIButton*)button{
	[self redo];
}
- (void) redo{ 
	model.currentIndex++;
}
- (void)undo:(UIButton*)button{
	[self undo];
}
- (void) undo{ 
	model.currentIndex--;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"currentMove"]) {
		
		[self movePiece:[change objectForKey:NSKeyValueChangeNewKey]];
	}		
}

@end
