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
	return abs(move.fromColumn - move.toColumn) == 1;
}

- (BOOL) isColumnRangeEmpty:(Move *)move :(BOOL)includeFromSquare :(BOOL)includeToSquare{	

	int i;
	int start = 0 ? includeFromSquare : 1;
	int end = 0 ? includeToSquare : 1;
	
	if(move.fromRow < move.toRow){
		for (i=move.fromRow+start; i<=move.toRow-end; i++) {
			if (![self isSquareEmpty:i :move.fromRow]) return false;
		}
	}
	else{
		for (i=move.toRow+end; i<=move.fromRow-start; i++) {
			if (![self isSquareEmpty:i :move.fromRow]) return false;
		}
	}
	
	return true;
}

- (BOOL) isDiagonalRangeEmpty:(Move *) move{	
	
	int c;
	int r;
	
	if(move.fromColumn < move.toColumn){
		for (c=move.fromColumn; c<move.toColumn; c++) {
			
			if(move.fromRow < move.toRow){
				for (r=move.fromRow; r<move.toRow; r++) {
					if (![self isSquareEmpty:c :r]) return false;					
				}
			}
			else{
				for (r=move.toRow; r>move.fromRow; r--) {
					if (![self isSquareEmpty:c :r]) return false;					
				}
			}
			
		}
	}
	else{
		for (c=move.toColumn; c>move.fromColumn; c--) {
			
			if(move.fromRow < move.toRow){
				for (r=move.fromRow; r<move.toRow; r++) {
					if (![self isSquareEmpty:c :r]) return false;					
				}
			}
			else{
				for (r=move.toRow; r>move.fromRow; r--) {
					if (![self isSquareEmpty:c :r]) return false;					
				}
			}
			
		}
	}
	
	return true;
}

- (BOOL) isRowRangeEmpty:(Move *)move :(BOOL)includeFromSquare :(BOOL)includeToSquare{	
	
	int i;
	int start = 0 ? includeFromSquare : 1;
	int end = 0 ? includeToSquare : 1;

	if(move.fromRow < move.toRow){
		for (i=move.fromRow+start; i<=move.toRow-end; i++) {
			if (![self isSquareEmpty:move.fromColumn :i]) return false;
		}
	}
	else{
		for (i=move.toRow+end; i<=move.fromRow-start; i++) {
			if (![self isSquareEmpty:move.fromColumn :i]) return false;
		}
	}
	
	return true;
}


- (BOOL) isSquareEmpty:(ColumnEnum)column :(RowEnum)row{
	return [[self getSquare:column :row] isKindOfClass:[NullPiece class]];
}




@end
