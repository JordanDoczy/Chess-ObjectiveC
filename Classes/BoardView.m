//
//  BoardView.m
//  app3
//
//  Created by Jordan Doczy on 3/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BoardView.h"
#import "ColumnEnum.h"
#import "GlobalEvents.h"
#import "History.h"
#import "NullPiece.h"
#import "RowEnum.h"
#import "Piece.h"
#import "PieceView.h"

@implementation BoardView


History *model;

int x = 10;
int y = 30;
int size = 37;
NSMutableArray *imageViews;

- (id) init{
	[self initWithFrame:CGRectMake(0, 0, 320, 480)];
	imageViews = [[NSMutableArray alloc] init];
	return self;
}

- (id) initWithModel:(History*)history{
	
	model = history;

	[[NSNotificationCenter defaultCenter]
	 addObserver:self
	 selector:@selector(changeEventHandler:)
	 name:[GlobalEvents CHANGE_EVENT]
	 object:history ];
	
	return [self init];
}

- (void) drawBoard{
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	int row;
	int column;
	
	for(row=0; row<8; row++){
		for (column=0; column<8; column++) {
			if(row % 2 == 0 && column % 2 == 0) CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
			else if(row % 2 != 0 && column % 2 != 0) CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
			else CGContextSetFillColorWithColor(context, [UIColor grayColor].CGColor);
			CGContextAddRect(context, CGRectMake(x+(size*column), y+(size*row), size, size));	
			CGContextFillPath(context);
		}
	}
}

- (void) drawRect:(CGRect)rect {
	[self drawBoard];
}

- (void) addPiece:(Piece*)piece :(int)column :(int)row{
	
	UIImage *image = [UIImage imageNamed:[[piece display] stringByAppendingString:@".png"]];
	
	PieceView *pieceView = [[PieceView alloc] initWithImage:image];
	pieceView.userInteractionEnabled = YES;
	pieceView.opaque = YES;
	pieceView.frame = CGRectMake(x+(column*size)+1.5, y+(row*size), 34, 34);
	pieceView.column = column;
	pieceView.row = row;
	 
	[self addSubview:pieceView];
	[imageViews addObject:pieceView];
	[pieceView release];
}

- (void) changeEventHandler: (NSNotification *) notification
{
	Piece *piece;
	int column;
	int row;
	
	[self removeAllImages];
	
	for (column = 0; column < 8; column++) {
		for (row=0; row<8; row++) {
			piece = [model.currentMove getSquare:column :row];
			if(![piece isKindOfClass:[NullPiece class]]){
				[self addPiece:piece :column :row];
			}
		}
	}
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch *touch = [touches anyObject];
	NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
    [userInfo setObject:touch forKey:[GlobalEvents MOUSEDOWN_EVENT_DATA]];
	[[NSNotificationCenter defaultCenter] postNotificationName:[GlobalEvents MOUSEDOWN_EVENT] object:self userInfo:userInfo];	
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch *touch = [touches anyObject];
	NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
    [userInfo setObject:touch forKey:[GlobalEvents MOUSEUP_EVENT_DATA]];
	[[NSNotificationCenter defaultCenter] postNotificationName:[GlobalEvents MOUSEUP_EVENT] object:self userInfo:userInfo];	
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{}


- (void) removeAllImages{
	for (int i=0; i<[imageViews count]; i++){
		[[imageViews objectAtIndex:i] removeFromSuperview];
	}
	[imageViews removeAllObjects];
}

- (void)dealloc {    [super dealloc];}
	


@end
