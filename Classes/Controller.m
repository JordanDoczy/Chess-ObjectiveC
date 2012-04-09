//
//  Controller.m
//  Chess
//
//  Created by Jordan Doczy on 3/27/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Board.h"
#import "Controller.h"
#import "ChessSquare.h"
#import "ColorEnum.h"
#import "ColumnEnum.h"
#import "GlobalEvents.h"
#import "History.h"
#import "PieceFactory.h"
#import "PieceView.h"
#import "RowEnum.h"


@implementation Controller

History *model;

ChessSquare *startSquare;
ChessSquare *endSquare;

- (id) init{
	return self;
}
- (id) initWithModel:(History*)history{
	
	model = history;
	return [self init];
}
- (void) movePiece:(ChessSquare*)fromSquare :(ChessSquare*)toSquare{
	
	Board *board = model.currentMove;
	Piece *currentPiece = [board getSquare:fromSquare.column :fromSquare.row];
	[board clearSquare:fromSquare.column :fromSquare.row];
	[board setSquare:toSquare.column :toSquare.row :currentPiece];
	[model addMove:board];
}
- (void)reset{
	[self setUpBoard];
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
- (void) undo{ 
	model.currentIndex--;
}
- (void) mouseDownEventHandler:(NSNotification *)notification{
	
	NSDictionary *dict = [notification userInfo];
	UITouch *touch = [dict objectForKey:[GlobalEvents MOUSEDOWN_EVENT_DATA]];
	CGPoint pos = [touch locationInView: [UIApplication sharedApplication].keyWindow];
	startSquare = [[ChessSquare alloc] init:floor((pos.x-10)/37) :floor((pos.y-30)/37)];
}
- (void) mouseUpEventHandler:(NSNotification *)notification{

	NSDictionary *dict = [notification userInfo];
	UITouch *touch = [dict objectForKey:[GlobalEvents MOUSEUP_EVENT_DATA]];
	CGPoint pos = [touch locationInView: [UIApplication sharedApplication].keyWindow];
	endSquare = [[ChessSquare alloc] init:floor((pos.x-10)/37) :floor((pos.y-30)/37)];
	[self movePiece:startSquare :endSquare];
}

@end
