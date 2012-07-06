//
//  BoardView.m
//  app3
//
//  Created by Jordan Doczy on 3/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Board.h"
#import "BoardView.h"
#import "Constants.h"
#import "GlobalEvents.h"
#import "GlobalFunctions.h"
#import "History.h"
#import "Move.h"
#import "NullPiece.h"
#import "Piece.h"
#import "PieceView.h"

@implementation BoardView


History *model;
NSMutableArray *imageViews;

Move *_currentMove;

- (void) addPiece:(Piece*)piece :(int)column :(int)row{
	
	UIImage *image = [UIImage imageNamed:[[piece display] stringByAppendingString:@".png"]];
	
	PieceView *pieceView = [[PieceView alloc] initWithImage:image];
	pieceView.userInteractionEnabled = YES;
	pieceView.opaque = YES;
	pieceView.frame = CGRectMake([Constants X_OFFSET] + (column*[Constants SQUARE_SIZE])+1.7,  // 1.7 is needed to center piece (horizontally)
								 [Constants Y_OFFSET] + (([Constants ROWS]-1-row)*[Constants SQUARE_SIZE])+.7,	  // .7 is needed to center piece (vertically)
								 [Constants SQUARE_SIZE]*.9, 
								 [Constants SQUARE_SIZE]*.9); 
	
	
	pieceView.column = column;
	pieceView.row = row;
	
	[self addSubview:pieceView];
	[imageViews addObject:pieceView];
	[pieceView release];
}
- (void) changeEventHandler: (NSNotification *) notification{
	Piece *piece;
	int column;
	int row;
	
	[self removeAllImages];
	
	for (column = 0; column < [Constants COLUMNS]; column++) {
		for (row=0; row<[Constants ROWS]; row++) {
			piece = [model.currentMove getItemAtSquare:column :row];
			if(![piece isKindOfClass:[NullPiece class]]){
				[self addPiece:piece :column :row];
			}
		}
	}
}
- (void) dealloc {
	[super dealloc];
}
- (void) drawBoard{
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	int row;
	int column;
	
	for(row=0; row<[Constants ROWS]; row++){
		for (column=0; column<[Constants COLUMNS]; column++) {
			if(row % 2 == 0 && column % 2 == 0) CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
			else if(row % 2 != 0 && column % 2 != 0) CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
			else CGContextSetFillColorWithColor(context, [UIColor grayColor].CGColor);
			CGContextAddRect(context, CGRectMake([Constants X_OFFSET]+([Constants SQUARE_SIZE]*column),
												 [Constants Y_OFFSET]+([Constants SQUARE_SIZE]*row),
												 [Constants SQUARE_SIZE],
												 [Constants SQUARE_SIZE]));	
			CGContextFillPath(context);
		}
	}
}
- (void) drawRect:(CGRect)rect {
	[self drawBoard];
}
- (id) init{
	[self initWithFrame:CGRectMake(0, 
								   0,
								   ([Constants SQUARE_SIZE]*[Constants COLUMNS])+([Constants X_OFFSET]*2), 
								   ([Constants SQUARE_SIZE]*[Constants ROWS])+([Constants Y_OFFSET]*2))];
	imageViews = [[NSMutableArray alloc] init];
	_currentMove = [[Move alloc] init];
	return self;
}
- (id) initWithModel:(History*)history{
	
	model = history;
	[history addObserver:self forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:nil];
	return [self init];
}
- (void) removeAllImages{
	for (int i=0; i<[imageViews count]; i++){
		[[imageViews objectAtIndex:i] removeFromSuperview];
	}
	[imageViews removeAllObjects];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch *touch = [touches anyObject];
	_currentMove.fromSquare = [[Square alloc] init :[GlobalFunctions getColumnFromTouch: touch] :[GlobalFunctions getRowFromTouch: touch]];
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch *touch = [touches anyObject];
	_currentMove.toSquare = [[Square alloc] init :[GlobalFunctions getColumnFromTouch: touch] :[GlobalFunctions getRowFromTouch: touch]];
	self.currentMove = _currentMove;
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == model && [keyPath isEqualToString:@"currentIndex"] && model.currentIndex >= 0) {
		Piece *piece;
		int column;
		int row;
		
		[self removeAllImages];
		
		for (column = 0; column < [Constants COLUMNS]; column++) {
			for (row=0; row<[Constants ROWS]; row++) {
				piece = [model.currentMove getItemAtSquare:column :row];
				if(![piece isKindOfClass:[NullPiece class]]){
					[self addPiece:piece :column :row];
				}
			}
		}
	}		
}

- (Move*) currentMove{
	return currentMove;
}
- (void) setCurrentMove:(Move*)currentMoveValue{
	if(currentMoveValue.toSquare == nil || currentMoveValue.fromSquare == nil) return;
	currentMove = currentMoveValue;
}



@end
