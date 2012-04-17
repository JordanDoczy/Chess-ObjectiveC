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


- (BOOL) isColumnRangeEmpty:(Move *)move{
	return [self isColumnRangeEmpty:move.fromRow :move.fromColumn :move.toColumn];
}

- (BOOL) isColumnRangeEmpty:(RowEnum)row :(ColumnEnum)fromColumn :(ColumnEnum)toColumn{	
	
	if(fromColumn < toColumn){
		for (int i=fromColumn; i<toColumn; i++) {
			if (![self isSquareEmpty:i :row]) return false;
		}
	}
	else return [self isRowRangeEmpty:row :toColumn :fromColumn];
	
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

- (BOOL) isRangeEmpty:(Move *)move{
	
	if(move.fromColumn == move.toColumn) return [self isRowRangeEmpty:move];
	if(move.fromRow == move.toRow) return [self isColumnRangeEmpty:move];	
	else return [self isDiagonalRangeEmpty:move];
}

- (BOOL) isRangeEmptyBetween:(Move *)move{
	
	return true;
	//if(move.fromColumn == move.toColumn) return [self isRowRangeEmpty:move];
	//if(move.fromRow == move.toRow) return [self isColumnRangeEmpty:move];	
	//else return [self isDiagonalRangeEmpty:move];
}

// allow toItem to be piece?

- (BOOL) isRowRangeEmpty:(Move *)move{	
	return [self isRowRangeEmpty:move :true];
}

- (BOOL) isRowRangeEmpty:(Move *)move :(BOOL)includeToSquare{	
	
	int i;
	int offset = 0;
	if(!includeToSquare) offset = 1;

	if(move.fromRow < move.toRow){
		for (i=move.fromRow+1; i<=move.toRow-offset; i++) {
			if (![self isSquareEmpty:move.fromColumn :i]) return false;
		}
	}
	else{
		for (i=move.toRow+offset; i<=move.fromRow-1; i++) {
			if (![self isSquareEmpty:move.fromColumn :i]) return false;
		}
	}
	
	return true;
}

- (BOOL) isRowRangeEmpty:(ColumnEnum)column :(RowEnum)fromRow :(RowEnum)toRow{	
	
	if(fromRow < toRow){
		for (int i=fromRow+1; i<toRow; i++) {
			if (![self isSquareEmpty:column :i]) return false;
		}
	}
	else return [self isColumnRangeEmpty:column :toRow :fromRow];
	
	return true;
}

- (BOOL) isSquareEmpty:(ColumnEnum)column :(RowEnum)row{
	return [[self getSquare:column :row] isKindOfClass:[NullPiece class]];
}




@end
