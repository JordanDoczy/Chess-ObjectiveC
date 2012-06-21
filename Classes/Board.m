//
//  Board.m
//  Chess
//
//  Created by Jordan Doczy on 4/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Board.h"
#import "ColorEnum.h"
#import "ColumnEnum.h"
#import "Constants.h"
#import "Move.h"
#import "NullPiece.h"
#import "Piece.h"
#import "RowEnum.h"


@implementation Board

@synthesize squares;

- (void) clearSquare:(int)index{
	[self setSquare:index :[[NullPiece alloc] init]];
}
- (void) clearSquare:(int)column :(int)row{
	[self clearSquare:[Board getIndex:column :row]];
}
+ (int) getColumn:(int)index{
	return index%[Constants COLUMNS];
}
+ (int) getIndex:(int)column :(int)row{
	return (row*[Constants ROWS]) + column;
}
+ (int) getRow:(int)index{
	return floor(index/[Constants ROWS]);
}
- (id) getSquare:(int)index{
	return [squares objectAtIndex:index];
}
- (id) getSquare:(int)column :(int)row{
	return [self getSquare:[Board getIndex:column :row]];
}
- (void) setSquare:(int)index :(Piece*)piece{
	[squares replaceObjectAtIndex:index withObject:piece];
}
- (void) setSquare:(int)column :(int)row :(Piece*)piece{
	[self setSquare:[Board getIndex:column :row] :piece];
}
- (id) init{
	squares = [[NSMutableArray alloc] initWithCapacity:[Constants COLUMNS]*[Constants ROWS]];
	[self initSquares];
	return self;
}
- (void) initSquares{
	int i;
	for (i=0; i<[Constants COLUMNS]*[Constants ROWS]; i++) {
		[squares addObject:[[NullPiece alloc] init]];
	}
}

- (id) copyWithZone:(NSZone *)zone{
    Board *copy = [[[self class] allocWithZone: zone] init];
	copy.squares = [[NSMutableArray alloc] initWithArray:squares copyItems:NO];
	return copy;
}

- (BOOL) isAdjacentColumn:(Move *)move{
	return abs(move.fromSquare.column - move.toSquare.column) == 1;
}

- (BOOL) isColumnRangeEmpty:(Move *)move :(BOOL)includeFromSquare :(BOOL)includeToSquare{	

	int i;
	int start = includeFromSquare ? 0 : 1;
	int end = includeToSquare ? 0 : 1;
	
	if(move.fromSquare.row < move.toSquare.row){
		for (i=move.fromSquare.row+start; i<=move.toSquare.row-end; i++) {
			if (![self isSquareEmpty:i :move.fromSquare.row]) return false;
		}
	}
	else{
		for (i=move.toSquare.row+end; i<=move.fromSquare.row-start; i++) {
			if (![self isSquareEmpty:i :move.fromSquare.row]) return false;
		}
	}
	
	return true;
}

- (BOOL) isDiagonal:(Move *) move{
	return abs(move.fromSquare.column - move.toSquare.column) == abs(move.fromSquare.row - move.toSquare.row);
}

- (BOOL) isDiagonalRangeEmpty:(Move *) move :(BOOL)includeFromSquare :(BOOL)includeToSquare{	
	
	int start = includeFromSquare ? 0 : 1;
	int end = includeToSquare ? 0 : 1;
	
	int c=0;
	int r=0;
	
	if(move.fromSquare.column < move.toSquare.column && move.fromSquare.row < move.toSquare.row) {
		r=move.fromSquare.row+start;
		for (c=move.fromSquare.column+start; c<=move.toSquare.column-end; c++){
			if (![self isSquareEmpty:c :r]) return false;
			r++;
		}
	}
	if(move.fromSquare.column < move.toSquare.column && move.fromSquare.row > move.toSquare.row) {
		r=move.fromSquare.row-start;
		for (c=move.fromSquare.column+start; c<=move.toSquare.column-end; c++){
			if (![self isSquareEmpty:c :r]) return false;
			r--;
		}
	}
	if(move.fromSquare.column > move.toSquare.column && move.fromSquare.row < move.toSquare.row) {
		r=move.fromSquare.row+start;
		for (c=move.fromSquare.column-start; c>=move.toSquare.column+end; c--){
			if (![self isSquareEmpty:c :r]) return false;
			r++;
		}
	}
	if(move.fromSquare.column > move.toSquare.column && move.fromSquare.row > move.toSquare.row) {
		r=move.fromSquare.row-start;
		for (c=move.fromSquare.column-start; c>=move.toSquare.column+end; c--){
			if (![self isSquareEmpty:c :r]) return false;
			r--;
		}
	}
	
	return true;
}

- (BOOL) isRowRangeEmpty:(Move *)move :(BOOL)includeFromSquare :(BOOL)includeToSquare{	
	
	int i;
	int start = includeFromSquare ? 0 : 1;
	int end = includeToSquare ? 0 : 1;

	if(move.fromSquare.row < move.toSquare.row){
		for (i=move.fromSquare.row+start; i<=move.toSquare.row-end; i++) {
			if (![self isSquareEmpty:move.fromSquare.column :i]) return false;
		}
	}
	else{
		for (i=move.toSquare.row+end; i<=move.fromSquare.row-start; i++) {
			if (![self isSquareEmpty:move.fromSquare.column :i]) return false;
		}
	}
	
	return true;
}


- (BOOL) isSquareEmpty:(ColumnEnum)column :(RowEnum)row{
	return [[self getSquare:column :row] isKindOfClass:[NullPiece class]];
}

- (NSArray *) getPieces:(ColumnEnum)color{
	NSPredicate *pred = [NSPredicate predicateWithFormat:@"color == %i", color];
	return [squares filteredArrayUsingPredicate:pred];
}
- (NSArray *) getPieces{
	NSMutableArray *pieces = [[NSMutableArray alloc] init];
	[pieces addObjectsFromArray:[self getPieces:White]];
	[pieces addObjectsFromArray: [self getPieces:Black]];
	return pieces;
}


@end
